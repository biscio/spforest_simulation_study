# Loading the python code in python_env ----------------------------------
source(file = "files_Tables/03_prelim_python.R")

## NS - Number of covariates 2 (0 nuisance variables) --------------------

### beta = 0.5 - kappa = 100 - sigma = 0.02 ------------------------------
APPmiaeNS41b05k100s2 <- fmiaeAPP(
  x = NS41b05k100s2,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b05k100s2, file = "files_Tables/outputNS/APPmiaeNS41b05k100s2.RData")

### beta = 0.5 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS41b05k100s4 <- fmiaeAPP(
  x = NS41b05k100s4,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b05k100s4, file = "files_Tables/outputNS/APPmiaeNS41b05k100s4.RData")

### beta = 0.5 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS41b05k200s2 <- fmiaeAPP(
  x = NS41b05k200s2,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b05k200s2, file = "files_Tables/outputNS/APPmiaeNS41b05k200s2.RData")

### beta = 0.5 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS41b05k200s4 <- fmiaeAPP(
  x = NS41b05k200s4,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b05k200s4, file = "files_Tables/outputNS/APPmiaeNS41b05k200s4.RData")

### beta = 1.0 - kappa = 100 - sigma = 0.02 -------------------------------
APPmiaeNS41b1k100s2 <- fmiaeAPP(
  x = NS41b1k100s2,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b1k100s2, file = "files_Tables/outputNS/APPmiaeNS41b1k100s2.RData")

### beta = 1.0 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS41b1k100s4 <- fmiaeAPP(
  x = NS41b1k100s4,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b1k100s4, file = "files_Tables/outputNS/APPmiaeNS41b1k100s4")

### beta = 1.0 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS41b1k200s2 <- fmiaeAPP(
  x = NS41b1k200s2,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b1k200s2, file = "files_Tables/outputNS/APPmiaeNS41b1k200s2.RData")

### beta = 1.0 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS41b1k200s4 <- fmiaeAPP(
  x = NS41b1k200s4,
  covariates = covar41, section = "41"
)
save(APPmiaeNS41b1k200s4, file = "files_Tables/outputNS/APPmiaeNS41b1k200s4.RData")

print("APP MIAE computed - NS - 2 covariates (0 nuisance variables)")

## NS - Number of covariates 10 (4 nuisance variables) -------------------------------

### beta = 0.2 - kappa = 100 - sigma = 0.02 -------------------------------
APPmiaeNS42b02k100s2 <- fmiaeAPP(
  x = NS42b02k100s2,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b02k100s2, file = "files_Tables/outputNS/APPmiaeNS42b02k100s2.RData")

### beta = 0.2 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS42b02k100s4 <- fmiaeAPP(
  x = NS42b02k100s4,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b02k100s4, file = "files_Tables/outputNS/APPmiaeNS42b02k100s4.RData")

### beta = 0.2 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS42b02k200s2 <- fmiaeAPP(
  x = NS42b02k200s2,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b02k200s2, file = "files_Tables/outputNS/APPmiaeNS42b02k200s2.RData")

### beta = 0.2 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS42b02k200s4 <- fmiaeAPP(
  x = NS42b02k200s4,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b02k200s4, file = "files_Tables/outputNS/APPmiaeNS42b02k200s4.RData")

### beta = 0.4 - kappa = 100 - sigma = 0.02 -------------------------------
APPmiaeNS42b04k100s2 <- fmiaeAPP(
  x = NS42b04k100s2,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b04k100s2, file = "files_Tables/outputNS/APPmiaeNS42b04k100s2.RData")

### beta = 0.4 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS42b04k100s4 <- fmiaeAPP(
  x = NS42b04k100s4,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b04k100s4, file = "files_Tables/outputNS/APPmiaeNS42b04k100s4.RData")

### beta = 0.4 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS42b04k200s2 <- fmiaeAPP(
  x = NS42b04k200s2,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b04k200s2, file = "files_Tables/outputNS/APPmiaeNS42b04k200s2.RData")

### beta = 0.4 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS42b04k200s4 <- fmiaeAPP(
  x = NS42b04k200s4,
  covariates = covar42, section = "42"
)
save(APPmiaeNS42b04k200s4, file = "files_Tables/outputNS/APPmiaeNS42b04k200s4.RData")

print("APP MIAE computed - NS - 10 covariates (4 nuisance variables)")

## NS - Number of covariates 10 (8 nuisance variables) -------------------------------

### beta = 0.5 - kappa = 100 - sigma = 0.02 -------------------------------
APPmiaeNS43b05k100s2 <- fmiaeAPP(
  x = NS43b05k100s2,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b05k100s2, file = "files_Tables/outputNS/APPmiaeNS43b05k100s2.RData")

### beta = 0.5 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS43b05k100s4 <- fmiaeAPP(
  x = NS43b05k100s4,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b05k100s4, file = "files_Tables/outputNS/APPmiaeNS43b05k100s4.RData")

### beta = 0.5 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS43b05k200s2 <- fmiaeAPP(
  x = NS43b05k200s2,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b05k200s2, file = "files_Tables/outputNS/APPmiaeNS43b05k200s2.RData")

### beta = 0.5 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS43b05k200s4 <- fmiaeAPP(
  x = NS43b05k200s4,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b05k200s4, file = "files_Tables/outputNS/APPmiaeNS43b05k200s4.RData")

### beta = 1.0 - kappa = 100 - sigma = 0.02 -------------------------------
APPmiaeNS43b1k100s2 <- fmiaeAPP(
  x = NS43b1k100s2,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b1k100s2, file = "files_Tables/outputNS/APPmiaeNS43b1k100s2.RData")

### beta = 1.0 - kappa = 100 - sigma = 0.04 -------------------------------
APPmiaeNS43b1k100s4 <- fmiaeAPP(
  x = NS43b1k100s4,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b1k100s4, file = "files_Tables/outputNS/APPmiaeNS43b1k100s4.RData")

### beta = 1.0 - kappa = 200 - sigma = 0.02 -------------------------------
APPmiaeNS43b1k200s2 <- fmiaeAPP(
  x = NS43b1k200s2,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b1k200s2, file = "files_Tables/outputNS/APPmiaeNS43b1k200s2.RData")

### beta = 1.0 - kappa = 200 - sigma = 0.04 -------------------------------
APPmiaeNS43b1k200s4 <- fmiaeAPP(
  x = NS43b1k200s4,
  covariates = covar42, section = "43"
)
save(APPmiaeNS43b1k200s4, file = "files_Tables/outputNS/APPmiaeNS43b1k200s4.RData")

print("APP MIAE computed - NS - 10 covariates (8 nuisance variables)")
