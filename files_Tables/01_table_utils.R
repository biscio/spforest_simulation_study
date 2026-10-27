# Create the folders for the outputs --------------------------------------

if (!dir.exists("files_Tables/outputPoisson")) {
  dir.create("files_Tables/outputPoisson")
}
if (!dir.exists("files_Tables/outputLGCP")) {
  dir.create("files_Tables/outputLGCP")
}
if (!dir.exists("files_Tables/outputNS")) {
  dir.create("files_Tables/outputNS")
}
if (!dir.exists("files_Tables/outputDPP")) {
  dir.create("files_Tables/outputDPP")
}


# Generating the point patterns and covariates ----------------------------

## Generate the covariates ------------------------------------------------
## Code adapted from https://github.com/Bobby-Lu/XGBoostPP

### In 2026, the R package RandomFields is no longer available on CRAN.
### For convenience, the covariates have been generated
### and saved in covar41.RData and covar42.RData.
### If you want to re-generate them, you can install the package RandomFields
### from the CRAN archive and run the following code after removing the files
### files_Tables/covar41.RData and files_Tables/covar42.RData

if (file.exists("files_Tables/covar41.RData") &
  file.exists("files_Tables/covar42.RData")) {
  load("files_Tables/covar41.RData")
  load("files_Tables/covar42.RData")
} else {
  set.seed(6)

  library(spatstat)
  library(RandomFields)
  library(pracma)

  covar_model <- RMexp(var = 1, scale = 0.1) + RMnugget(var = 0) + RMtrend(mean = 0)
  from <- 0
  to <- 1
  x.seq <- seq(from, to, length = 128)
  y.seq <- seq(from, to, length = 128)
  simu <- RFsimulate(covar_model, x = x.seq, y = y.seq, grid = TRUE, n = 2)
  covar41 <- apply(attr(simu, which = "data"), 2, FUN = function(i) {
    as.im(Reshape(i, 128, 128), W = as.owin(c(0, 1, 0, 1)))
  })

  set.seed(6)
  covar_model <- RMexp(var = 1, scale = 0.1) + RMnugget(var = 0) + RMtrend(mean = 0)
  from <- 0
  to <- 1
  x.seq <- seq(from, to, length = 128)
  y.seq <- seq(from, to, length = 128)
  simu <- RFsimulate(covar_model, x = x.seq, y = y.seq, grid = TRUE, n = 10)

  covar42 <- apply(attr(simu, which = "data"), 2, FUN = function(i) {
    as.im(Reshape(i, 128, 128), W = as.owin(c(0, 1, 0, 1)))
  })
  save(covar41, file = "files_Tables/covar41.RData")
  save(covar42, file = "files_Tables/covar42.RData")
}

### True intensity from Section 4.2 in
### "XGBoostPP: Tree-based Estimation of Point Process Intensity Function"
poly42 <- covar42[[1]] +
  covar42[[2]] * covar42[[3]] / 2 +
  exp(covar42[[4]]) / 6 +
  covar42[[5]]^2 / 2 +
  3 * sin(covar42[[6]])

# Functions to generate the point patterns --------------------------------

## Function to generate Poisson point patterns ----------------------------

genpoi <- function(beta, avpoint, pol, Nsim) {
  alpha <- avpoint / mean(exp(beta * pol))
  pp <- NULL
  int <- alpha * exp(beta * pol)
  for (job in 1:Nsim) {
    set.seed(job)
    pp[[job]] <- rpoispp(lambda = int)
  }
  return(list(pp = pp, int = int))
}

## Function to generate LGCP point patterns  -------------------------------

genLGCP <- function(path = "files_Tables/outputLGCP",
                    object_name,
                    beta, avpoint,
                    pol, var,
                    sigscale, Nsim) {
  full_path <- file.path(path, paste0(object_name, ".RData"))

  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }

  alpha <- avpoint / mean(exp(beta * pol + var / 2))
  pp <- NULL
  mu <- log(alpha) + beta * pol
  for (job in 1:Nsim) {
    set.seed(job)
    pp[[job]] <- rLGCP(
      model = "exp",
      mu = mu,
      var = var,
      scale = sigscale
    )
  }

  obj <- list(pp = pp, int = exp(mu + var / 2))
  assign(object_name, obj)
  save(list = object_name, file = full_path)

  return(obj)
}


## Function to generate Neyman-Scott point patterns  -----------------------

genNS <- function(path = "files_Tables/outputNS",
                  object_name,
                  beta, avpoint,
                  pol, rho,
                  sigscale, Nsim) {
  full_path <- file.path(path, paste0(object_name, ".RData"))

  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }


  log_intensity_max <- max(beta * pol)
  alpha <- avpoint / mean(exp(log(rho) + beta * pol))
  pp <- NULL
  for (job in 1:Nsim) {
    set.seed(job)
    pp[[job]] <- rThomas(
      kappa = rho,
      scale = sigscale,
      mu = alpha * exp(log_intensity_max)
    )
    pp[[job]] <- rthin(pp[[job]], exp(beta * pol) / exp(log_intensity_max))
  }

  obj <- list(pp = pp, int = exp(beta * pol) * rho * alpha)
  assign(object_name, obj)
  save(list = object_name, file = full_path)

  return(obj)
}

## Function to generate Determinantal point patterns  ----------------------

