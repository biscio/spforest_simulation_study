# Code adapted from https://github.com/Bobby-Lu/XGBoostPP
# Used to reproduce the results from 
# Lu, C., Guan, Y., van Lieshout, M. C., & Xu, G. (2026). 
# XGBoostPP: Tree-based Estimation of Point Process Intensity Functions. 
# Journal of Computational and Graphical Statistics, 35(1), 229–240. 
# https://doi.org/10.1080/10618600.2025.2520582

## The package xgboost has its own parallelization,
## so we need to set the number of threads to 1 before loading xgboost
## to avoid conflicts with the package future.
Sys.setenv(
  OMP_NUM_THREADS = "1",
  OPENBLAS_NUM_THREADS = "1",
  MKL_NUM_THREADS = "1"
)

library(xgboost)
library(spatstat)

pptoxg <- function(pp, listcovar, type = "p", Fprime = NULL) {
  # Preliminaries to adapt original xgboost
  vol <- 1 / prod(dim(listcovar[[1]]))
  nx <- listcovar[[1]]$dim[1]
  ny <- listcovar[[1]]$dim[2]

  if (type != "DW") {
    Poisson_objective <- function(preds, dtrain) {
      labels <- getinfo(dtrain, "label")
      weights <- getinfo(dtrain, "weight")
      preds1 <- preds[labels > 0]
      preds2 <- preds[labels < 0]
      weights <- weights / sum(weights[labels < 0] * vol)
      grad1 <- rep(-1, length(preds1))
      grad2 <- exp(preds2) * vol
      grad <- c(grad1, grad2)
      hess1 <- rep(0, length(preds1))
      hess2 <- exp(preds2) * vol
      hess <- c(hess1, hess2)
      grad <- weights * grad
      hess <- weights * hess
      return(list(grad = grad, hess = hess))
    }
  } else {
    Poisson_objective <- function(preds, dtrain) {
      labels <- getinfo(dtrain, "label")
      preds1 <- preds[labels > 0]
      preds2 <- preds[labels < 0]
      weights <- 1 / (1 + exp(preds) * F_prime)
      weights <- weights / sum(weights[labels < 0] * vol)
      grad1 <- rep(-1, length(preds1))
      grad2 <- exp(preds2) * vol
      grad <- c(grad1, grad2)
      hess1 <- rep(0, length(preds1))
      hess2 <- exp(preds2) * vol
      hess <- c(hess1, hess2)
      grad <- weights * grad
      hess <- weights * hess
      return(list(grad = grad, hess = hess))
    }
  }

  Poisson_error <- function(preds, dtrain) {
    labels <- getinfo(dtrain, "label")
    preds1 <- preds[labels > 0]
    preds2 <- preds[labels < 0]
    err1 <- -preds1
    err2 <- exp(preds2) * vol
    err <- c(err1, err2)
    return(list(metric = "Error", value = sum(err * 1e-7)))
  }

  # convert pp in a data frame with label
  data <- data.frame(
    x = pp$x, y = pp$y,
    lapply(listcovar, function(i) {
      # i[pp]
      spatstat.geom::interp.im(Z = i, x = pp)
    })
  )
  colnames(data) <- c("x", "y", paste0("covar", seq_len(length(listcovar))))
  data$label <- 1

  ## Create dummys with label
  g <- expand.grid(1:ny, 1:nx)
  dummys <- data.frame(
    x = (2 * g$Var2 - 1) / (2 * ny), # need to revert to account for the y,x indexing of im.object.
    y = (2 * g$Var1 - 1) / (2 * nx),
    lapply(listcovar, function(i) {
      as.vector(i$v)
    })
  )
  colnames(dummys) <- c("x", "y", paste0("covar", seq_len(length(listcovar))))
  dummys$label <- -1

  data_train <- rbind(data, dummys)
  data_train$ids <- seq_len(nrow(data_train))

  # Declare xgboost model
  dtrain <- xgb.DMatrix(
    data.matrix(
      data_train[, paste0("covar", seq_len(length(listcovar)))]
    ),
    label = data.matrix(data_train$label),
    weight = rep(1, dim(data_train)[1])
  )

  return(list(
    dtrain = dtrain,
    Poisson_objective = Poisson_objective,
    Poisson_error = Poisson_error,
    data_train = data_train,
    dummys = dummys,
    data = data
  ))
}

