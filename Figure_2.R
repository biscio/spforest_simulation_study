rm(list = ls())
source('00_prelim.R')
message("The computations should take approximately 15 seconds")
library(rgl)

# Figure 2 top left ----
close3d()
beimesh <- pptomesh(X = bei, elev = bei.extra$elev)
par3d(windowRect = c(0, 100, 900, 700))
shade3d(beimesh$mesh, col = "gray")
points3d(beimesh$pp, col = "black", size = 2, add = T)
view3d(theta = 10, phi = -50, zoom = 0.7)
# rgl.snapshot("Figure2_topleft.png")

# Figure 2 top right ----
close3d()
set.seed(2)
forestmesh <- spforest(X = beimesh, Ntree = 100)
plot(forestmesh, points = T, log = T, colorbar = T)
view3d(theta = 10, phi = -50, zoom = 0.7)
# rgl.snapshot("Figure2_topright.png")

# Figure 2 bottom left ----
close3d()
set.seed(2)
treemesh1 <- spforest(X = beimesh, Ntree = 1)
plot(treemesh1, points = T, log = T, colorbar = T)
view3d(theta = 10, phi = -50, zoom = 0.7)
# rgl.snapshot("Figure2_bottomleft.png")

# Figure 2 bottom right ----
close3d()
treemesh2 <- spforest(X = beimesh, Ntree = 1)
plot(treemesh2, points = T, log = T, colorbar = T)
view3d(theta = 10, phi = -50, zoom = 0.7)
# rgl.snapshot("Figure2_bottomright.png")
close3d()