# Poisson - Number of covariates 2 (0 nuisance variables) --------------

## Poisson - Beta = 0.5 ------------------------------------------------
load(file = "files_Tables/outputPoisson/pp41b05.RData")
OOBpp41b05 <- readRDS(file = "files_Tables/outputPoisson/OOBpp41b05.rds")

# temp <- pp41b05
# temp$pp <- pp41b05$pp[1:10]

miae41b05 <- fmiaeRF(
  x = pp41b05,
  alloob = OOBpp41b05,
  covariates = covar41,
  Ntree = Ntree
)
save(miae41b05, file = "files_Tables/outputPoisson/miae41b05.RData")

# Poisson - Beta = 1 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp41b1.RData")
OOBpp41b1 <- readRDS(file = "files_Tables/outputPoisson/OOBpp41b1.rds")
miae41b1 <- fmiaeRF(
  x = pp41b1,
  alloob = OOBpp41b1,
  covariates = covar41,
  Ntree = Ntree
)
save(miae41b1, file = "files_Tables/outputPoisson/miae41b1.RData")

print("MIAE computed - Poisson - 2 covariates (0 nuisance variables)")

# Poisson - Number of covariates 10 (4 nuisance variables) ----------------

## Poisson - Beta = 0.2 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp42b02.RData")
OOBpp42b02 <- readRDS(file = "files_Tables/outputPoisson/OOBpp42b02.rds")
miae42b02 <- fmiaeRF(
  x = pp42b02,
  alloob = OOBpp42b02,
  covariates = covar42,
  Ntree = Ntree
)
save(miae42b02, file = "files_Tables/outputPoisson/miae42b02.RData")

## Poisson - Beta = 0.4 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp42b04.RData")
OOBpp42b04 <- readRDS(file = "files_Tables/outputPoisson/OOBpp42b04.rds")
miae42b04 <- fmiaeRF(
  x = pp42b04,
  alloob = OOBpp42b04,
  covariates = covar42,
  Ntree = Ntree
)
save(miae42b04, file = "files_Tables/outputPoisson/miae42b04.RData")

print("MIAE computed - Poisson - 10 covariates (4 nuisance variables)")

# Poisson - Number of covariates 10 (8 nuisance variables) ----------------

## Poisson - Beta = 0.5 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp43b05.RData")
OOBpp43b05 <- readRDS(file = "files_Tables/outputPoisson/OOBpp43b05.rds")
miae43b05 <- fmiaeRF(
  x = pp43b05,
  alloob = OOBpp43b05,
  covariates = covar42,
  Ntree = Ntree
)
save(miae43b05, file = "files_Tables/outputPoisson/miae43b05.RData")

## Poisson - Beta = 1 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp43b1.RData")
OOBpp43b1 <- readRDS(file = "files_Tables/outputPoisson/OOBpp43b1.rds")
miae43b1 <- fmiaeRF(
  x = pp43b1,
  alloob = OOBpp43b1,
  covariates = covar42,
  Ntree = Ntree
)
save(miae43b1, file = "files_Tables/outputPoisson/miae43b1.RData")

print("MIAE computed - Poisson - 10 covariates (8 nuisance variables)")