xgboostppcv <- function(pp, listcovar,
                        gamma = c(0, 2),
                        lambda = c(10, 30, 50), # confusing naming from XGboostPP article
                        eta = c(0.1, 0.05, 0.01),
                        ncv = 3,
                        num_parallel_tree = 10,
                        nrounds = 600,
                        subsample = 0.5,
                        colsample_bynode = 1 / 3,
                        min_child_weight = 0.5,
                        type = "p",
                        nthread = 1,
                        ...) {
  grid <- expand.grid(
    eta = eta,
    lambda = lambda,
    gamma = gamma
  )

  # xgenv <- pptoxg(pp = pp, listcovar = listcovar, type = type)

  resultcv <- do.call(
    cbind,
    lapply(seq_len(nrow(grid)), function(k) {
      xgenv <- pptoxg(pp = pp, listcovar = listcovar, type = type) # Forced to be there as it is a non exportable object for future.

      eval_cvxg <- function(ppeta, pplambda, ppgamma) {
        listcv <- lapply(1:ncv, function(jj) {
          cv <- xgb.cv(
            eta = ppeta,
            alpha = pplambda,
            gamma = ppgamma,
            data = xgenv$dtrain,
            nrounds = nrounds,
            obj = xgenv$Poisson_objective,
            feval = xgenv$Poisson_error,
            nfold = 2,
            verbose = 0,
            num_parallel_tree = num_parallel_tree,
            subsample = subsample,
            colsample_bynode = colsample_bynode,
            min_child_weight = min_child_weight,
            lambda = 0,
            nthread = nthread
          )
          return(cv$evaluation_log$test_Error_mean)
        })
        return(Reduce("+", listcv))
      }

      eval_cvxg(
        ppeta = grid$eta[k],
        pplambda = grid$lambda[k],
        ppgamma = grid$gamma[k]
      )
    })
  )

  idparam <- which.min(apply(resultcv, 2, min))
  return(list(
    idparam = idparam,
    eta = grid[idparam, ]$eta,
    lambda = grid[idparam, ]$lambda,
    gamma = grid[idparam, ]$gamma,
    best_round = which.min(resultcv[, idparam])
  ))
}


