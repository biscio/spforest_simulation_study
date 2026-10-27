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

for (i in list.files("files_Tables/outputNS", pattern = "^NS", full.names = TRUE)) {
    load(i)
}

# NS - Number of covariates 2 (0 nuisance variables) ---------------------

## beta = 0.5 - kappa = 100 - sigma = 0.02 -------------------------------
miaeNSrot41b05k100s2 <- fmiaeRFrot(
    x = NS41b05k100s2,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b05k100s2, file = "files_Tables/outputNS/miaeNSrot41b05k100s2.RData")

## beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot41b05k100s4 <- fmiaeRFrot(
    x = NS41b05k100s4,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b05k100s4, file = "files_Tables/outputNS/miaeNSrot41b05k100s4.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot41b05k200s2 <- fmiaeRFrot(
    x = NS41b05k200s2,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b05k200s2, file = "files_Tables/outputNS/miaeNSrot41b05k200s2.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot41b05k200s4 <- fmiaeRFrot(
    x = NS41b05k200s4,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b05k200s4, file = "files_Tables/outputNS/miaeNSrot41b05k200s4.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
miaeNSrot41b1k100s2 <- fmiaeRFrot(
    x = NS41b1k100s2,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b1k100s2, file = "files_Tables/outputNS/miaeNSrot41b1k100s2.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot41b1k100s4 <- fmiaeRFrot(
    x = NS41b1k100s4,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b1k100s4, file = "files_Tables/outputNS/miaeNSrot41b1k100s4.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot41b1k200s2 <- fmiaeRFrot(
    x = NS41b1k200s2,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b1k200s2, file = "files_Tables/outputNS/miaeNSrot41b1k200s2.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot41b1k200s4 <- fmiaeRFrot(
    x = NS41b1k200s4,
    covariates = covar41,
    Ntree = Ntree
)
save(miaeNSrot41b1k200s4, file = "files_Tables/outputNS/miaeNSrot41b1k200s4.RData")

print("MIAE computer - NS - 2 covariates (0 nuisance variables)")

# NS - Number of covariates 10 (4 nuisance variables) ---------------------

## beta = 0.2 - kappa = 100 - sigma = 0.02 --------------------------------
miaeNSrot42b02k100s2 <- fmiaeRFrot(
    x = NS42b02k100s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b02k100s2, file = "files_Tables/outputNS/miaeNSrot42b02k100s2.RData")

## beta = 0.2 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot42b02k100s4 <- fmiaeRFrot(
    x = NS42b02k100s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b02k100s4, file = "files_Tables/outputNS/miaeNSrot42b02k100s4.RData")

## beta = 0.2 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot42b02k200s2 <- fmiaeRFrot(
    x = NS42b02k200s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b02k200s2, file = "files_Tables/outputNS/miaeNSrot42b02k200s2.RData")

## beta = 0.2 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot42b02k200s4 <- fmiaeRFrot(
    x = NS42b02k200s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b02k200s4, file = "files_Tables/outputNS/miaeNSrot42b02k200s4.RData")

## beta = 0.4 - kappa = 100 - sigma = 0.02 --------------------------------
miaeNSrot42b04k100s2 <- fmiaeRFrot(
    x = NS42b04k100s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b04k100s2, file = "files_Tables/outputNS/miaeNSrot42b04k100s2.RData")

## beta = 0.4 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot42b04k100s4 <- fmiaeRFrot(
    x = NS42b04k100s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b04k100s4, file = "files_Tables/outputNS/miaeNSrot42b04k100s4.RData")

## beta = 0.4 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot42b04k200s2 <- fmiaeRFrot(
    x = NS42b04k200s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b04k200s2, file = "files_Tables/outputNS/miaeNSrot42b04k200s2.RData")

## beta = 0.4 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot42b04k200s4 <- fmiaeRFrot(
    x = NS42b04k200s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot42b04k200s4, file = "files_Tables/outputNS/miaeNSrot42b04k200s4.RData")

print("MIAE computer - NS - 10 covariates (4 nuisance variables)")

# NS - Number of covariates 10 (8 nuisance variables) ---------------------

## beta = 0.5 - kappa = 100 - sigma = 0.02 --------------------------------
miaeNSrot43b05k100s2 <- fmiaeRFrot(
    x = NS43b05k100s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b05k100s2, file = "files_Tables/outputNS/miaeNSrot43b05k100s2.RData")

## beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot43b05k100s4 <- fmiaeRFrot(
    x = NS43b05k100s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b05k100s4, file = "files_Tables/outputNS/miaeNSrot43b05k100s4.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot43b05k200s2 <- fmiaeRFrot(
    x = NS43b05k200s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b05k200s2, file = "files_Tables/outputNS/miaeNSrot43b05k200s2.RData")

## beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot43b05k200s4 <- fmiaeRFrot(
    x = NS43b05k200s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b05k200s4, file = "files_Tables/outputNS/miaeNSrot43b05k200s4.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
miaeNSrot43b1k100s2 <- fmiaeRFrot(
    x = NS43b1k100s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b1k100s2, file = "files_Tables/outputNS/miaeNSrot43b1k100s2.RData")

## beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
miaeNSrot43b1k100s4 <- fmiaeRFrot(
    x = NS43b1k100s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b1k100s4, file = "files_Tables/outputNS/miaeNSrot43b1k100s4.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
miaeNSrot43b1k200s2 <- fmiaeRFrot(
    x = NS43b1k200s2,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b1k200s2, file = "files_Tables/outputNS/miaeNSrot43b1k200s2.RData")

## beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
miaeNSrot43b1k200s4 <- fmiaeRFrot(
    x = NS43b1k200s4,
    covariates = covar42,
    Ntree = Ntree
)
save(miaeNSrot43b1k200s4, file = "files_Tables/outputNS/miaeNSrot43b1k200s4.RData")

print("MIAE simulations - NS - 10 covariates (8 nuisance variables)")
plan("sequential")
