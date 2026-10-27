rm(list = ls())
source("00_prelim.R")
message("The computations should take approximately 14 hours. Parallelism can be added with the future package by uncommenting the line 'plan(\"multisession\", workers = 25)'.")

if (!requireNamespace("future")) {pak::pkg_install("future")}
if (!requireNamespace("future.apply")) {pak::pkg_install("future.apply")}
library(future)
library(future.apply)
#plan("multisession", workers = 25)

if (!requireNamespace("magick")) {pak::pkg_install("magick")}
if (!requireNamespace("latex2exp")) {pak::pkg_install("latex2exp")}
library(magick)
library(latex2exp)

# Create the output directory if it does not exist ------------------------
if (!dir.exists("outputXY")) {
  dir.create("outputXY")
}

# Generate 8 covariables and XY covariables -------------------------------

set.seed(358)
Nsim <- 100
allcovar <- spatstat.random::rGRFexpo(
  W = owin(c(0,1),c(0,1)),
  mu = 0,
  var = 0.5,
  scale = 0.5,
  nsim = 8
) |>
  solapply(exp) |>
  solapply(as.im, dimyx = c(64, 64))


Xcov <- as.im(function(x, y) x, W = owin(c(0,1),c(0,1)), dimyx = c(64, 64))
Ycov <- as.im(function(x, y) y, W = owin(c(0,1),c(0,1)), dimyx = c(64, 64))
allcovar <- append(allcovar, list(Xcov, Ycov))
names(allcovar) <- c(
  paste0("Cov", seq_along(allcovar)[1:8]),
  "X",
  "Y"
)
allcovarnorm <- lapply(allcovar, FUN = function(t) {
  (t - min(t)) / diff(range(t))
})


# Preliminary function to compute RF, vip and err with and without --------

rfwithXY <- function(X,
                     trueint,
                     listcov,
                     listcovX,
                     minpts = 40,
                     mtry = 1,
                     mtryXY = 1,
                     Ntree = 200,
                     parallel = F) {
  rf <- spforest(
    X = X,
    listcovariates = listcov,
    minpts = minpts,
    mtry = mtry,
    Ntree = Ntree,
    parallel = parallel
  )
  
  rfX <- spforest(
    X = X,
    listcovariates = listcovX,
    minpts = minpts,
    mtry = mtryXY,
    Ntree = Ntree,
    parallel = parallel
  )
  
  errXY <- mean(abs(as.im(rfX) - trueint))
  err <- mean(abs(as.im(rf) - trueint))
  
  return(list(
    rf = as.im(rf),
    rfX = as.im(rfX),
    err = err,
    errXY = errXY,
    rerr = (errXY - err) / err,
    vip = vip(rf),
    vipXY = vip(rfX)
  ))
}

# Scenario 1: Intensity with 2 covariates ---------------------------------

## Actual intensity without X ---------------------------------------------
trend <- allcovarnorm[[1]] + allcovarnorm[[2]]
trueint <- 500 * trend / mean(trend)
Z <- rpoispp(lambda = trueint, nsim = Nsim)

Scenario1 <- future_lapply(Z, FUN = function(i) {
  rfwithXY(
    X = i,
    trueint = trueint,
    listcov = allcovar[1:8],
    listcovX = allcovar,
    minpts = 40,
    mtry = 6,
    mtryXY = 7
  )
}, future.seed = T)

## Actual intensity with X ------------------------------------------------
trend <- allcovarnorm[[1]] + allcovarnorm[[9]] / 2
trueint <- 500 * trend / mean(trend)
Z <- rpoispp(lambda = trueint, nsim = Nsim)

Scenario1X <- future_lapply(Z, FUN = function(i) {
  rfwithXY(
    X = i,
    trueint = trueint,
    listcov = allcovar[1:8],
    listcovX = allcovar,
    minpts = 40,
    mtry = 6,
    mtryXY = 7
  )
}, future.seed = T)

# Scenario 2: Intensity with 4 covariates ---------------------------------

## Actual intensity without X ---------------------------------------------
trend <- 7 * allcovarnorm[[1]] * allcovarnorm[[2]] +
  allcovarnorm[[3]] +
  allcovarnorm[[4]]
trueint <- 500 * trend / mean(trend)
Z <- rpoispp(lambda = trueint, nsim = Nsim)

Scenario2 <- future_lapply(Z, FUN = function(i) {
  rfwithXY(
    X = i,
    trueint = trueint,
    listcov = allcovar[1:8],
    listcovX = allcovar,
    minpts = 40,
    mtry = 6,
    mtryXY = 7
  )
}, future.seed = T)

## Actual intensity with X ------------------------------------------------
trend <- 2 * allcovarnorm[[9]] * allcovarnorm[[2]] +
  allcovarnorm[[3]] +
  allcovarnorm[[4]]
trueint <- 500 * trend / mean(trend)
Z <- rpoispp(lambda = trueint, nsim = Nsim)

