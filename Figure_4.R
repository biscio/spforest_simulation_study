rm(list=ls())
source(file = "00_prelim.R")
message("The computations should take approximately 2 minutes.")
# Generate the point patterns ----
Nsim <- 100
beismooth01 <- lapply(bcismooth,
  FUN = function(x) {
    (x - min(x)) / (max(x) - min(x))
  }
)

nonlinpart <- 1 + sin(20 + bcismooth$Mn / 100)
zunnorm <- exp(nonlinpart / 2 + 1.2 * beismooth01$Zn + 0.8 * beismooth01$Fe)
ztrue <- 1000 * zunnorm / integral(zunnorm)
set.seed(47)
X <- rpoispp(lambda = ztrue, nsim = Nsim)


# Figure 4 ----

colbase <- colourmap(getSpatstatVariable("DefaultImageColours")[1:256],
  range = c(0, 1 * range(ztrue)[2])
)

par(mar = c(0, 0, 0.3, 1))

## Figure 4 top left ----
# pdf(file = "Figure4_topleft.pdf",  width = 10,  height = 5,  pointsize = 8)
plot(ztrue,
  main = "",
  col = colbase,
  ribbon = TRUE,
  ribsep = 0.05,
  workaround = FALSE,
  ribargs = list(cex.axis = 1.5)
)
# dev.off()

## Figure 4 top right ----
# pdf(file = "Figure4_topright.pdf",  width = 10,  height = 5,  pointsize = 8)
Estimforest <- spforest(
  X = X[[3]],
  listcovariates = bcismooth,
  mtry = 7,
  minpts = 70,
  Ntree = 500
)
plot(as.im(Estimforest),
  main = "",
  col = colbase,
  ribbon = TRUE,
  ribsep = 0.05,
  workaround = FALSE,
  ribargs = list(cex.axis = 1.5)
)
# dev.off()

## Figure 4 bottom left ----
# pdf(file = "Figure4_bottomleft.pdf",  width = 10,  height = 5,  pointsize = 8)
lambdatess <- spforest(X[[3]],
  Ntree = 300,
  dimyx = c(101, 201)
)
plot(lambdatess,
  main = "",
  col = colbase,
  ribbon = TRUE,
  ribsep = 0.05,
  workaround = FALSE,
  ribargs = list(cex.axis = 1.5)
)
# dev.off()

## Figure 4 bottom right ----
# pdf(file = "Figure4_bottomright.pdf",  width = 10,  height = 5,  pointsize = 8)
plot(predict(ppm(X[[3]], ~., data = bcismooth)),
  main = "",
  col = colbase,
  ribbon = TRUE,
  ribsep = 0.05,
  workaround = FALSE,
  ribargs = list(cex.axis = 1.5)
)
# dev.off()