# DPP - Number of covariates 2 (0 nuisance variables) ---------------------

## DPP - Beta = 0.2 -------------------------------------------------------
XGmiaeDPP41b02 <- fmiaeXG(
    x = DPP41b02,
    covariates = covar41
)
save(XGmiaeDPP41b02, file = "files_Tables/outputDPP/XGmiaeDPP41b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
XGmiaeDPP41b04 <- fmiaeXG(
    x = DPP41b04,
    covariates = covar41
)
save(XGmiaeDPP41b04, file = "files_Tables/outputDPP/XGmiaeDPP41b04.RData")

# DPP - Number of covariates 10 (4 nuisance variables) --------------------

## DPP - Beta = 0.1 -------------------------------------------------------
XGmiaeDPP42b01 <- fmiaeXG(
    x = DPP42b01,
    covariates = covar42
)
save(XGmiaeDPP42b01, file = "files_Tables/outputDPP/XGmiaeDPP42b01.RData")

## DPP - Beta = 0.2 -------------------------------------------------------
XGmiaeDPP42b02 <- fmiaeXG(
    x = DPP42b02,
    covariates = covar42
)
save(XGmiaeDPP42b02, file = "files_Tables/outputDPP/XGmiaeDPP42b02.RData")

# DPP - Number of covariates 10 (8 nuisance variables) --------------------

## DPP - Beta = 0.2 -------------------------------------------------------
XGmiaeDPP43b02 <- fmiaeXG(
    x = DPP43b02,
    covariates = covar42
)
save(XGmiaeDPP43b02, file = "files_Tables/outputDPP/XGmiaeDPP43b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
XGmiaeDPP43b04 <- fmiaeXG(
    x = DPP43b04,
    covariates = covar42
)
save(XGmiaeDPP43b04, file = "files_Tables/outputDPP/XGmiaeDPP43b04.RData")
