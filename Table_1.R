source(file = "00_prelim.R")

message("No parallism is used. The computations should take approximately 14 hours.")

# Generating the data ----

## Code adapted from https://github.com/Bobby-Lu/XGBoostPP

Nsim <- 500 # Number of point patterns simulated for each scenarios
Ntree <- 200 # Number of trees used to compute the random intensity forests

## Generate the covariates ----

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


## Generate the point patterns ----

### Number of covariates 2 (0 nuisance variables) ----
beta <- 0.5
alpha41b05 <- 400 / mean(exp(beta * (covar41[[1]] + covar41[[2]])))
pp <- NULL
int41b05 <- alpha41b05 * exp(beta * (covar41[[1]] + covar41[[2]]))
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int41b05)
}
pp41b05 <- pp


beta <- 1
alpha41b1 <- 400 / mean(exp(beta * (covar41[[1]] + covar41[[2]])))
pp <- NULL
int41b1 <- alpha41b1 * exp(beta * (covar41[[1]] + covar41[[2]]))
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int41b1)
}
pp41b1 <- pp


### Number of covariates 10 (4 nuisance variables) ----

beta <- 0.2
pp <- NULL
baseint42b02 <- exp(beta * (
  covar42[[1]] +
    covar42[[2]] * covar42[[3]] / 2 +
    exp(covar42[[4]]) / 6 +
    covar42[[5]]^2 / 2 +
    3 * sin(covar42[[6]])
))
int42b02 <- (400 / mean(baseint42b02)) * baseint42b02
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int42b02)
}
pp42b02 <- pp


beta <- 0.4
baseint42b04 <- exp(beta * (
  covar42[[1]] +
    covar42[[2]] * covar42[[3]] / 2 +
    exp(covar42[[4]]) / 6 +
    covar42[[5]]^2 / 2 +
    3 * sin(covar42[[6]])
))
int42b04 <- (400 / mean(baseint42b04)) * baseint42b04
pp <- NULL
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int42b04)
}
pp42b04 <- pp



### Number of covariates 10 (2 nuisance variables) ----

beta <- 0.5
alpha43b05 <- 400 / mean(exp(beta * (covar42[[1]] + covar42[[2]])))
pp <- NULL
int43b05 <- alpha43b05 * exp(beta * (covar42[[1]] + covar42[[2]]))
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int43b05)
}
pp43b05 <- pp

beta <- 1
alpha43b1 <- 400 / mean(exp(beta * (covar42[[1]] + covar42[[2]])))
pp <- NULL
int43b1 <- alpha43b1 * exp(beta * (covar42[[1]] + covar42[[2]]))
for (job in 1:Nsim) {
  set.seed(job)
  pp[[job]] <- rpoispp(lambda = int43b1)
}
pp43b1 <- pp


# Computing the intensity random forest ----

### Function to compute the MIAE ----
fmiae <- function(x,
                  mtry = 1,
                  minpts = 20,
                  trueint,
                  Ntree = 200,
                  covariates) {
  rf <- lapply(x, FUN = function(i) {
    spforest(
      X = i,
      listcovariates = covariates,
      mtry = mtry,
      minpts = minpts,
      Ntree = Ntree
    )
  })

  iae <- sapply(rf, FUN = function(i) {
    spatstat.geom::integral.im(
      abs(as.im(i) - trueint)
    )
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}


## Number of covariates 2 (0 nuisance variables) ----

### Beta = 0.5 ----

fmiae(
  x = pp41b05,
  trueint = int41b05,
  covariates = covar41,
  mtry = 1,
  Ntree = Ntree
)


### Beta = 1 ----

fmiae(
  x = pp41b1,
  trueint = int41b1,
  covariates = covar41,
  mtry = 1,
  minpts = 10,
  Ntree = Ntree
)



## Number of covariates 10 (4 nuisance variables) ----
### Beta = 0.2 ----

fmiae(
  x = pp42b02,
  trueint = int42b02,
  covariates = covar42,
  mtry = 6,
  minpts = 60,
  Ntree = Ntree
)

## Beta = 0.5 ----

fmiae(
  x = pp42b04,
  trueint = int42b04,
  covariates = covar42,
  mtry = 5,
  minpts = 20,
  Ntree = Ntree
)


## Number of covariates 10 (2 nuisance variables) ----

### Beta = 0.5 ----

fmiae(
  x = pp43b05,
  trueint = int43b05,
  covariates = covar42,
  mtry = 6,
  minpts = 40,
  Ntree = Ntree
)

### Beta = 1 ----

fmiae(
  x = pp43b1,
  trueint = int43b1,
  covariates = covar42,
  mtry = 7,
  minpts = 20,
  Ntree = Ntree
)
