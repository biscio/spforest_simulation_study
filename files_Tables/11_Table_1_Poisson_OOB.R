for (i in list.files("files_Tables/outputPoisson", pattern = "^pp", full.names = TRUE)) {
  load(i)
}

# Preliminaries function to run OOBoptim over all realisations ------------

Voob <- function(X, listcovariates, params, parallel = F, ...) {
  alloob <- future_lapply(
    X = X$pp,
    FUN = function(i) {
      OOBoptim(
        X = i,
        listcovariates = listcovariates,
        params = params,
        parallel = parallel,
        ...
      )
    },
    future.seed = TRUE
  )
  return(alloob)
}

# Setting the hyperparameters grid ----------------------------------------

gridparams41 <- list(
    mtry = 1:length(covar41),
    minpts = 10,
    minvol = c(0.005, 0.01, 0.015, 0.02, 0.05, 0.1, 0.15, 0.20),
    Ntree = 200
)

gridparams42 <- list(
    mtry = 1:length(covar42),
    minpts = 10,
    minvol = c(0.005, 0.01, 0.015, 0.02, 0.05, 0.1, 0.15, 0.20),
    Ntree = 200
)


## Poisson - Number of covariates 2 (0 nuisance variables) ---------------
### Beta = 0.2  ----------------------------------------------------------
OOBpp41b05 <- Voob(
  X = pp41b05,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBpp41b05, file = "files_Tables/outputPoisson/OOBpp41b05.rds")

### Beta = 0.4
OOBpp41b1 <- Voob(
  X = pp41b1,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBpp41b1, file = "files_Tables/outputPoisson/OOBpp41b1.rds")

print("OOB computed - Poisson - 2 covariates (0 nuisance variables)")

## Poisson - Number of covariates 10 (4 nuisance variables) ---------------

### Beta = 0.1   ----------------------------------------------------------
OOBpp42b02 <- Voob(
  X = pp42b02,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBpp42b02, file = "files_Tables/outputPoisson/OOBpp42b02.rds")

### Beta = 0.2 -------------------------------------------------------------
OOBpp42b04 <- Voob(
  X = pp42b04,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBpp42b04, file = "files_Tables/outputPoisson/OOBpp42b04.rds")

print("OOB computed - Poisson - 10 covariates (4 nuisance variables)")

## Poisson - Number of covariates 10 (8 nuisance variables) ----------------

### Beta = 0.2 -------------------------------------------------------------
OOBpp43b05 <- Voob(
  X = pp43b05,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBpp43b05, file = "files_Tables/outputPoisson/OOBpp43b05.rds")

### Beta = 0.4 -------------------------------------------------------------
OOBpp43b1 <- Voob(
  X = pp43b1,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBpp43b1, file = "files_Tables/outputPoisson/OOBpp43b1.rds")

print("OOB computed - Poisson - 10 covariates (8 nuisance variables)")
