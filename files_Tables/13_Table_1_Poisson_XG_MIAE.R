# Poisson - Number of covariates 2 (0 nuisance variables) ---------------

## Poisson - Beta = 0.5 -------------------------------------------------
XGmiae41b05 <- fmiaeXG(
  x = pp41b05,
  covariates = covar41
)
save(XGmiae41b05, file = "files_Tables/outputPoisson/XGmiae41b05.RData")

## Poisson - Beta = 1 ---------------------------------------------------
XGmiae41b1 <- fmiaeXG(
  x = pp41b1,
  covariates = covar41
)
save(XGmiae41b1, file = "files_Tables/outputPoisson/XGmiae41b1.RData")

print("XGboostPP computed - Poisson - 2 covariates (0 nuisance variables)")

# Poisson - Number of covariates 10 (4 nuisance variables) ----------------

## Poisson - Beta = 0.2 ---------------------------------------------------
XGmiae42b02 <- fmiaeXG(
  x = pp42b02,
  covariates = covar42
)
save(XGmiae42b02, file = "files_Tables/outputPoisson/XGmiae42b02.RData")

## Poisson - Beta = 0.4 ---------------------------------------------------
XGmiae42b04 <- fmiaeXG(
  x = pp42b04,
  covariates = covar42
)
save(XGmiae42b04, file = "files_Tables/outputPoisson/XGmiae42b04.RData")

print("XGboostPP computed - Poisson - 10 covariates (4 nuisance variables)")

# Poisson - Number of covariates 10 (8 nuisance variables) ----------------

## Poisson - Beta = 0.5 ---------------------------------------------------
XGmiae43b05 <- fmiaeXG(
  x = pp43b05,
  covariates = covar42
)
save(XGmiae43b05, file = "files_Tables/outputPoisson/XGmiae43b05.RData")

## Poisson - Beta = 1 ---------------------------------------------------
tic <- proc.time()
XGmiae43b1 <- fmiaeXG(
  x = pp43b1,
  covariates = covar42
)
toc <- proc.time() - tic
toc
save(XGmiae43b1, file = "files_Tables/outputPoisson/XGmiae43b1.RData")

print("XGboostPP computed - Poisson - 10 covariates (8 nuisance variables)")
