# Loading the python code in python_env ----------------------------------
source(file = "files_Tables/03_prelim_python.R")

# DPP - Number of covariates 2 (0 nuisance variables) --------------------

## DPP - Beta = 0.2 ------------------------------------------------------
APPmiaeDPP41b02 <- fmiaeAPP(
    x = DPP41b02,
    covariates = covar41, 
    section = "41"
)
save(APPmiaeDPP41b02, file = "files_Tables/outputDPP/APPmiaeDPP41b02.RData")

## DPP - Beta = 0.4 ------------------------------------------------------
APPmiaeDPP41b04 <- fmiaeAPP(
    x = DPP41b04,
    covariates = covar41, 
    section = "41"
)
save(APPmiaeDPP41b04, file = "files_Tables/outputDPP/APPmiaeDPP41b04.RData")

# DPP - Number of covariates 10 (4 nuisance variables) --------------------

## DPP - Beta = 0.1 -------------------------------------------------------
APPmiaeDPP42b01 <- fmiaeAPP(
    x = DPP42b01,
    covariates = covar42, 
    section = "42"
)
save(APPmiaeDPP42b01, file = "files_Tables/outputDPP/APPmiaeDPP42b01.RData")

## DPP - Beta = 0.2 -------------------------------------------------------
APPmiaeDPP42b02 <- fmiaeAPP(
    x = DPP42b02,
    covariates = covar42, 
    section = "42"
)
save(APPmiaeDPP42b02, file = "files_Tables/outputDPP/APPmiaeDPP42b02.RData")

# DPP - Number of covariates 10 (8 nuisance variables) --------------------

## DPP - Beta = 0.2 -------------------------------------------------------
APPmiaeDPP43b02 <- fmiaeAPP(
    x = DPP43b02,
    covariates = covar42, 
    section = "43"
)
save(APPmiaeDPP43b02, file = "files_Tables/outputDPP/APPmiaeDPP43b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
APPmiaeDPP43b04 <- fmiaeAPP(
    x = DPP43b04,
    covariates = covar42, 
    section = "43"
)
save(APPmiaeDPP43b04, file = "files_Tables/outputDPP/APPmiaeDPP43b04.RData")
