# NS - Number of covariates 2 (0 nuisance variables) ---------------------

## Beta = 0.5 - kappa = 100 - sigma = 0.02 -------------------------------
NS41b05k100s2 <- genNS(
  object_name = "NS41b05k100s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
NS41b05k100s4 <- genNS(
  object_name = "NS41b05k100s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
NS41b05k200s2 <- genNS(
  object_name = "NS41b05k200s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 200,
  sigscale = 0.01,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
NS41b05k200s4 <- genNS(
  object_name = "NS41b05k200s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
NS41b1k100s2 <- genNS(
  object_name = "NS41b1k100s2",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
NS41b1k100s4 <- genNS(
  object_name = "NS41b1k100s4",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
NS41b1k200s2 <- genNS(
  object_name = "NS41b1k200s2",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 200,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
NS41b1k200s4 <- genNS(
  object_name = "NS41b1k200s4",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

print("Done simulations - NS - 2 covariates (0 nuisance variables)")

# NS - Number of covariates 10 (4 nuisance variables) ---------------------

## Beta = 0.2 - kappa = 100 - sigma = 0.02 --------------------------------
NS42b02k100s2 <- genNS(
  object_name = "NS42b02k100s2",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.2 - kappa = 100 - sigma = 0.04 --------------------------------

NS42b02k100s4 <- genNS(
  object_name = "NS42b02k100s4",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.2 - kappa = 200 - sigma = 0.02 --------------------------------
NS42b02k200s2 <- genNS(
  object_name = "NS42b02k200s2",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  rho = 200,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.2 - kappa = 200 - sigma = 0.04 --------------------------------
NS42b02k200s4 <- genNS(
  object_name = "NS42b02k200s4",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.4 - kappa = 100 - sigma = 0.02 --------------------------------
NS42b04k100s2 <- genNS(
  object_name = "NS42b04k100s2",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.4 - kappa = 100 - sigma = 0.04 --------------------------------
NS42b04k100s4 <- genNS(
  object_name = "NS42b04k100s4",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.4 - kappa = 200 - sigma = 0.02 --------------------------------
NS42b04k200s2 <- genNS(
  object_name = "NS42b04k200s2",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  rho = 200,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.4 - kappa = 200 - sigma = 0.04 --------------------------------
NS42b04k200s4 <- genNS(
  object_name = "NS42b04k200s4",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

print("Done simulations - NS - 10 covariates (4 nuisance variables)")

# NS - Number of covariates 10 (8 nuisance variables) ---------------------

## Beta = 0.5 - kappa = 100 - sigma = 0.02 --------------------------------
NS43b05k100s2 <- genNS(
  object_name = "NS43b05k100s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 100 - sigma = 0.04 --------------------------------
NS43b05k100s4 <- genNS(
  object_name = "NS43b05k100s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 200 - sigma = 0.02 --------------------------------
NS43b05k200s2 <- genNS(
  object_name = "NS43b05k200s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 200,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - kappa = 200 - sigma = 0.04 --------------------------------
NS43b05k200s4 <- genNS(
  object_name = "NS43b05k200s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 100 - sigma = 0.02 --------------------------------
NS43b1k100s2 <- genNS(
  object_name = "NS43b1k100s2",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 100,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 100 - sigma = 0.04 --------------------------------
NS43b1k100s4 <- genNS(
  object_name = "NS43b1k100s4",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 100,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 200 - sigma = 0.02 --------------------------------
NS43b1k200s2 <- genNS(
  object_name = "NS43b1k200s2",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 200,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1.0 - kappa = 200 - sigma = 0.04 --------------------------------
NS43b1k200s4 <- genNS(
  object_name = "NS43b1k200s4",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  rho = 200,
  sigscale = 0.04,
  Nsim = Nsim
)

print("Done simulations - NS - 10 covariates (8 nuisance variables)")