### For fast simulation of Determinantal Point Processes  ------------------
if (!requireNamespace("rcdpp")) {
  pak::pkg_install("AdriMaz/rcdpp")
}
library(rcdpp)

rLGDPP <- function(rho = 100,
                   dppthin = 1,
                   nsim = 1,
                   win = square(1),
                   tolalpha = 0.95) {
  Zthin <- dppthin
  if (range(Zthin)[1] < 0) {
    Zthin <- dppthin + min(dppthin)
  }
  if (range(Zthin)[2] > 1) {
    Zthin <- Zthin / max(Zthin)
  }

  rhoG <- rho / mean(Zthin)
  alphaG <- rhoG^(-1 / 2) / sqrt(pi) * tolalpha

  X <- future_lapply(1:nsim, FUN = function(j) {
    rdppC(
      d = 2,
      param = list(rho = rhoG, alpha = alphaG, k = 100),
      model = "G"
    )
  }, future.seed = TRUE)
  # model <- dppGauss(lambda = rhoG, alpha = alphaG, d = 2)
  # X <- future_lapply(1:nsim, FUN = function(j) {
  #   simulate(model, nsim = 1, W = win)
  # }, future.seed = TRUE)

  return(solapply(X = X, rthin, P = Zthin))
}

# Testing
# Z <- exp(rGRFgauss(W = square(1), mu = 0, var = 0.1, scale = 0.1))
# X <- rLGDPP(
#   rho = 500,
#   win = square(1),
#   dppthin = Z,
#   nsim = 2
# )
# sapply(X, npoints) |> mean()

genDPP <- function(beta, avpoint, pol, Nsim) {
  Z <- exp(beta * pol) / max(exp(beta * pol))
  pp <- rLGDPP(
    rho = avpoint,
    win = square(1),
    dppthin = Z,
    nsim = Nsim
  )
  return(list(pp = pp, int = avpoint * Z / mean(Z)))
}

# Function to compute the MIAE with spforest -----------------------------
fmiae <- function(x,
                  mtry = 1,
                  minpts = 20,
                  Ntree = 200,
                  covariates) {
  rf <- lapply(x$pp, FUN = function(i) {
    spforest(
      X = i,
      listcovariates = covariates,
      mtry = mtry,
      minpts = minpts,
      Ntree = Ntree,
      parallel = FALSE
    )
  })

  iae <- sapply(rf, FUN = function(i) {
    spatstat.geom::integral.im(
      abs(as.im(i) - x$int)
    )
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}

# Function to compute the MIAE with the best hyperparameters or RoT ---------
fmiaeRF <- function(x,
                    alloob,
                    Ntree = 200,
                    covariates) {
  idoob <- lapply(alloob, FUN = function(i) {
    idbest <- which.max(i$OOB)
    i[idbest, c("mtry", "minpts", "minvol")]
  })

  rf <- future_lapply(seq_along(x$pp), FUN = function(i) {
    # Remark: hyperparameters of minvol hardcoded !
    if (idoob[[i]]$minvol <= min(c(0.01, 0.05, 0.1, 0.15, 0.20))) {
      # if (idoob[[i]]$minvol <= min(c(0.005, 0.01, 0.015, 0.02, 0.05))) {    
      return(spforest(
        X = x$pp[[i]],
        listcovariates = covariates,
        mtry = ceiling(2 / 3 * length(covariates)),
        minvol = area_choice(x$pp[[i]]),
        minpts = 10,
        Ntree = Ntree,
        parallel = FALSE
      ))
    } else {
      return(spforest(
        X = x$pp[[i]],
        listcovariates = covariates,
        mtry = idoob[[i]]$mtry,
        minvol = idoob[[i]]$minvol,
        minpts = idoob[[i]]$minpts,
        Ntree = Ntree,
        parallel = FALSE
      ))
    }
  }, future.seed = TRUE)

  iae <- sapply(rf, FUN = function(i) {
    spatstat.geom::integral.im(
      abs(as.im(i) - x$int)
    )
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}

# Function to compute the MIAE with minvol criterion by Rule of Thumb ----
fmiaeRFrot <- function(x,
                       Ntree = 200,
                       covariates) {
  rf <- future_lapply(seq_along(x$pp), FUN = function(i) {
    spforest(
      X = x$pp[[i]],
      listcovariates = covariates,
      mtry = ceiling(2 / 3 * length(covariates)),
      minpts = 5,
      minvol = area_choice(x$pp[[i]]),
      Ntree = Ntree,
      parallel = FALSE
    )
  }, future.seed = TRUE)

  iae <- sapply(rf, FUN = function(i) {
    spatstat.geom::integral.im(
      abs(as.im(i) - x$int)
    )
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}

# Function to compute the MIAE XGboostPP ---------------------------------
source(file = "files_Tables/02_xgboostpp.R")

fmiaeXG <- function(x,
                    covariates,
                    nrounds = 600,
                    tune = TRUE,
                    type = "p") {
  XGint <- future_lapply(x$pp,
    FUN = function(i) {
      xgboostpp(i,
        listcovar = covariates,
        nrounds = nrounds,
        tune = tune,
        num_parallel_tree = 10,
        nthread = 1,
        type = type
      )
    },
    future.seed = T
  )

  iae <- sapply(XGint, FUN = function(i) {
    spatstat.geom::integral.im(
      abs(i - x$int)
    )
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}
