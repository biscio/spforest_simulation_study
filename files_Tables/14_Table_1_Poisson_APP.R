# Loading the python code in python_env ----------------------------------
source(file = "files_Tables/03_prelim_python.R")

# Poisson - Number of covariates 2 (0 nuisance variables) ---------------

## Poisson - Beta = 0.5 -------------------------------------------------
APPmiae41b05 <- fmiaeAPP(
  x = pp41b05,
  section = "41",
  covariates = covar41
)
save(APPmiae41b05, file = "files_Tables/outputPoisson/APPmiae41b05.RData")

# Poisson - Beta = 1 ---------------------------------------------------
APPmiae41b1 <- fmiaeAPP(
  x = pp41b1,
  section = "41",
  covariates = covar41
)
save(APPmiae41b1, file = "files_Tables/outputPoisson/APPmiae41b1.RData")

print("MIAE computed - Poisson - 2 covariates (0 nuisance variables)")

# Poisson - Number of covariates 10 (4 nuisance variables) ----------------

## Poisson - Beta = 0.2 ---------------------------------------------------
APPmiae42b02 <- fmiaeAPP(
  x = pp42b02,
  section = "42",
  covariates = covar42
)
save(APPmiae42b02, file = "files_Tables/outputPoisson/APPmiae42b02.RData")

## Poisson - Beta = 0.4 ---------------------------------------------------
APPmiae42b04 <- fmiaeAPP(
  x = pp42b04,
  section = "42",
  covariates = covar42
)
save(APPmiae42b04, file = "files_Tables/outputPoisson/APPmiae42b04.RData")

print("OOB computed - Poisson - 10 covariates (4 nuisance variables)")

# Poisson - Number of covariates 10 (8 nuisance variables) ----------------

## Poisson - Beta = 0.5 ---------------------------------------------------
APPmiae43b05 <- fmiaeAPP(
  x = pp43b05,
  section = "43",
  covariates = covar42
)
save(APPmiae43b05, file = "files_Tables/outputPoisson/APPmiae43b05.RData")

## Poisson - Beta = 1 ---------------------------------------------------
APPmiae43b1 <- fmiaeAPP(
  x = pp43b1,
  section = "43",
  covariates = covar42
)
save(APPmiae43b1, file = "files_Tables/outputPoisson/APPmiae43b1.RData")

print("OOB computed - Poisson - 10 covariates (8 nuisance variables)")
