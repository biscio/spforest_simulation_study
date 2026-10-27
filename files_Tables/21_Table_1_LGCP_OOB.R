for (i in list.files("files_Tables/outputLGCP", pattern = "^LGCP", full.names = TRUE)) {
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
  minvol = c(0.01, 0.05, 0.1, 0.15, 0.20),
  Ntree = 200
)

gridparams42 <- list(
    mtry = 2:length(covar42), #c(2, 5, 7, 10),
    minpts = 10,
    minvol = c(0.01, 0.05, 0.1, 0.15, 0.20),
    Ntree = 200
)

# LGCP - Number of covariates 2 (0 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.2 ------------------------------
OOBLGCP41b05v1s2 <- Voob(
  X = LGCP41b05v1s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b05v1s2, file = "files_Tables/outputLGCP/OOBLGCP41b05v1s2.rds")
print("OOBLGCP41b05v1s2 computed")

## Beta = 0.5 - variance = 1.0 - scale = 0.4 ------------------------------
OOBLGCP41b05v1s4 <- Voob(
  X = LGCP41b05v1s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b05v1s4, file = "files_Tables/outputLGCP/OOBLGCP41b05v1s4.rds")
print("OOBLGCP41b05v1s4 computed")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP41b05v2s2 <- Voob(
  X = LGCP41b05v2s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b05v2s2, file = "files_Tables/outputLGCP/OOBLGCP41b05v2s2.rds")
print("OOBLGCP41b05v2s2 computed")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP41b05v2s4 <- Voob(
  X = LGCP41b05v2s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b05v2s4, file = "files_Tables/outputLGCP/OOBLGCP41b05v2s4.rds")
print("OOBLGCP41b05v2s4 computed")

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
OOBLGCP41b1v1s2 <- Voob(
  X = LGCP41b1v1s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b1v1s2, file = "files_Tables/outputLGCP/OOBLGCP41b1v1s2.rds")
print("OOBLGCP41b1v1s2 computed")

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
OOBLGCP41b1v1s4 <- Voob(
  X = LGCP41b1v1s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b1v1s4, file = "files_Tables/outputLGCP/OOBLGCP41b1v1s4.rds")
print("OOBLGCP41b1v1s4 computed")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP41b1v2s2 <- Voob(
  X = LGCP41b1v2s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b1v2s2, file = "files_Tables/outputLGCP/OOBLGCP41b1v2s2.rds")
print("OOBLGCP41b1v2s2 computed")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP41b1v2s4 <- Voob(
  X = LGCP41b1v2s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBLGCP41b1v2s4, file = "files_Tables/outputLGCP/OOBLGCP41b1v2s4.rds")
print("OOBLGCP41b1v2s4 computed")

print("OOB computed - LGCP - 2 covariates (0 nuisance variables)")

# LGCP - Number of covariates 10 (4 nuisance variables) --------------------

## Beta = 0.4 - variance = 1.0 - scale = 0.02 ------------------------------
OOBLGCP42b04v1s2 <- Voob(
  X = LGCP42b04v1s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b04v1s2, file = "files_Tables/outputLGCP/OOBLGCP42b04v1s2.rds")
print("OOBLGCP42b04v1s2 computed")

## Beta = 0.4 - variance = 1.0 - scale = 0.04 ------------------------------
OOBLGCP42b04v1s4 <- Voob(
  X = LGCP42b04v1s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b04v1s4, file = "files_Tables/outputLGCP/OOBLGCP42b04v1s4.rds")
print("OOBLGCP42b04v1s4 computed")

## Beta = 0.4 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP42b04v2s2 <- Voob(
  X = LGCP42b04v2s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b04v2s2, file = "files_Tables/outputLGCP/OOBLGCP42b04v2s2.rds")
print("OOBLGCP42b04v2s2 computed")

## Beta = 0.4 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP42b04v2s4 <- Voob(
  X = LGCP42b04v2s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b04v2s4, file = "files_Tables/outputLGCP/OOBLGCP42b04v2s4.rds")
print("OOBLGCP42b04v2s4 computed")

## Beta = 0.2 - variance = 1.0 - scale = 0.02 ------------------------------
OOBLGCP42b02v1s2 <- Voob(
  X = LGCP42b02v1s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b02v1s2, file = "files_Tables/outputLGCP/OOBLGCP42b02v1s2.rds")
print("OOBLGCP42b02v1s2 computed")

## Beta = 0.2 - variance = 1.0 - scale = 0.04 ------------------------------
OOBLGCP42b02v1s4 <- Voob(
  X = LGCP42b02v1s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b02v1s4, file = "files_Tables/outputLGCP/OOBLGCP42b02v1s4.rds")
print("OOBLGCP42b02v1s4 computed")

## Beta = 0.2 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP42b02v2s2 <- Voob(
  X = LGCP42b02v2s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b02v2s2, file = "files_Tables/outputLGCP/OOBLGCP42b02v2s2.rds")
print("OOBLGCP42b02v2s2 computed")

## Beta = 0.2 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP42b02v2s4 <- Voob(
  X = LGCP42b02v2s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP42b02v2s4, file = "files_Tables/outputLGCP/OOBLGCP42b02v2s4.rds")
print("OOBLGCP42b02v2s4 computed")

print("OOB computed - LGCP - 10 covariates (4 nuisance variables)")

# LGCP - Number of covariates 10 (8 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ------------------------------
OOBLGCP43b05v1s2 <- Voob(
  X = LGCP43b05v1s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b05v1s2, file = "files_Tables/outputLGCP/OOBLGCP43b05v1s2.rds")
print("OOBLGCP43b05v1s2 computed")

## Beta = 0.5 - variance = 1.0 - scale = 0.04 ------------------------------
OOBLGCP43b05v1s4 <- Voob(
  X = LGCP43b05v1s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b05v1s4, file = "files_Tables/outputLGCP/OOBLGCP43b05v1s4.rds")
print("OOBLGCP43b05v1s4 computed")

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP43b05v2s2 <- Voob(
  X = LGCP43b05v2s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b05v2s2, file = "files_Tables/outputLGCP/OOBLGCP43b05v2s2.rds")
print("OOBLGCP43b05v2s2 computed")

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP43b05v2s4 <- Voob(
  X = LGCP43b05v2s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b05v2s4, file = "files_Tables/outputLGCP/OOBLGCP43b05v2s4.rds")
print("OOBLGCP43b05v2s4 computed")

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
OOBLGCP43b1v1s2 <- Voob(
  X = LGCP43b1v1s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b1v1s2, file = "files_Tables/outputLGCP/OOBLGCP43b1v1s2.rds")
print("OOBLGCP43b1v1s2 computed")

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
OOBLGCP43b1v1s4 <- Voob(
  X = LGCP43b1v1s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b1v1s4, file = "files_Tables/outputLGCP/OOBLGCP43b1v1s4.rds")
print("OOBLGCP43b1v1s4 computed")

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
OOBLGCP43b1v2s2 <- Voob(
  X = LGCP43b1v2s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b1v2s2, file = "files_Tables/outputLGCP/OOBLGCP43b1v2s2.rds")
print("OOBLGCP43b1v2s2 computed")

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
OOBLGCP43b1v2s4 <- Voob(
  X = LGCP43b1v2s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBLGCP43b1v2s4, file = "files_Tables/outputLGCP/OOBLGCP43b1v2s4.rds")
print("OOBLGCP43b1v2s4 computed")

print("OOB computed - LGCP - 10 covariates (8 nuisance variables)")

