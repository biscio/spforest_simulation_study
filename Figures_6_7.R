source(file = "00_prelim.R")

# No parallelism is used ----
message("The computations should take approximately 30 minutes. To reduce time, you may change the argument Ntree from 500 to 100, which still shows good results.")

Ntree <- 500

# Figure 6 ----

forestsmooth <- spforest(
  X = bei,
  listcovariates = bcismooth,
  Ntree = Ntree,
  minpts = 10,
  mtry = 15
)

co2 <- colourmap(
  getSpatstatVariable("DefaultImageColours")[1:256],
  range = c(
    -9.236416,
    range(log(as.im(forestsmooth)))[2]
  )
)

plot(log(as.im(forestsmooth)),
  main = "",
  col = co2,
  ribbon = TRUE,
  ribsep = 0.05,
  workaround = FALSE,
  ribargs = list(cex.axis = 1)
)
# dev.print(pdf,
#   "Figure6.pdf",
#   width = 9, height = 5
# )

# Figure 7 ----

df <- tibble(
  VIP = vip(forestsmooth),
  covariates = names(bcismooth)
)

ggplot(df, aes(x = reorder(covariates, -VIP), VIP)) +
  geom_col(width = 0.7) +
  theme_bw() +
  theme(
    legend.position = "bottom",
    aspect.ratio = 0.25,
    axis.text = element_text(size = 10),
    axis.title = element_text(size = 10),
    axis.title.x = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
# ggsave(
#   width = 7,
#   height = 2,
#   dpi = 300,
#   filename = "Figure7.eps"
# )
