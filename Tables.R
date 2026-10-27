# Preliminaries --------------------------------------------------------

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
plan("sequential") # Uncomment to deactivate parallelism (default)
# plan("multisession", workers = 50) # Uncomment to activate parallelism

# Results for Poisson point processes -------------------------------------

## Generating the point patterns ------------------------------------------
### This should take approximately 10 seconds.
source(file = "files_Tables/10_Tables_Poisson_pp.R")

## Compute the score OOB for several hyperparameters ----------------------
### Without parallelism, this should take approximately 28 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 13 hours.
source(file = "files_Tables/11_Tables_Poisson_OOB.R")

## Compute the MIAE for RF with the best hyperparameters ------------------
### This should take approximately 8 hours.
source(file = "files_Tables/12_Tables_Poisson_RF_MIAE.R")

## Compute the MIAE for XGboostPP ------------------------------------------
### Without parallelism, this should take approximately 64 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 1.5 days.
source(file = "files_Tables/13_Tables_Poisson_XG_MIAE.R")

## Compute the MIAE for APP ------------------------------------------------
### This should take approximately 17 minutes
source(file = "files_Tables/14_Tables_Poisson_APP.R")

## Saving results for Poisson ----------------------------------------------
for (i in list.files(
    path = "files_Tables/outputPoisson",
    pattern = "^miae", full.names = TRUE
)) {
    load(i)
}
for (i in list.files(
    path = "files_Tables/outputPoisson",
    pattern = "^XGmiae", full.names = TRUE
)) {
    load(i)
}
for (i in list.files(
    path = "files_Tables/outputPoisson",
    pattern = "^APPmiae", full.names = TRUE
)) {
    load(i)
}

tablePoisson <- data.frame(
  covariates = rep(c(
    "2 (0 nuisance var.)",
    "2 (0 nuisance var.)",
    "10 (4 nuisance var.)",
    "10 (4 nuisance var.)",
    "10 (8 nuisance var.)",
    "10 (8 nuisance var.)"
  ), times = 3),
  beta = rep(c(0.5, 1, 0.2, 0.4, 0.5, 1), times = 3),
  do.call(rbind, list(
    miae41b05, miae41b1,
    miae42b02, miae42b04,
    miae43b05, miae43b1,
    XGmiae41b05, XGmiae41b1,
    XGmiae42b02, XGmiae42b04,
    XGmiae43b05, XGmiae43b1,
    APPmiae41b05, APPmiae41b1,
    APPmiae42b02, APPmiae42b04,
    APPmiae43b05, APPmiae43b1
  )),
  method = rep(c("spforest", "XGboostPP", "APP"), each = 6)
)

save(tablePoisson, file = "files_Tables/outputPoisson/tablePoisson.RData")

# Results for LGCP --------------------------------------------------------

## Generating the point patterns ------------------------------------------
### This should take approximately 12 minutes.

source("files_Tables/20_Tables_LGCP_pp.R")

## RF OOB: Compute the score OOB for several hyperparameters --------------
### Without parallelism, this should take approximately 120 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 2.5 days.

# plan("multisession", workers = 50) ## Uncomment to parallelise
source("files_Tables/21_Tables_LGCP_OOB.R")
# plan("sequential") ## Uncomment to deactivate parallelism

## RF MIAE: Compute the MIAE for RF with the best hyperparameters ----------
### Without parallelism, this should take approximately 130 hours.
### We recommend to use parallelism with 25 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 5 hours

# plan("multisession", workers = 25) ## Uncomment to parallelise
source("files_Tables/22_Tables_LGCP_RF_MIAE.R")
# plan("sequential") ## Uncomment to deactivate parallelism

## XGboostPP MIAE: Compute the MIAE for XGboostPP --------------------------
### Without parallelism, this should take approximately 190 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 4 days.

# plan("multisession", workers = 25) ## Uncomment to parallelise
source("files_Tables/23_Tables_LGCP_XG_MIAE.R")
# plan("sequential") ## Uncomment to deactivate parallelism

## APP MIAE: Compute the MIAE for APP --------------------------------------
### This should take approximately 7 hours.
source("files_Tables/24_Tables_LGCP_APP_MIAE.R")

