# Poisson - Number of covariates 2 (0 nuisance variables) -----------------
pp41b05 <- genpoi(
  beta = 0.5, avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  Nsim = Nsim
)
save(pp41b05, file = "files_Tables/outputPoisson/pp41b05.RData")

pp41b1 <- genpoi(
  beta = 1, avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  Nsim = Nsim
)
save(pp41b1, file = "files_Tables/outputPoisson/pp41b1.RData")


# Poisson - Number of covariates 10 (4 nuisance variables) -----------------
pp42b02 <- genpoi(
  beta = 0.2, avpoint = 400,
  pol = poly42,
  Nsim = Nsim
)
save(pp42b02, file = "files_Tables/outputPoisson/pp42b02.RData")

pp42b04 <- genpoi(
  beta = 0.4, avpoint = 400,
  pol = poly42,
  Nsim = Nsim
)
save(pp42b04, file = "files_Tables/outputPoisson/pp42b04.RData")


# Poisson - Number of covariates 10 (8 nuisance variables) -----------------
pp43b05 <- genpoi(
  beta = 0.5, avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  Nsim = Nsim
)
save(pp43b05, file = "files_Tables/outputPoisson/pp43b05.RData")

pp43b1 <- genpoi(
  beta = 1, avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  Nsim = Nsim
)
save(pp43b1, file = "files_Tables/outputPoisson/pp43b1.RData")
