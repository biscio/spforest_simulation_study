library(spforest)
library(spatstat)
library(future)
library(future.apply)
source(file = "files_Tables/01_table_utils.R")

message("By default, no parallism is used but the computations will take approximately a year. 
To activate parallelism, uncomment the line 'plan(\"multisession\"), workers = 50)' 
and comment the line 'plan(\"sequential\")' at the beginning of this script. 
Then, each worker will compute the results for one of the 500 realisations.")

Nsim <- 500 # Number of point patterns simulated for each scenarios
Ntree <- 200 # Number of trees used to compute the random intensity forests

# To activate/deactivate parallelism  -------------------------------------
#plan("sequential") # Uncomment to deactivate parallelism (default)
plan("multisession", workers = 50) # Uncomment to activate parallelism

# Results for Poisson point processes -------------------------------------

## Generating the point patterns ------------------------------------------
### This should take approximately 3 seconds.
# source(file = "files_Tables/10_Tables_Poisson_pp.R")


# Poisson - Number of covariates 2 (0 nuisance variables) --------------

## Poisson - Beta = 0.5 ------------------------------------------------
load(file = "files_Tables/outputPoisson/pp41b05.RData")

miaerot41b05 <- fmiaeRFrot(
    x = pp41b05,
    covariates = covar41,
    Ntree = Ntree
)
save(miaerot41b05, file = "files_Tables/outputPoisson/miaerot41b05.RData")

# Poisson - Beta = 1 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp41b1.RData")
miaerot41b1 <- fmiaeRFrot(
    x = pp41b1,
    covariates = covar41,
    Ntree = Ntree
)
save(miaerot41b1, file = "files_Tables/outputPoisson/miaerot41b1.RData")

print("MIAE computed - Poisson - 2 covariates (0 nuisance variables)")

# Poisson - Number of covariates 10 (4 nuisance variables) ----------------

## Poisson - Beta = 0.2 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp42b02.RData")
miaerot42b02 <- fmiaeRFrot(
    x = pp42b02,
    covariates = covar42,
    Ntree = Ntree
)
save(miaerot42b02, file = "files_Tables/outputPoisson/miaerot42b02.RData")

## Poisson - Beta = 0.4 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp42b04.RData")
miaerot42b04 <- fmiaeRFrot(
    x = pp42b04,
    covariates = covar42,
    Ntree = Ntree
)
save(miaerot42b04, file = "files_Tables/outputPoisson/miaerot42b04.RData")

print("MIAE computed - Poisson - 10 covariates (4 nuisance variables)")

# Poisson - Number of covariates 10 (8 nuisance variables) ----------------

## Poisson - Beta = 0.5 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp43b05.RData")
miaerot43b05 <- fmiaeRFrot(
    x = pp43b05,
    covariates = covar42,
    Ntree = Ntree
)
save(miaerot43b05, file = "files_Tables/outputPoisson/miaerot43b05.RData")

## Poisson - Beta = 1 ---------------------------------------------------
load(file = "files_Tables/outputPoisson/pp43b1.RData")
miaerot43b1 <- fmiaeRFrot(
    x = pp43b1,
    covariates = covar42,
    Ntree = Ntree
)
save(miaerot43b1, file = "files_Tables/outputPoisson/miaerot43b1.RData")

print("MIAE computed - Poisson - 10 covariates (8 nuisance variables)")
plan("sequential")
