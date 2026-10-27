# Loading the python code in python_env ----------------------------------
source(file = "files_Tables/03_prelim_python.R")

# Reminder: alpha <- 400 / mean(exp(beta * pol + var / 2))

# LGCP - Number of covariates 2 (0 nuisance variables) -------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP41b05v1s2 <- fmiaeAPP(
  x = LGCP41b05v1s2,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b05v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP41b05v1s2.RData")

## Beta = 0.5 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP41b05v1s4 <- fmiaeAPP(
  x = LGCP41b05v1s4,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b05v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP41b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP41b05v2s2 <- fmiaeAPP(
  x = LGCP41b05v2s2,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b05v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP41b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP41b05v2s4 <- fmiaeAPP(
  x = LGCP41b05v2s4,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b05v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP41b05v2s4.RData")

## Beta = 1 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP41b1v1s2 <- fmiaeAPP(
  x = LGCP41b1v1s2,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b1v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP41b1v1s2.RData")

## Beta = 1 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP41b1v1s4 <- fmiaeAPP(
  x = LGCP41b1v1s4,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b1v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP41b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP41b1v2s2 <- fmiaeAPP(
  x = LGCP41b1v2s2,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b1v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP41b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP41b1v2s4 <- fmiaeAPP(
  x = LGCP41b1v2s4,
  section = "41",
  covariates = covar41
)
save(APPmiaeLGCP41b1v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP41b1v2s4.RData")

print("APP Miae computed - LGCP - 2 covariates (0 nuisance variables)")

# LGCP - Number of covariates 10 (4 nuisance variables) ----------------------------

## Beta = 0.4 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP42b04v1s2 <- fmiaeAPP(
  x = LGCP42b04v1s2,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b04v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP42b04v1s2.RData")


## Beta = 0.4 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP42b04v1s4 <- fmiaeAPP(
  x = LGCP42b04v1s4,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b04v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP42b04v1s4.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP42b04v2s2 <- fmiaeAPP(
  x = LGCP42b04v2s2,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b04v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP42b04v2s2.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP42b04v2s4 <- fmiaeAPP(
  x = LGCP42b04v2s4,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b04v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP42b04v2s4.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP42b02v1s2 <- fmiaeAPP(
  x = LGCP42b02v1s2,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b02v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP42b02v1s2.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP42b02v1s4 <- fmiaeAPP(
  x = LGCP42b02v1s4,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b02v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP42b02v1s4.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP42b02v2s2 <- fmiaeAPP(
  x = LGCP42b02v2s2,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b02v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP42b02v2s2.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP42b02v2s4 <- fmiaeAPP(
  x = LGCP42b02v2s4,
  section = "42",
  covariates = covar42
)
save(APPmiaeLGCP42b02v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP42b02v2s4.RData")

print("APP Miae computed - LGCP - 10 covariates (4 nuisance variables)")

# LGCP - Number of covariates 10 (8 nuisance variables) ----------------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP43b05v1s2 <- fmiaeAPP(
  x = LGCP43b05v1s2,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b05v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP43b05v1s2.RData")

## Beta = 0.5 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP43b05v1s4 <- fmiaeAPP(
  x = LGCP43b05v1s4,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b05v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP43b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP43b05v2s2 <- fmiaeAPP(
  x = LGCP43b05v2s2,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b05v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP43b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP43b05v2s4 <- fmiaeAPP(
  x = LGCP43b05v2s4,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b05v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP43b05v2s4.RData")

## Beta = 1 - variance = 1.0 - scale = 0.02 ----------------------------
APPmiaeLGCP43b1v1s2 <- fmiaeAPP(
  x = LGCP43b1v1s2,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b1v1s2, file = "files_Tables/outputLGCP/APPmiaeLGCP43b1v1s2.RData")

## Beta = 1 - variance = 1.0 - scale = 0.04 ----------------------------
APPmiaeLGCP43b1v1s4 <- fmiaeAPP(
  x = LGCP43b1v1s4,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b1v1s4, file = "files_Tables/outputLGCP/APPmiaeLGCP43b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ----------------------------
APPmiaeLGCP43b1v2s2 <- fmiaeAPP(
  x = LGCP43b1v2s2,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b1v2s2, file = "files_Tables/outputLGCP/APPmiaeLGCP43b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ----------------------------
APPmiaeLGCP43b1v2s4 <- fmiaeAPP(
  x = LGCP43b1v2s4,
  section = "43",
  covariates = covar42
)
save(APPmiaeLGCP43b1v2s4, file = "files_Tables/outputLGCP/APPmiaeLGCP43b1v2s4.RData")

print("APP Miae computed - LGCP - 10 covariates (8 nuisance variables)")
