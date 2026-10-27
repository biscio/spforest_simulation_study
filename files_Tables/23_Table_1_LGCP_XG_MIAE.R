# LGCP - Number of covariates 2 (0 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.2 ------------------------------
XGmiaeLGCP41b05v1s2 <- fmiaeXG(
  x = LGCP41b05v1s2,
  covariates = covar41
)
save(XGmiaeLGCP41b05v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP41b05v1s2.RData")

## Beta = 0.5 - variance = 1.0 - scale = 0.4 ------------------------------
XGmiaeLGCP41b05v1s4 <- fmiaeXG(
  x = LGCP41b05v1s4,
  covariates = covar41
)
save(XGmiaeLGCP41b05v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP41b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP41b05v2s2 <- fmiaeXG(
  x = LGCP41b05v2s2,
  covariates = covar41
)
save(XGmiaeLGCP41b05v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP41b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP41b05v2s4 <- fmiaeXG(
  x = LGCP41b05v2s4,
  covariates = covar41
)
save(XGmiaeLGCP41b05v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP41b05v2s4.RData")

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
XGmiaeLGCP41b1v1s2 <- fmiaeXG(
  x = LGCP41b1v1s2,
  covariates = covar41
)
save(XGmiaeLGCP41b1v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP41b1v1s2.RData")


## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
XGmiaeLGCP41b1v1s4 <- fmiaeXG(
  x = LGCP41b1v1s4,
  covariates = covar41
)
save(XGmiaeLGCP41b1v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP41b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP41b1v2s2 <- fmiaeXG(
  x = LGCP41b1v2s2,
  covariates = covar41
)
save(XGmiaeLGCP41b1v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP41b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP41b1v2s4 <- fmiaeXG(
  x = LGCP41b1v2s4,
  covariates = covar41
)
save(XGmiaeLGCP41b1v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP41b1v2s4.RData")

print("XGboostPP Miae computed - LGCP - 2 covariates (0 nuisance variables)")

# LGCP - Number of covariates 10 (4 nuisance variables) --------------------

## Beta = 0.4 - variance = 1.0 - scale = 0.02 ------------------------------
XGmiaeLGCP42b04v1s2 <- fmiaeXG(
  x = LGCP42b04v1s2,
  covariates = covar42
)
save(XGmiaeLGCP42b04v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP42b04v1s2.RData")


## Beta = 0.4 - variance = 1.0 - scale = 0.04 ------------------------------
XGmiaeLGCP42b04v1s4 <- fmiaeXG(
  x = LGCP42b04v1s4,
  covariates = covar42
)
save(XGmiaeLGCP42b04v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP42b04v1s4.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP42b04v2s2 <- fmiaeXG(
  x = LGCP42b04v2s2,
  covariates = covar42
)
save(XGmiaeLGCP42b04v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP42b04v2s2.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP42b04v2s4 <- fmiaeXG(
  x = LGCP42b04v2s4,
  covariates = covar42
)
save(XGmiaeLGCP42b04v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP42b04v2s4.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.02 ------------------------------
XGmiaeLGCP42b02v1s2 <- fmiaeXG(
  x = LGCP42b02v1s2,
  covariates = covar42
)
save(XGmiaeLGCP42b02v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP42b02v1s2.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.04 ------------------------------
XGmiaeLGCP42b02v1s4 <- fmiaeXG(
  x = LGCP42b02v1s4,
  covariates = covar42
)
save(XGmiaeLGCP42b02v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP42b02v1s4.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP42b02v2s2 <- fmiaeXG(
  x = LGCP42b02v2s2,
  covariates = covar42
)
save(XGmiaeLGCP42b02v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP42b02v2s2.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP42b02v2s4 <- fmiaeXG(
  x = LGCP42b02v2s4,
  covariates = covar42
)
save(XGmiaeLGCP42b02v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP42b02v2s4.RData")

print("XGboostPP Miae computed - LGCP - 10 covariates (4 nuisance variables)")

# LGCP - Number of covariates 10 (8 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ------------------------------
XGmiaeLGCP43b05v1s2 <- fmiaeXG(
  x = LGCP43b05v1s2,
  covariates = covar42
)
save(XGmiaeLGCP43b05v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP43b05v1s2.RData")

## Beta = 0.5 - variance = 1.0 - scale = 0.04 ------------------------------
XGmiaeLGCP43b05v1s4 <- fmiaeXG(
  x = LGCP43b05v1s4,
  covariates = covar42
)
save(XGmiaeLGCP43b05v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP43b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP43b05v2s2 <- fmiaeXG(
  x = LGCP43b05v2s2,
  covariates = covar42
)
save(XGmiaeLGCP43b05v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP43b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP43b05v2s4 <- fmiaeXG(
  x = LGCP43b05v2s4,
  covariates = covar42
)
save(XGmiaeLGCP43b05v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP43b05v2s4.RData")

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
XGmiaeLGCP43b1v1s2 <- fmiaeXG(
  x = LGCP43b1v1s2,
  covariates = covar42
)
save(XGmiaeLGCP43b1v1s2, file = "files_Tables/outputLGCP/XGmiaeLGCP43b1v1s2.RData")

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
XGmiaeLGCP43b1v1s4 <- fmiaeXG(
  x = LGCP43b1v1s4,
  covariates = covar42
)
save(XGmiaeLGCP43b1v1s4, file = "files_Tables/outputLGCP/XGmiaeLGCP43b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
XGmiaeLGCP43b1v2s2 <- fmiaeXG(
  x = LGCP43b1v2s2,
  covariates = covar42
)
save(XGmiaeLGCP43b1v2s2, file = "files_Tables/outputLGCP/XGmiaeLGCP43b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
XGmiaeLGCP43b1v2s4 <- fmiaeXG(
  x = LGCP43b1v2s4,
  covariates = covar42
)
save(XGmiaeLGCP43b1v2s4, file = "files_Tables/outputLGCP/XGmiaeLGCP43b1v2s4.RData")

print("XGboostPP Miae computed - LGCP - 10 covariates (8 nuisance variables)")