xgboostpp <- function(pp, listcovar,
                      tune = FALSE,
                      nrounds = 200,
                      alpha = 10,
                      gamma = 0,
                      eta = 0.1,
                      verbose = 0,
                      num_parallel_tree = 10,
                      subsample = 0.5,
                      colsample_bynode = 1 / 3,
                      min_child_weight = 0.5,
                      sigma = 0.2,
                      type = "p",
                      nthread = 1,
                      ...) {
  xgenv <- pptoxg(pp = pp, listcovar = listcovar)

  if (!tune) {
    eta0 <- eta
    lambda0 <- alpha
    gamma0 <- gamma
    nrounds0 <- nrounds
  } else {
    # TODO: remove the hardcoded parameter if time allows,
    # but it is not a priority for now. The current tuning mimics the XGboostPP article
    paramcv <- xgboostppcv(pp, listcovar,
      gamma = c(0, 2),
      lambda = c(10, 30, 50), # confusing naming from XGboostPP article, this is alpha in the R package xgboost
      eta = c(0.1, 0.05, 0.01),
      ncv = 3,
      num_parallel_tree = num_parallel_tree,
      nrounds = nrounds,
      subsample = 0.5,
      colsample_bynode = 1 / 3,
      min_child_weight = 0.5,
      type = "p",
      nthread = nthread
    )

    eta0 <- paramcv$eta
    lambda0 <- paramcv$lambda
    gamma0 <- paramcv$gamma
    nrounds0 <- paramcv$best_round
  }

  modelxg <- xgboost(
    data = xgenv$dtrain,
    objective = xgenv$Poisson_objective,
    eval_metric = xgenv$Poisson_error,
    verbose = 0,
    nrounds = nrounds0,
    num_parallel_tree = num_parallel_tree,
    subsample = subsample,
    colsample_bynode = colsample_bynode,
    min_child_weight = min_child_weight,
    eta = eta0,
    lambda = 0,
    alpha = lambda0,
    gamma = gamma0,
    nthread = nthread,
    ...
  )

  valpred <- exp(predict(
    modelxg,
    data.matrix(
      xgenv$dummys[, !(names(xgenv$dummys) %in% c("x", "y", "label"))]
    )
  ))
  xgint <- im(
    matrix(valpred, nrow = 128, ncol = 128),
    yrange = listcovar[[1]]$yrange,
    xrange = listcovar[[1]]$xrange
  )


  if (type != "DW") {
    return(xgint)
  } else {
    preds_event <- exp(predict(
      modelxg,
      data.matrix(
        xgenv$data[, !(names(data) %in% c("x", "y", "label"))]
      )
    ))
    preds_dummy <- exp(predict(
      modelxg,
      data.matrix(
        xgenv$dummys[, !(names(dummys) %in% c("x", "y", "label"))]
      )
    ))
    K_prime <- Kinhom(pp,
      preds_event,
      r = seq(0, 10 * sigma, 0.01), correction = "trans"
    )
    F_prime <- K_prime$trans[2 * sigma / 0.01 + 1] - K_prime$theo[2 * sigma / 0.01 + 1]

    xgenvDW <- pptoxg(pp = pp, listcovar = listcovar, type = "DW", Fprime = F_prime)
    if (F_prime <= 0) {
      modelxgDW <- modelxg
    } else {
      if (!tune) {
        eta0 <- eta
        lambda0 <- lambda
        gamma0 <- gamma
        nrounds0 <- nrounds
      } else {
        # TODO: remove the hardcoded parameter if time allows,
        # but it is not a priority for now. The current tuning mimics the XGboostPP article
        paramcvDW <- xgboostppcv(pp, listcovar,
          gamma = c(0, 2),
          lambda = c(10, 30, 50), # confusing naming from XGboostPP article, this is alpha in the R package xgboost
          eta = c(0.1, 0.05, 0.01),
          ncv = 3,
          num_parallel_tree = num_parallel_tree,
          nrounds = nrounds,
          subsample = subsample,
          colsample_bynode = colsample_bynode,
          min_child_weight = min_child_weight,
          type = "DW"
        )

        eta0 <- paramcvDW$eta
        lambda0 <- paramcvDW$lambda
        gamma0 <- paramcvDW$gamma
        nrounds0 <- paramcvDW$best_round
      }


      modelxgDW <- xgboost(
        data = xgenvDW$dtrain,
        objective = xgenvDW$Poisson_objective,
        eval_metric = xgenvDW$Poisson_error,
        verbose = 0,
        nrounds = nrounds0,
        num_parallel_tree = num_parallel_tree,
        subsample = subsample,
        colsample_bynode = colsample_bynode,
        min_child_weight = min_child_weight,
        eta = eta0,
        lambda = 0,
        alpha = lambda0,
        gamma = gamma0,
        nthread = nthread,
        ...
      )
    }

    valpredDW <- exp(predict(
      modelxgDW,
      data.matrix(xgenvDW$dummys[, !(names(xgenvDW$dummys) %in% c("x", "y", "label"))])
    ))
    xgintDW <- im(
      matrix(valpredDW, nrow = 128, ncol = 128),
      yrange = listcovar[[1]]$yrange,
      xrange = listcovar[[1]]$xrange
    )
  }
}
