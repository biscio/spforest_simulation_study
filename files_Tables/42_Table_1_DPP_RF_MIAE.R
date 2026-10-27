# DPP - Number of covariates 2 (0 nuisance variables) ---------------------

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP41b02.RData")
OOBDPP41b02 <- readRDS(file = "files_Tables/outputDPP/OOBDPP41b02.rds")

miaeDPP41b02 <- fmiaeRF(
  x = DPP41b02,
  alloob = OOBDPP41b02,
  covariates = covar41
)
save(miaeDPP41b02, file = "files_Tables/outputDPP/miaeDPP41b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP41b04.RData")
OOBDPP41b04 <- readRDS(file = "files_Tables/outputDPP/OOBDPP41b04.rds")

miaeDPP41b04 <- fmiaeRF(
  x = DPP41b04,
  alloob = OOBDPP41b04,
  covariates = covar41
)
save(miaeDPP41b04, file = "files_Tables/outputDPP/miaeDPP41b04.RData")

# DPP - Number of covariates 10 (4 nuisance variables) -------------------

## DPP - Beta = 0.1 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP42b01.RData")
OOBDPP42b01 <- readRDS(file = "files_Tables/outputDPP/OOBDPP42b01.rds")

miaeDPP42b01 <- fmiaeRF(
  x = DPP42b01,
  alloob = OOBDPP42b01,
  covariates = covar42
)
save(miaeDPP42b01, file = "files_Tables/outputDPP/miaeDPP42b01.RData")

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP42b02.RData")
OOBDPP42b02 <- readRDS(file = "files_Tables/outputDPP/OOBDPP42b02.rds")

miaeDPP42b02 <- fmiaeRF(
  x = DPP42b02,
  alloob = OOBDPP42b02,
  covariates = covar42
)
save(miaeDPP42b02, file = "files_Tables/outputDPP/miaeDPP42b02.RData")

# DPP - Number of covariates 10 (8 nuisance variables) --------------------

## DPP - Beta = 0.2 -------------------------------------------------------
load(file = "files_Tables/outputDPP/DPP43b02.RData")
OOBDPP43b02 <- readRDS(file = "files_Tables/outputDPP/OOBDPP43b02.rds")

miaeDPP43b02 <- fmiaeRF(
  x = DPP43b02,
  alloob = OOBDPP43b02,
  covariates = covar42
)
save(miaeDPP43b02, file = "files_Tables/outputDPP/miaeDPP43b02.RData")

## DPP - Beta = 0.4 -------------------------------------------------------
tic <- proc.time()
load(file = "files_Tables/outputDPP/DPP43b04.RData")
OOBDPP43b04 <- readRDS(file = "files_Tables/outputDPP/OOBDPP43b04.rds")

miaeDPP43b04 <- fmiaeRF(
  x = DPP43b04,
  alloob = OOBDPP43b04,
  covariates = covar42
)
save(miaeDPP43b04, file = "files_Tables/outputDPP/miaeDPP43b04.RData")

