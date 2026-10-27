library(spforest)
library(spatstat)
library(future)
library(future.apply)
source(file = "files_Tables/01_table_utils.R")

Nsim <- 500 # Number of point patterns simulated for each scenarios
Ntree <- 200 # Number of trees used to compute the random intensity forests

# To activate/deactivate parallelism  -------------------------------------
#plan("sequential") # Uncomment to deactivate parallelism (default)
plan("multisession", workers = 50) # Uncomment to activate parallelism

# DPP - Number of covariates 2 (0 nuisance variables) ---------------------

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP41b02.RData")

miaeDPProt41b02 <- fmiaeRFrot(
    x = DPP41b02,
    covariates = covar41
)
save(miaeDPProt41b02, file = "files_Tables/outputDPP/miaeDPProt41b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP41b04.RData")

miaeDPProt41b04 <- fmiaeRFrot(
    x = DPP41b04,
    covariates = covar41
)
save(miaeDPProt41b04, file = "files_Tables/outputDPP/miaeDPProt41b04.RData")

# DPP - Number of covariates 10 (4 nuisance variables) -------------------

## DPP - Beta = 0.1 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP42b01.RData")

miaeDPProt42b01 <- fmiaeRFrot(
    x = DPP42b01,
    covariates = covar42
)
save(miaeDPProt42b01, file = "files_Tables/outputDPP/miaeDPProt42b01.RData")

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP42b02.RData")

miaeDPProt42b02 <- fmiaeRFrot(
    x = DPP42b02,
    covariates = covar42
)
save(miaeDPProt42b02, file = "files_Tables/outputDPP/miaeDPProt42b02.RData")

# DPP - Number of covariates 10 (8 nuisance variables) --------------------

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP43b02.RData")

miaeDPProt43b02 <- fmiaeRFrot(
    x = DPP43b02,
    covariates = covar42
)
save(miaeDPProt43b02, file = "files_Tables/outputDPP/miaeDPProt43b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP43b04.RData")

miaeDPProt43b04 <- fmiaeRFrot(
    x = DPP43b04,
    covariates = covar42
)
save(miaeDPProt43b04, file = "files_Tables/outputDPP/miaeDPProt43b04.RData")


plan("sequential")
