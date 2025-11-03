rm(list=ls())
library(spforest)

# Getting the date from spatstat.data ----
win_concrete <- Window(concrete)
epsilonx <- diff(win_concrete$xrange) / 100
xx <- win_concrete$xrange + c(epsilonx, -epsilonx)
epsilony <- diff(win_concrete$yrange) / 100
yy <- win_concrete$yrange + c(epsilony, -epsilony)
subwin <- intersect.owin(owin(xrange = xx, yrange = yy), win_concrete)
X <- concrete[subwin]

# Figure 1 Left ----
par(mar = c(1, 1, 1, 1))
plot(X, col = "lightgray", cols = 1, pch = 20, main = "")
plot(X, add = T, pch = 20, box = T)
# dev.print(pdf, "Figure1_left.pdf", width = 5, height = 5)

# Figure 1 Middle ----
set.seed(3)
tree <- spforest(X, lambda = 40, Ntree = 1, test.connected = TRUE, dimyx = c(512, 512))
plot(X, col = "lightgray", cols = 1, pch = 20, main = "")
plot(1e6*as.im(tree), add=T, ribbon=T)
points(X, pch = 20)
# dev.print(pdf, "Figure1_middle.pdf", width = 5, height = 5)

# Figure 1 Right ----
forest <- spforest(X, lambda = 40, Ntree = 100, test.connected = TRUE, dimyx = c(512, 512))
plot(1e6*as.im(forest), main = "")
plot(Window(as.im(forest)), col = c("lightgray", "transparent"), add = T)
plot(X, add = T, pch = 20)
# dev.print(pdf, "Figure1_right.pdf", width = 5, height = 5)

