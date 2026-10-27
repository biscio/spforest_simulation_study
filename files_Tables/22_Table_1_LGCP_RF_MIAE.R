# LGCP - Number of covariates 2 (0 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.2 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b05v1s2.RData")
OOBLGCP41b05v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b05v1s2.rds")

miaeLGCP41b05v1s2 <- fmiaeRF(
  x = LGCP41b05v1s2,
  alloob = OOBLGCP41b05v1s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b05v1s2, file = "files_Tables/outputLGCP/miaeLGCP41b05v1s2.RData")

## Beta = 0.5 - variance = 1.0 - scale = 0.4 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b05v1s4.RData")
OOBLGCP41b05v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b05v1s4.rds")

miaeLGCP41b05v1s4 <- fmiaeRF(
  x = LGCP41b05v1s4,
  alloob = OOBLGCP41b05v1s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b05v1s4, file = "files_Tables/outputLGCP/miaeLGCP41b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b05v2s2.RData")
OOBLGCP41b05v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b05v2s2.rds")

miaeLGCP41b05v2s2 <- fmiaeRF(
  x = LGCP41b05v2s2,
  alloob = OOBLGCP41b05v2s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b05v2s2, file = "files_Tables/outputLGCP/miaeLGCP41b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b05v2s4.RData")
OOBLGCP41b05v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b05v2s4.rds")

miaeLGCP41b05v2s4 <- fmiaeRF(
  x = LGCP41b05v2s4,
  alloob = OOBLGCP41b05v2s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b05v2s4, file = "files_Tables/outputLGCP/miaeLGCP41b05v2s4.RData")


## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b1v1s2.RData")
OOBLGCP41b1v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b1v1s2.rds")

miaeLGCP41b1v1s2 <- fmiaeRF(
  x = LGCP41b1v1s2,
  alloob = OOBLGCP41b1v1s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b1v1s2, file = "files_Tables/outputLGCP/miaeLGCP41b1v1s2.RData")

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b1v1s4.RData")
OOBLGCP41b1v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b1v1s4.rds")

miaeLGCP41b1v1s4 <- fmiaeRF(
  x = LGCP41b1v1s4,
  alloob = OOBLGCP41b1v1s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b1v1s4, file = "files_Tables/outputLGCP/miaeLGCP41b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b1v2s2.RData")
OOBLGCP41b1v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b1v2s2.rds")

miaeLGCP41b1v2s2 <- fmiaeRF(
  x = LGCP41b1v2s2,
  alloob = OOBLGCP41b1v2s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b1v2s2, file = "files_Tables/outputLGCP/miaeLGCP41b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP41b1v2s4.RData")
OOBLGCP41b1v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP41b1v2s4.rds")

miaeLGCP41b1v2s4 <- fmiaeRF(
  x = LGCP41b1v2s4,
  alloob = OOBLGCP41b1v2s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeLGCP41b1v2s4, file = "files_Tables/outputLGCP/miaeLGCP41b1v2s4.RData")

print("MIAE computed - LGCP - 2 covariates (0 nuisance variables)")

# LGCP - Number of covariates 10 (4 nuisance variables) --------------------

## Beta = 0.4 - variance = 1.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b04v1s2.RData")
OOBLGCP42b04v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b04v1s2.rds")

miaeLGCP42b04v1s2 <- fmiaeRF(
  x = LGCP42b04v1s2,
  alloob = OOBLGCP42b04v1s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b04v1s2, file = "files_Tables/outputLGCP/miaeLGCP42b04v1s2.RData")

## Beta = 0.4 - variance = 1.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b04v1s4.RData")
OOBLGCP42b04v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b04v1s4.rds")

miaeLGCP42b04v1s4 <- fmiaeRF(
  x = LGCP42b04v1s4,
  alloob = OOBLGCP42b04v1s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b04v1s4, file = "files_Tables/outputLGCP/miaeLGCP42b04v1s4.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b04v2s2.RData")
OOBLGCP42b04v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b04v2s2.rds")

miaeLGCP42b04v2s2 <- fmiaeRF(
  x = LGCP42b04v2s2,
  alloob = OOBLGCP42b04v2s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b04v2s2, file = "files_Tables/outputLGCP/miaeLGCP42b04v2s2.RData")

## Beta = 0.4 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b04v2s4.RData")
OOBLGCP42b04v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b04v2s4.rds")

miaeLGCP42b04v2s4 <- fmiaeRF(
  x = LGCP42b04v2s4,
  alloob = OOBLGCP42b04v2s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b04v2s4, file = "files_Tables/outputLGCP/miaeLGCP42b04v2s4.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b02v1s2.RData")
