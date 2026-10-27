for (i in list.files("files_Tables/outputDPP", pattern = "^DPP", full.names = TRUE)) {
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
    minvol = c(0.01, 0.05, 0.1, 0.15, 0.20, 0.25, 0.30, 0.40, 0.45),
    Ntree = 200
)

gridparams42 <- list(
    mtry = 1:length(covar42), #c(2, 5, 7, 10),
    minpts = 10,
    minvol = c(0.01, 0.05, 0.1, 0.15, 0.20, 0.25, 0.30, 0.40, 0.45),
    Ntree = 200
)

# DPP - Number of covariates 2 (0 nuisance variables) ---------------------


## Beta = 0.2 -------------------------------------------------------------
OOBDPP41b02 <- Voob(
  X = DPP41b02,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBDPP41b02, file = "files_Tables/outputDPP/OOBDPP41b02.rds")

## Beta = 0.4
OOBDPP41b04 <- Voob(
  X = DPP41b04,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBDPP41b04, file = "files_Tables/outputDPP/OOBDPP41b04.rds")

# DPP - Number of covariates 10 (4 nuisance variables) ----

## Beta = 0.1  -------------------------------------------------------------
OOBDPP42b01 <- Voob(
  X = DPP42b01,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBDPP42b01, file = "files_Tables/outputDPP/OOBDPP42b01.rds")

## Beta = 0.2 ----
OOBDPP42b02 <- Voob(
  X = DPP42b02,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBDPP42b02, file = "files_Tables/outputDPP/OOBDPP42b02.rds")

print("OOB computed - DPP - 10 covariates (4 nuisance variables)")

# DPP - Number of covariates 10 (8 nuisance variables) ----

## Beta = 0.2 -------------------------------------------------------------
OOBDPP43b02 <- Voob(
  X = DPP43b02,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBDPP43b02, file = "files_Tables/outputDPP/OOBDPP43b02.rds")

## Beta = 0.4 -------------------------------------------------------------
OOBDPP43b04 <- Voob(
  X = DPP43b04,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBDPP43b04, file = "files_Tables/outputDPP/OOBDPP43b04.rds")

print("OOB computed - DPP - 10 covariates (8 nuisance variables)")
