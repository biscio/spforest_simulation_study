for (i in list.files("files_Tables/outputNS", pattern = "^NS", full.names = TRUE)) {
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
    mtry = 1:length(covar42),
    minpts = 10,
    minvol = c(0.01, 0.05, 0.1, 0.15, 0.20),
    Ntree = 200
)

## NS - Number of covariates 2 (0 nuisance variables) --------------------

### Beta = 0.5 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS41b05k100s2 <- Voob(
  X = NS41b05k100s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b05k100s2, file = "files_Tables/outputNS/OOBNS41b05k100s2.rds")

### Beta = 0.5 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS41b05k100s4 <- Voob(
  X = NS41b05k100s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b05k100s4, file = "files_Tables/outputNS/OOBNS41b05k100s4.rds")

### Beta = 0.5 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS41b05k200s2 <- Voob(
  X = NS41b05k200s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b05k200s2, file = "files_Tables/outputNS/OOBNS41b05k200s2.rds")

### Beta = 0.5 - kappa = 200 - sigma = 0.04 ------------------------------
OOBNS41b05k200s4 <- Voob(
  X = NS41b05k200s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b05k200s4, file = "files_Tables/outputNS/OOBNS41b05k200s4.rds")

### Beta = 1.0 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS41b1k100s2 <- Voob(
  X = NS41b1k100s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b1k100s2, file = "files_Tables/outputNS/OOBNS41b1k100s2.rds")

### Beta = 1.0 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS41b1k100s4 <- Voob(
  X = NS41b1k100s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b1k100s4, file = "files_Tables/outputNS/OOBNS41b1k100s4.rds")

### Beta = 1.0 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS41b1k200s2 <- Voob(
  X = NS41b1k200s2,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b1k200s2, file = "files_Tables/outputNS/OOBNS41b1k200s2.rds")

### Beta = 1.0 - kappa = 200 - sigma = 0.04 ------------------------------
OOBNS41b1k200s4 <- Voob(
  X = NS41b1k200s4,
  listcovariates = covar41,
  params = gridparams41
)
saveRDS(OOBNS41b1k200s4, file = "files_Tables/outputNS/OOBNS41b1k200s4.rds")

print("OOB computed - NS - 2 covariates (0 nuisance variables)")

## NS - Number of covariates 10 (4 nuisance variables) -------------------

### Beta = 0.2 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS42b02k100s2 <- Voob(
  X = NS42b02k100s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBNS42b02k100s2, file = "files_Tables/outputNS/OOBNS42b02k100s2.rds")

### Beta = 0.2 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS42b02k100s4 <- Voob(
  X = NS42b02k100s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBNS42b02k100s4, file = "files_Tables/outputNS/OOBNS42b02k100s4.rds")

### Beta = 0.2 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS42b02k200s2 <- Voob(
  X = NS42b02k200s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBNS42b02k200s2, file = "files_Tables/outputNS/OOBNS42b02k200s2.rds")

### Beta = 0.2 - kappa = 200 - sigma = 0.04 ------------------------------
OOBNS42b02k200s4 <- Voob(
  X = NS42b02k200s4,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBNS42b02k200s4, file = "files_Tables/outputNS/OOBNS42b02k200s4.rds")

### Beta = 0.4 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS42b04k100s2 <- Voob(
  X = NS42b04k100s2,
  listcovariates = covar42,
  params = gridparams42
)
saveRDS(OOBNS42b04k100s2, file = "files_Tables/outputNS/OOBNS42b04k100s2.rds")

### Beta = 0.4 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS42b04k100s4 <- Voob(
    X = NS42b04k100s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS42b04k100s4, file = "files_Tables/outputNS/OOBNS42b04k100s4.rds")

### Beta = 0.4 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS42b04k200s2 <- Voob(
    X = NS42b04k200s2,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS42b04k200s2, file = "files_Tables/outputNS/OOBNS42b04k200s2.rds")

### Beta = 0.4 - kappa = 200 - sigma = 0.04 ------------------------------
OOBNS42b04k200s4 <- Voob(
    X = NS42b04k200s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS42b04k200s4, file = "files_Tables/outputNS/OOBNS42b04k200s4.rds")

print("OOB computed - NS - 10 covariates (4 nuisance variables)")

## NS - Number of covariates 10 (8 nuisance variables) -------------------

### Beta = 0.5 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS43b05k100s2 <- Voob(
    X = NS43b05k100s2,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b05k100s2, file = "files_Tables/outputNS/OOBNS43b05k100s2.rds")

### Beta = 0.5 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS43b05k100s4 <- Voob(
    X = NS43b05k100s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b05k100s4, file = "files_Tables/outputNS/OOBNS43b05k100s4.rds")

### Beta = 0.5 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS43b05k200s2 <- Voob(
    X = NS43b05k200s2,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b05k200s2, file = "files_Tables/outputNS/OOBNS43b05k200s2.rds")

### Beta = 0.5 - kappa = 200 - sigma = 0.04 ------------------------------
OOBNS43b05k200s4 <- Voob(
    X = NS43b05k200s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b05k200s4, file = "files_Tables/outputNS/OOBNS43b05k200s4.rds")

### Beta = 1 - kappa = 100 - sigma = 0.02 ------------------------------
OOBNS43b1k100s2 <- Voob(
    X = NS43b1k100s2,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b1k100s2, file = "files_Tables/outputNS/OOBNS43b1k100s2.rds")

### Beta = 1 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS43b1k100s4 <- Voob(
    X = NS43b1k100s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b1k100s4, file = "files_Tables/outputNS/OOBNS43b1k100s4.rds")

### Beta = 1 - kappa = 200 - sigma = 0.02 ------------------------------
OOBNS43b1k200s2 <- Voob(
    X = NS43b1k200s2,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b1k200s2, file = "files_Tables/outputNS/OOBNS43b1k200s2.rds")

### Beta = 1 - kappa = 100 - sigma = 0.04 ------------------------------
OOBNS43b1k200s4 <- Voob(
    X = NS43b1k200s4,
    listcovariates = covar42,
    params = gridparams42
)
saveRDS(OOBNS43b1k200s4, file = "files_Tables/outputNS/OOBNS43b1k200s4.rds")

print("OOB computed - NS - 10 covariates (8 nuisance variables)")