Scenario2X <- future_lapply(Z, FUN = function(i) {
  rfwithXY(
    X = i,
    trueint = trueint,
    listcov = allcovar[1:8],
    listcovX = allcovar,
    minpts = 40,
    mtry = 6,
    mtryXY = 7
  )
}, future.seed = T)


save(Scenario1, Scenario1X, Scenario2, Scenario2X,
     file = "outputXY/ScenariosXY.RData"
)


# Averaging the results and displaying them -------------------------------

## Names in list: "rf"    "rfX"   "err"   "errXY" "rerr"  "vip"   "vipXY"
## rerr = (errXY-err)/err
## Positive values means that adding XY coordinates increase the error

summaryXY <- function(Scenario) {
  meanerror <- sapply(Scenario, FUN = function(i) {
    i$rerr
  }) |> mean()
  sderror <- sapply(Scenario, FUN = function(i) {
    i$rerr
  }) |> sd()
  
  meanvip <- sapply(Scenario, FUN = function(i) {
    i$vip
  }) |> rowMeans()
  meanvipXY <- sapply(Scenario, FUN = function(i) {
    i$vipXY
  }) |> rowMeans()
  
  return(list(
    meanrelativeerror = meanerror,
    sderror = sderror,
    meanvip = meanvip,
    meanvipXY = meanvipXY
  ))
}

resultat1 <- summaryXY(Scenario = Scenario1)
resultat1X <- summaryXY(Scenario = Scenario1X)
resultat2 <- summaryXY(Scenario = Scenario2)
resultat2X <- summaryXY(Scenario = Scenario2X)

save(resultat1, resultat1X,
     resultat2, resultat2X,
     file = "outputXY/resultatXY.RData"
)


# MIAE --------------------------------------------------------------------

load(file = "outputXY/resultatXY.RData")

resultat1$meanrelativeerror
resultat1X$meanrelativeerror
resultat1$sderror
resultat1X$sderror

resultat2$meanrelativeerror
resultat2X$meanrelativeerror
resultat2$sderror
resultat2X$sderror


# VIMP --------------------------------------------------------------------

resultat1$meanvip
resultat1$meanvipXY
resultat1X$meanvip
resultat1X$meanvipXY

resultat2$meanvip
resultat2$meanvipXY
resultat2X$meanvip
resultat2X$meanvipXY

# VIMP plots ---------------------------------------------------------------

## Function to include the correct labels, ggplot's theme, and save file
toggbarplot <- function(myvip = resultat1$meanvip,
                        namevip = c(
                          expression(Z[1]),
                          expression(Z[2])
                        ),
                        filename = NULL,
                        width = 5,
                        height = 3) {
  df <- tibble(
    VIMP = myvip,
    covariates = names(myvip)
  )
  
  p <- ggplot(
    df,
    aes(x = covariates, VIMP)
  ) +
    geom_col(width = 0.4) +
    scale_x_discrete(
      labels = namevip
    ) +
    theme_bw() +
    theme(
      legend.position = "bottom",
      aspect.ratio = 1,
      axis.text.x = element_text(size = 15),
      axis.text.y = element_text(size = 7),
      axis.title = element_text(size = 10),
      axis.title.x = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
  
  if (!is.null(filename)) {
    ggsave(
      filename = paste0("outputXY/", filename),
      plot = p,
      width = width,
      height = height
    )
    
    img <- image_read(paste0("outputXY/", filename))
    img_crop <- image_trim(img)
    image_write(img_crop, paste0("outputXY/", filename))
  }
  
  return(p)
}

# Scenario 1: VIMP plots --------------------------------------------------
nameZ <- as.expression(lapply(1:8, FUN = function(i) {
  bquote(Z[.(i)])
}))

toggbarplot(
  myvip = resultat1$meanvip,
  namevip = nameZ,
  filename = "p1vip.jpg",
  width = 8,
  height = 4
)

labs(x = TeX("$x$"))

toggbarplot(
  myvip = resultat1$meanvipXY,
  namevip = c(
    nameZ,
    'x',
    expression(y)
  ),
  filename = "p1vipXY.jpg",
  width = 8,
  height = 4
)

toggbarplot(
  myvip = resultat1X$meanvipXY,
  namevip = c(
    nameZ,
    expression(x),
    expression(y)
  ),
  filename = "p1XvipXY.jpg",
  width = 8,
  height = 4
)

# Scenario 2: VIMP plots -------------------------------------------------

nameZ <- as.expression(lapply(1:8, FUN = function(i) {
  bquote(Z[.(i)])
}))

toggbarplot(
  myvip = resultat2$meanvip,
  namevip = nameZ,
  filename = "p2vip.jpg",
  width = 8,
  height = 4
)
toggbarplot(
  myvip = resultat2$meanvipXY,
  namevip = c(nameZ, expression(x), expression(y)),
  filename = "p2vipXY.jpg",
  width = 8,
  height = 4
)
toggbarplot(
  myvip = resultat2X$meanvipXY,
  namevip = c(nameZ, expression(x), expression(y)),
  filename = "p2XvipXY.jpg",
  width = 8,
  height = 4
)