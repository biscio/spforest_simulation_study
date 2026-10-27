# LGCP - Number of covariates 2 (0 nuisance variables) --------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 -----------------------------
LGCP41b05v1s2 <- genLGCP(
  object_name = "LGCP41b05v1s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - variance = 1.0 - scale = 0.04 -----------------------------
LGCP41b05v1s4 <- genLGCP(
  object_name = "LGCP41b05v1s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)


## Beta = 0.5 - variance = 2.0 - scale = 0.02 -----------------------------
LGCP41b05v2s2 <- genLGCP(
  object_name = "LGCP41b05v2s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - variance = 2.0 - scale = 0.04  -----------------------------
LGCP41b05v2s4 <- genLGCP(
  object_name = "LGCP41b05v2s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1 - variance = 1.0 - scale = 0.02 -------------------------------
LGCP41b1v1s2 <- genLGCP(
  object_name = "LGCP41b1v1s2",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------

LGCP41b1v1s4 <- genLGCP(
  object_name = "LGCP41b1v1s4",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
LGCP41b1v2s2 <- genLGCP(
  object_name = "LGCP41b1v2s2",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)
## Beta = 1 - variance = 2.0 - scale = 0.04 -----------------------------
LGCP41b1v2s4 <- genLGCP(
  object_name = "LGCP41b1v2s4",
  beta = 1,
  avpoint = 400,
  pol = covar41[[1]] + covar41[[2]],
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)
print("Done simulations - LGCP - 2 covariates (0 nuisance variables)")

# LGCP - Number of covariates 10 (4 nuisance variables) ----------------

## Beta = 0.4 - variance = 1.0 - scale = 0.02 ---------------------------
LGCP42b04v1s2 <- genLGCP(
  object_name = "LGCP42b04v1s2",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.4 - variance = 1.0 - scale = 0.04 ---------------------------
LGCP42b04v1s4 <- genLGCP(
  object_name = "LGCP42b04v1s4",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.4 - variance = 2.0 - scale = 0.02 ----------------------------
LGCP42b04v2s2 <- genLGCP(
  object_name = "LGCP42b04v2s2",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.4 - variance = 2.0 - scale = 0.04 ------------------------------
LGCP42b04v2s4 <- genLGCP(
  object_name = "LGCP42b04v2s4",
  beta = 0.4,
  avpoint = 400,
  pol = poly42,
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.2 - variance = 1.0 - scale = 0.02 ------------------------------
LGCP42b02v1s2 <- genLGCP(
  object_name = "LGCP42b02v1s2",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.2 - variance = 1.0 - scale = 0.04 ------------------------------
LGCP42b02v1s4 <- genLGCP(
  object_name = "LGCP42b02v1s4",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.2 - variance = 2.0 - scale = 0.02 ------------------------------
LGCP42b02v2s2 <- genLGCP(
  object_name = "LGCP42b02v2s2",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.2 - variance = 2.0 - scale = 0.04 ------------------------------
LGCP42b02v2s4 <- genLGCP(
  object_name = "LGCP42b02v2s4",
  beta = 0.2,
  avpoint = 400,
  pol = poly42,
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)

print("Done simulations - LGCP - 10 covariates (4 nuisance variables)")

# LGCP -  Number of covariates 10 (8 nuisance variables) ------------------

## Beta = 0.5 - variance = 1.0 - scale = 0.02 ------------------------------
LGCP43b05v1s2 <- genLGCP(
  object_name = "LGCP43b05v1s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - variance = 1.0 - scale = 0.04 ------------------------------
LGCP43b05v1s4 <- genLGCP(
  object_name = "LGCP43b05v1s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 0.5 - variance = 2.0 - scale = 0.02 ------------------------------
LGCP43b05v2s2 <- genLGCP(
  object_name = "LGCP43b05v2s2",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 0.5 - variance = 2.0 - scale = 0.04 ------------------------------
LGCP43b05v2s4 <- genLGCP(
  object_name = "LGCP43b05v2s4",
  beta = 0.5,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1 - variance = 1.0 - scale = 0.02 ------------------------------
LGCP43b1v1s2 <- genLGCP(
  object_name = "LGCP43b1v1s2",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 1.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1 - variance = 1.0 - scale = 0.04 ------------------------------
LGCP43b1v1s4 <- genLGCP(
  object_name = "LGCP43b1v1s4",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 1.0,
  sigscale = 0.04,
  Nsim = Nsim
)

## Beta = 1 - variance = 2.0 - scale = 0.02 ------------------------------
LGCP43b1v2s2 <- genLGCP(
  object_name = "LGCP43b1v2s2",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 2.0,
  sigscale = 0.02,
  Nsim = Nsim
)

## Beta = 1 - variance = 2.0 - scale = 0.04 ------------------------------
LGCP43b1v2s4 <- genLGCP(
  object_name = "LGCP43b1v2s4",
  beta = 1,
  avpoint = 400,
  pol = covar42[[1]] + covar42[[2]],
  var = 2.0,
  sigscale = 0.04,
  Nsim = Nsim
)

print("Done simulations - LGCP - 10 covariates (8 nuisance variables)")