## Saving results for LGCP ---------------------------------------------
for (i in list.files(
  path = "files_Tables/outputLGCP",
  pattern = "^miaeLGCP", full.names = TRUE
)) {
  load(i)
}
for (i in list.files(
  path = "files_Tables/outputLGCP",
  pattern = "^XGmiaeLGCP", full.names = TRUE
)) {
  load(i)
}
for (i in list.files(
  path = "files_Tables/outputLGCP",
  pattern = "^APPmiaeLGCP", full.names = TRUE
)) {
  load(i)
}

tableLGCP <- data.frame(
  covariates = rep(c(
    rep("2 (0 nuisance var.)", 8),
    rep("10 (4 nuisance var.)", 8),
    rep("10 (8 nuisance var.)", 8)
  ), times = 3),
  beta = rep(c(
    rep(0.5, 4), rep(1, 4), rep(0.2, 4),
    rep(0.4, 4), rep(0.5, 4), rep(1, 4)
  ), times = 3),
  variance = rep(rep(c(1, 1, 2, 2), 6), times = 3),
  scale = rep(rep(c(0.02, 0.04), 12), times = 3),
  do.call(rbind, list(
    miaeLGCP41b05v1s2, miaeLGCP41b05v1s4, miaeLGCP41b05v2s2, miaeLGCP41b05v2s4,
    miaeLGCP41b1v1s2, miaeLGCP41b1v1s4, miaeLGCP41b1v2s2, miaeLGCP41b1v2s4,
    miaeLGCP42b02v1s2, miaeLGCP42b02v1s4, miaeLGCP42b02v2s2, miaeLGCP42b02v2s4,
    miaeLGCP42b04v1s2, miaeLGCP42b04v1s4, miaeLGCP42b04v2s2, miaeLGCP42b04v2s4,
    miaeLGCP43b05v1s2, miaeLGCP43b05v1s4, miaeLGCP43b05v2s2, miaeLGCP43b05v2s4,
    miaeLGCP43b1v1s2, miaeLGCP43b1v1s4, miaeLGCP43b1v2s2, miaeLGCP43b1v2s4,
    XGmiaeLGCP41b05v1s2, XGmiaeLGCP41b05v1s4, XGmiaeLGCP41b05v2s2, XGmiaeLGCP41b05v2s4,
    XGmiaeLGCP41b1v1s2, XGmiaeLGCP41b1v1s4, XGmiaeLGCP41b1v2s2, XGmiaeLGCP41b1v2s4,
    XGmiaeLGCP42b02v1s2, XGmiaeLGCP42b02v1s4, XGmiaeLGCP42b02v2s2, XGmiaeLGCP42b02v2s4,
    XGmiaeLGCP42b04v1s2, XGmiaeLGCP42b04v1s4, XGmiaeLGCP42b04v2s2, XGmiaeLGCP42b04v2s4,
    XGmiaeLGCP43b05v1s2, XGmiaeLGCP43b05v1s4, XGmiaeLGCP43b05v2s2, XGmiaeLGCP43b05v2s4,
    XGmiaeLGCP43b1v1s2, XGmiaeLGCP43b1v1s4, XGmiaeLGCP43b1v2s2, XGmiaeLGCP43b1v2s4,
    APPmiaeLGCP41b05v1s2, APPmiaeLGCP41b05v1s4, APPmiaeLGCP41b05v2s2, APPmiaeLGCP41b05v2s4,
    APPmiaeLGCP41b1v1s2, APPmiaeLGCP41b1v1s4, APPmiaeLGCP41b1v2s2, APPmiaeLGCP41b1v2s4,
    APPmiaeLGCP42b02v1s2, APPmiaeLGCP42b02v1s4, APPmiaeLGCP42b02v2s2, APPmiaeLGCP42b02v2s4,
    APPmiaeLGCP42b04v1s2, APPmiaeLGCP42b04v1s4, APPmiaeLGCP42b04v2s2, APPmiaeLGCP42b04v2s4,
    APPmiaeLGCP43b05v1s2, APPmiaeLGCP43b05v1s4, APPmiaeLGCP43b05v2s2, APPmiaeLGCP43b05v2s4,
    APPmiaeLGCP43b1v1s2, APPmiaeLGCP43b1v1s4, APPmiaeLGCP43b1v2s2, APPmiaeLGCP43b1v2s4
  )),
  method = rep(c("spforest", "XGboostPP", "APP"), each = 24)
)