OOBLGCP42b02v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b02v1s2.rds")

miaeLGCP42b02v1s2 <- fmiaeRF(
  x = LGCP42b02v1s2,
  alloob = OOBLGCP42b02v1s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b02v1s2, file = "files_Tables/outputLGCP/miaeLGCP42b02v1s2.RData")

## Beta = 0.2 - variance = 1.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b02v1s4.RData")
OOBLGCP42b02v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b02v1s4.rds")

miaeLGCP42b02v1s4 <- fmiaeRF(
  x = LGCP42b02v1s4,
  alloob = OOBLGCP42b02v1s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b02v1s4, file = "files_Tables/outputLGCP/miaeLGCP42b02v1s4.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b02v2s2.RData")
OOBLGCP42b02v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b02v2s2.rds")

miaeLGCP42b02v2s2 <- fmiaeRF(
  x = LGCP42b02v2s2,
  alloob = OOBLGCP42b02v2s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b02v2s2, file = "files_Tables/outputLGCP/miaeLGCP42b02v2s2.RData")

## Beta = 0.2 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP42b02v2s4.RData")
OOBLGCP42b02v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP42b02v2s4.rds")

miaeLGCP42b02v2s4 <- fmiaeRF(
  x = LGCP42b02v2s4,
  alloob = OOBLGCP42b02v2s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP42b02v2s4, file = "files_Tables/outputLGCP/miaeLGCP42b02v2s4.RData")

print("MIAE computed - LGCP - 10 covariates (4 nuisance variables)")

# LGCP - Number of covariates 10 (8 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b05v1s2.RData")
OOBLGCP43b05v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b05v1s2.rds")

miaeLGCP43b05v1s2 <- fmiaeRF(
  x = LGCP43b05v1s2,
  alloob = OOBLGCP43b05v1s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b05v1s2, file = "files_Tables/outputLGCP/miaeLGCP4343b05v1s2.RData")


## Beta = 0.5 - variance = 1.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b05v1s4.RData")
OOBLGCP43b05v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b05v1s4.rds")

miaeLGCP43b05v1s4 <- fmiaeRF(
  x = LGCP43b05v1s4,
  alloob = OOBLGCP43b05v1s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b05v1s4, file = "files_Tables/outputLGCP/miaeLGCP43b05v1s4.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b05v2s2.RData")
OOBLGCP43b05v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b05v2s2.rds")

miaeLGCP43b05v2s2 <- fmiaeRF(
  x = LGCP43b05v2s2,
  alloob = OOBLGCP43b05v2s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b05v2s2, file = "files_Tables/outputLGCP/miaeLGCP43b05v2s2.RData")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b05v2s4.RData")
OOBLGCP43b05v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b05v2s4.rds")

miaeLGCP43b05v2s4 <- fmiaeRF(
  x = LGCP43b05v2s4,
  alloob = OOBLGCP43b05v2s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b05v2s4, file = "files_Tables/outputLGCP/miaeLGCP4b05v2s4.RData")

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b1v1s2.RData")
OOBLGCP43b1v1s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b1v1s2.rds")

miaeLGCP43b1v1s2 <- fmiaeRF(
  x = LGCP43b1v1s2,
  alloob = OOBLGCP43b1v1s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b1v1s2, file = "files_Tables/outputLGCP/miaeLGCP43b1v1s2.RData")

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b1v1s4.RData")
OOBLGCP43b1v1s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b1v1s4.rds")

miaeLGCP43b1v1s4 <- fmiaeRF(
  x = LGCP43b1v1s4,
  alloob = OOBLGCP43b1v1s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b1v1s4, file = "files_Tables/outputLGCP/miaeLGCP43b1v1s4.RData")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b1v2s2.RData")
OOBLGCP43b1v2s2 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b1v2s2.rds")

miaeLGCP43b1v2s2 <- fmiaeRF(
  x = LGCP43b1v2s2,
  alloob = OOBLGCP43b1v2s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b1v2s2, file = "files_Tables/outputLGCP/miaeLGCP43b1v2s2.RData")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
load(file = "files_Tables/outputLGCP/LGCP43b1v2s4.RData")
OOBLGCP43b1v2s4 <- readRDS(file = "files_Tables/outputLGCP/OOBLGCP43b1v2s4.rds")

miaeLGCP43b1v2s4 <- fmiaeRF(
  x = LGCP43b1v2s4,
  alloob = OOBLGCP43b1v2s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeLGCP43b1v2s4, file = "files_Tables/outputLGCP/miaeLGCP43b1v2s4.RData")

print("MIAE computed - LGCP - 10 covariates (8 nuisance variables)")
