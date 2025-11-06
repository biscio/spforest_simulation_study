rm(list = ls())
source(file = "00_prelim.R")
message("The computations should take approximately 1 hour.")
Nsim <- 100
Ntree <- 300

## Generate the point patterns
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


# Figure 5 -----

forestforvip <- lapply(X, FUN = function(i) {
  spforest(
    X = i,
    listcovariates = bcismooth,
    mtry = 7,
    minpts = 70,
    Ntree = Ntree,
    parallel = F
  )
})

avvip <- NULL
for (j in 1:length(X)) {
  avvip[[j]] <- vip(forestforvip[[j]])
  print(j)
}

boxvip <- do.call(rbind, avvip) |>
  as_tibble()

ggboxvip <- pivot_longer(
  data = boxvip,
  cols = everything(),
  names_to = "Covariable",
  values_to = "VIP"
)

ggplot(ggboxvip, aes(x = Covariable, y = VIP)) +
  geom_boxplot(
    outlier.size = 1,
    staplewidth = 0.3,
    outliers = FALSE,
    fill = "grey"
  ) +
  theme_bw() +
  theme(
    legend.position = "none",
    axis.text = element_text(size = 15),
    axis.title = element_text(size = 15),
    title = element_text(size = 20),
    panel.grid.major = element_line(
      colour = "grey70",
      linewidth = 0.2
    ),
    panel.grid.minor = element_line(
      colour = "grey70",
      linewidth = 0.1
    )
  ) +
  xlab("")
# ggsave("Figure5.png")
