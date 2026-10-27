for (i in list.files("files_Tables/outputNS", pattern = "^NS", full.names = TRUE)) {
  load(i)
}

# NS - Number of covariates 2 (0 nuisance variables) ---------------------

## beta = 0.5 - kappa = 100 - sigma = 0.02 -------------------------------
OOBNS41b05k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS41b05k100s2.rds")
miaeNS41b05k100s2 <- fmiaeRF(
  x = NS41b05k100s2,
  alloob = OOBNS41b05k100s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b05k100s2, file = "files_Tables/outputNS/miaeNS41b05k100s2.RData")

## beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS41b05k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS41b05k100s4.rds")
miaeNS41b05k100s4 <- fmiaeRF(
  x = NS41b05k100s4,
  alloob = OOBNS41b05k100s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b05k100s4, file = "files_Tables/outputNS/miaeNS41b05k100s4.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS41b05k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS41b05k200s2.rds")
miaeNS41b05k200s2 <- fmiaeRF(
  x = NS41b05k200s2,
  alloob = OOBNS41b05k200s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b05k200s2, file = "files_Tables/outputNS/miaeNS41b05k200s2.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS41b05k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS41b05k200s4.rds")
miaeNS41b05k200s4 <- fmiaeRF(
  x = NS41b05k200s4,
  alloob = OOBNS41b05k200s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b05k200s4, file = "files_Tables/outputNS/miaeNS41b05k200s4.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
OOBNS41b1k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS41b1k100s2.rds")
miaeNS41b1k100s2 <- fmiaeRF(
  x = NS41b1k100s2,
  alloob = OOBNS41b1k100s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b1k100s2, file = "files_Tables/outputNS/miaeNS41b1k100s2.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS41b1k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS41b1k100s4.rds")
miaeNS41b1k100s4 <- fmiaeRF(
  x = NS41b1k100s4,
  alloob = OOBNS41b1k100s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b1k100s4, file = "files_Tables/outputNS/miaeNS41b1k100s4.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS41b1k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS41b1k200s2.rds")
miaeNS41b1k200s2 <- fmiaeRF(
  x = NS41b1k200s2,
  alloob = OOBNS41b1k200s2,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b1k200s2, file = "files_Tables/outputNS/miaeNS41b1k200s2.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS41b1k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS41b1k200s4.rds")
miaeNS41b1k200s4 <- fmiaeRF(
  x = NS41b1k200s4,
  alloob = OOBNS41b1k200s4,
  covariates = covar41,
  Ntree = Ntree
)
save(miaeNS41b1k200s4, file = "files_Tables/outputNS/miaeNS41b1k200s4.RData")

print("MIAE computer - NS - 2 covariates (0 nuisance variables)")

# NS - Number of covariates 10 (4 nuisance variables) ---------------------

## beta = 0.2 - kappa = 100 - sigma = 0.02 --------------------------------
OOBNS42b02k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS42b02k100s2.rds")
miaeNS42b02k100s2 <- fmiaeRF(
  x = NS42b02k100s2,
  alloob = OOBNS42b02k100s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b02k100s2, file = "files_Tables/outputNS/miaeNS42b02k100s2.RData")

## beta = 0.2 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS42b02k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS42b02k100s4.rds")
miaeNS42b02k100s4 <- fmiaeRF(
  x = NS42b02k100s4,
  alloob = OOBNS42b02k100s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b02k100s4, file = "files_Tables/outputNS/miaeNS42b02k100s4.RData")

## beta = 0.2 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS42b02k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS42b02k200s2.rds")
miaeNS42b02k200s2 <- fmiaeRF(
  x = NS42b02k200s2,
  alloob = OOBNS42b02k200s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b02k200s2, file = "files_Tables/outputNS/miaeNS42b02k200s2.RData")

## beta = 0.2 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS42b02k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS42b02k200s4.rds")
miaeNS42b02k200s4 <- fmiaeRF(
  x = NS42b02k200s4,
  alloob = OOBNS42b02k200s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b02k200s4, file = "files_Tables/outputNS/miaeNS42b02k200s4.RData")

## beta = 0.4 - kappa = 100 - sigma = 0.02 --------------------------------
OOBNS42b04k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS42b04k100s2.rds")
miaeNS42b04k100s2 <- fmiaeRF(
  x = NS42b04k100s2,
  alloob = OOBNS42b04k100s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b04k100s2, file = "files_Tables/outputNS/miaeNS42b04k100s2.RData")

## beta = 0.4 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS42b04k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS42b04k100s4.rds")
miaeNS42b04k100s4 <- fmiaeRF(
  x = NS42b04k100s4,
  alloob = OOBNS42b04k100s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b04k100s4, file = "files_Tables/outputNS/miaeNS42b04k100s4.RData")

## beta = 0.4 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS42b04k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS42b04k200s2.rds")
miaeNS42b04k200s2 <- fmiaeRF(
  x = NS42b04k200s2,
  alloob = OOBNS42b04k200s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b04k200s2, file = "files_Tables/outputNS/miaeNS42b04k200s2.RData")

## beta = 0.4 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS42b04k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS42b04k200s4.rds")
miaeNS42b04k200s4 <- fmiaeRF(
  x = NS42b04k200s4,
  alloob = OOBNS42b04k200s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS42b04k200s4, file = "files_Tables/outputNS/miaeNS42b04k200s4.RData")

print("MIAE computer - NS - 10 covariates (4 nuisance variables)")

# NS - Number of covariates 10 (8 nuisance variables) ---------------------

## beta = 0.5 - kappa = 100 - sigma = 0.02 --------------------------------
OOBNS43b05k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS43b05k100s2.rds")
miaeNS43b05k100s2 <- fmiaeRF(
  x = NS43b05k100s2,
  alloob = OOBNS43b05k100s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b05k100s2, file = "files_Tables/outputNS/miaeNS43b05k100s2.RData")

## beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS43b05k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS43b05k100s4.rds")
miaeNS43b05k100s4 <- fmiaeRF(
  x = NS43b05k100s4,
  alloob = OOBNS43b05k100s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b05k100s4, file = "files_Tables/outputNS/miaeNS43b05k100s4.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS43b05k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS43b05k200s2.rds")
miaeNS43b05k200s2 <- fmiaeRF(
  x = NS43b05k200s2,
  alloob = OOBNS43b05k200s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b05k200s2, file = "files_Tables/outputNS/miaeNS43b05k200s2.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS43b05k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS43b05k200s4.rds")
miaeNS43b05k200s4 <- fmiaeRF(
  x = NS43b05k200s4,
  alloob = OOBNS43b05k200s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b05k200s4, file = "files_Tables/outputNS/miaeNS43b05k200s4.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
OOBNS43b1k100s2 <- readRDS(file = "files_Tables/outputNS/OOBNS43b1k100s2.rds")
miaeNS43b1k100s2 <- fmiaeRF(
  x = NS43b1k100s2,
  alloob = OOBNS43b1k100s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b1k100s2, file = "files_Tables/outputNS/miaeNS43b1k100s2.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
OOBNS43b1k100s4 <- readRDS(file = "files_Tables/outputNS/OOBNS43b1k100s4.rds")
miaeNS43b1k100s4 <- fmiaeRF(
  x = NS43b1k100s4,
  alloob = OOBNS43b1k100s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b1k100s4, file = "files_Tables/outputNS/miaeNS43b1k100s4.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
OOBNS43b1k200s2 <- readRDS(file = "files_Tables/outputNS/OOBNS43b1k200s2.rds")
miaeNS43b1k200s2 <- fmiaeRF(
  x = NS43b1k200s2,
  alloob = OOBNS43b1k200s2,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b1k200s2, file = "files_Tables/outputNS/miaeNS43b1k200s2.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
OOBNS43b1k200s4 <- readRDS(file = "files_Tables/outputNS/OOBNS43b1k200s4.rds")
miaeNS43b1k200s4 <- fmiaeRF(
  x = NS43b1k200s4,
  alloob = OOBNS43b1k200s4,
  covariates = covar42,
  Ntree = Ntree
)
save(miaeNS43b1k200s4, file = "files_Tables/outputNS/miaeNS43b1k200s4.RData")

print("MIAE simulations - NS - 10 covariates (8 nuisance variables)")
