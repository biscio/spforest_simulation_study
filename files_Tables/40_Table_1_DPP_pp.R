# DPP - Number of covariates 2 (0 nuisance variables) ---------------------

DPP41b02 <- genDPP(
  beta = 0.2, avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  Nsim = Nsim
)
save(DPP41b02, file = "files_Tables/outputDPP/DPP41b02.RData")

DPP41b04 <- genDPP(
  beta = 0.4, avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  Nsim = Nsim
)
save(DPP41b04, file = "files_Tables/outputDPP/DPP41b04.RData")

# DPP -  Number of covariates 10 (4 nuisance variables) ---------------------
DPP42b01 <- genDPP(
  beta = 0.1, avpoint = 400,
  pol = poly42,
  Nsim = Nsim
)
save(DPP42b01, file = "files_Tables/outputDPP/DPP42b01.RData")

DPP42b02 <- genDPP(
  beta = 0.2, avpoint = 400,
  pol = poly42,
  Nsim = Nsim
)
save(DPP42b02, file = "files_Tables/outputDPP/DPP42b02.RData")

# DPP -  Number of covariates 10 (8 nuisance variables) ---------------------
DPP43b02 <- genDPP(
  beta = 0.2, avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  Nsim = Nsim
)
save(DPP43b02, file = "files_Tables/outputDPP/DPP43b02.RData")

DPP43b04 <- genDPP(
  beta = 0.4, avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  Nsim = Nsim
)
save(DPP43b04, file = "files_Tables/outputDPP/DPP43b04.RData")