save(tableLGCP, file = "Tables_LGCP.RData")

# Results for Neyman Scott point processes --------------------------------

## Generating the point patterns ------------------------------------------
### This should take approximately 5 minutes.

source(file = "files_Tables/30_Tables_NS_pp.R")

## RF OOB: Compute the score OOB for several hyperparameters --------------
### Without parallelism, this should take approximately 120 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 2.5 days.

# plan("multisession", workers = 50) ## Uncomment to parallelise
source(file = "files_Tables/31_Tables_NS_OOB.R")
# plan("sequential") ## Uncomment to deactivate parallelism

## RF MIAE: Compute the MIAE for RF with the best hyperparameters ----------
### Without parallelism, this should take approximately 130 hours.
### We recommend to use parallelism with 25 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 5 hours
source(file = "files_Tables/32_Tables_NS_RF_MIAE.R")

## XGboostPP MIAE: Compute the MIAE for XGboostPP --------------------------
### Without parallelism, this should take approximately 190 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 4 days
source(file = "files_Tables/33_Tables_NS_XG_MIAE.R")

## APP MIAE: Compute the MIAE for APP --------------------------------------
### This should take approximately 7 hours.
source(file = "files_Tables/34_Tables_NS_APP_MIAE.R")

## Saving results for Neyman Scott------------------------------------------
for (i in list.files(
  path = "files_Tables/outputNS",
  pattern = "^miaeNS", full.names = TRUE
)) {
  load(i)
}
for (i in list.files(
  path = "files_Tables/outputNS",
  pattern = "^XGmiaeNS", full.names = TRUE
)) {
  load(i)
}
for (i in list.files(
  path = "files_Tables/outputNS",
  pattern = "^APPmiaeNS", full.names = TRUE
)) {
  load(i)
}

tableNS <- data.frame(
  covariates = rep(c(
    rep("2 (0 nuisance var.)", 8),
    rep("10 (4 nuisance var.)", 8),
    rep("10 (8 nuisance var.)", 8)
  ), times = 3),
  beta = rep(c(
    rep(0.5, 4), rep(1, 4),
    rep(0.2, 4), rep(0.4, 4),
    rep(0.5, 4), rep(1, 4)
  ), times = 3),
  kappa = rep(rep(c(rep(100, 2), rep(200, 2)), 6), times = 3),
  sigma = rep(rep(c(0.02, 0.04), 12), times = 3),
  do.call(rbind, list(
    miaeNS41b05k100s2, miaeNS41b05k100s4, miaeNS41b05k200s2, miaeNS41b05k200s4,
    miaeNS41b1k100s2, miaeNS41b1k100s4, miaeNS41b1k200s2, miaeNS41b1k200s4,
    miaeNS42b02k100s2, miaeNS42b02k100s4, miaeNS42b02k200s2, miaeNS42b02k200s4,
    miaeNS42b04k100s2, miaeNS42b04k100s4, miaeNS42b04k200s2, miaeNS42b04k200s4,
    miaeNS43b05k100s2, miaeNS43b05k100s4, miaeNS43b05k200s2, miaeNS43b05k200s4,
    miaeNS43b1k100s2, miaeNS43b1k100s4, miaeNS43b1k200s2, miaeNS43b1k200s4,
    XGmiaeNS41b05k100s2, XGmiaeNS41b05k100s4, XGmiaeNS41b05k200s2, XGmiaeNS41b05k200s4,
    XGmiaeNS41b1k100s2, XGmiaeNS41b1k100s4, XGmiaeNS41b1k200s2, XGmiaeNS41b1k200s4,
    XGmiaeNS42b02k100s2, XGmiaeNS42b02k100s4, XGmiaeNS42b02k200s2, XGmiaeNS42b02k200s4,
    XGmiaeNS42b04k100s2, XGmiaeNS42b04k100s4, XGmiaeNS42b04k200s2, XGmiaeNS42b04k200s4,
    XGmiaeNS43b05k100s2, XGmiaeNS43b05k100s4, XGmiaeNS43b05k200s2, XGmiaeNS43b05k200s4,
    XGmiaeNS43b1k100s2, XGmiaeNS43b1k100s4, XGmiaeNS43b1k200s2, XGmiaeNS43b1k200s4,
    APPmiaeNS41b05k100s2, APPmiaeNS41b05k100s4, APPmiaeNS41b05k200s2, APPmiaeNS41b05k200s4,
    APPmiaeNS41b1k100s2, APPmiaeNS41b1k100s4, APPmiaeNS41b1k200s2, APPmiaeNS41b1k200s4,
    APPmiaeNS42b02k100s2, APPmiaeNS42b02k100s4, APPmiaeNS42b02k200s2, APPmiaeNS42b02k200s4,
    APPmiaeNS42b04k100s2, APPmiaeNS42b04k100s4, APPmiaeNS42b04k200s2, APPmiaeNS42b04k200s4,
    APPmiaeNS43b05k100s2, APPmiaeNS43b05k100s4, APPmiaeNS43b05k200s2, APPmiaeNS43b05k200s4,
    APPmiaeNS43b1k100s2, APPmiaeNS43b1k100s4, APPmiaeNS43b1k200s2, APPmiaeNS43b1k200s4
  )),
  method = rep(c("spforest", "XGboostPP", "APP"), each = 24)
)

save(tableNS, file = "Tables_NS.RData")

# Results for DPP ---------------------------------------------------------

## Generating the point patterns ------------------------------------------
### This should take approximately 42 hours.
source(file = "files_Tables/40_Tables_DPP_pp.R")

## RF OOB: Compute the score OOB for several hyperparameters --------------
### Without parallelism, this should take approximately 80 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 1.5 days.
source(file = "files_Tables/41_Tables_DPP_OOB.R")

## RF MIAE: Compute the MIAE for RF with the best hyperparameters ----------
### It should take approximately 1 hours
source(file = "files_Tables/42_Tables_DPP_RF_MIAE.R")


## XGboostPP MIAE: Compute the MIAE for XGboostPP --------------------------
### Without parallelism, this should take approximately 50 days.
### We recommend to use parallelism with 50 workers,
### where each worker will compute the OOB score for one of the Nsim realisations.
### Then it should take approximately 1 day.
source(file = "files_Tables/43_Tables_DPP_XG_MIAE.R")

## APP MIAE: Compute the MIAE for APP --------------------------------------
### This should take approximately 2.7 hours.
source(file = "files_Tables/44_Tables_DPP_APP.R")


## Displaying results for DPP ----

for (i in list.files("files_Tables/outputDPP", pattern = "^miaeDPP", full.names = TRUE)) {
  load(i)
}
for (i in list.files("files_Tables/outputDPP", pattern = "^XGmiaeDPP", full.names = TRUE)) {
  load(i)
}
for (i in list.files("files_Tables/outputDPP", pattern = "^APPmiaeDPP", full.names = TRUE)) {
  load(i)
}


tableDPP <- data.frame(
  covariates = rep(c(
    "2 (0 nuisance var.)",
    "2 (0 nuisance var.)",
    "10 (4 nuisance var.)",
    "10 (4 nuisance var.)",
    "10 (8 nuisance var.)",
    "10 (8 nuisance var.)"
  ), times = 3),
  beta = rep(c(0.2, 0.4, 0.1, 0.2, 0.2, 0.4), times = 3),
  do.call(rbind, list(
    miaeDPP41b02, miaeDPP41b04,
    miaeDPP42b01, miaeDPP42b02,
    miaeDPP43b02, miaeDPP43b04,
    XGmiaeDPP41b02, XGmiaeDPP41b04,
    XGmiaeDPP42b01, XGmiaeDPP42b02,
    XGmiaeDPP43b02, XGmiaeDPP43b04,
    APPmiaeDPP41b02, APPmiaeDPP41b04,
    APPmiaeDPP42b01, APPmiaeDPP42b02,
    APPmiaeDPP43b02, APPmiaeDPP43b04
  )),
  method = rep(c("spforest", "XGboostPP", "APP"), each = 6)
)

save(tableDPP, file = "Tables_DPP.RData")

# Ensure we deactivate parallelism at the end of the script
plan("sequential")
