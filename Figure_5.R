rm(list = ls())
library(future)
library(future.apply)
source(file = "00_prelim.R")


# Warning if run on a laptop ----
if (detectCores() < 25) {
  stop("We detected less than 25 cores. We strongly recommend to run this script on a server and not a laptop. As of now, parallel computations have been set to use 100 cores using the future package. The computations should take approximately 48 hours.")
}

# Computation for all the combinations of hyperparameters ----
future::plan("multisession", workers = 100)

Nsim <- 100
Ntree <- 300
argmtry <-seq(2, 15, by = 1)
argminpts <- 1 # c(seq(160, 20, by = -10))
argminvol <- seq(10000, 80000, by = 1000) # From approximately 2% to 15% of the total area

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

## Set all the hyperparameters
extrarg <- list(
  randmtry = FALSE,
  p = 0,
  score = "lcv",
  trueintensity = ztrue,
  Ntree = Ntree,
  X = X,
  listcovariates = beisoilres,
  saveforest = FALSE
)
argu <- expand.grid(argmtry, argminpts, argminvol)
names(argu) <- c("mtry", "minpts", "minvol")


## Compute the random forest for each point pattern and each combination of hyperparameters

resultall <- mapply(ftib,
                    mtry = argu$mtry,
                    minpts = argu$minpts,
                    minvol= argu$minvol,
                    MoreArgs = extrarg
)
resultall <- apply(
  resultall, 2,
  as_tibble
) |> bind_rows()

resultall <- select(resultall, -c("ERR"))
# save(resultall, file = "fig3_ALL.RData")

# Figure 5 ----

tibav <- resultall |>
  group_by(mtry, minvol) |>
  summarise(
    OOBscr = mean(OOBscr, na.rm = T),
    MISE = mean(MISE)
  ) |>
  ungroup() |>
  mutate(mtry = as.factor(mtry))

gg_color_hue <- function(n) {
  hues <- seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100)[1:n]
}
cols <- gg_color_hue(15)

p1 <- ggplot(
  tibav,
  aes(
    x = minvol, y = OOBscr,
    col = mtry,
    linetype = mtry
  )
) +
  geom_line(linewidth = 0.6) +
  coord_cartesian(ylim = c(
    diff(range(tibav$OOBscr)) * 0.9 +
      min(tibav$OOBscr),
    NA
  )) +
  ylab("OOB") +
  xlab(expression("Volume"[min])) +
  scale_color_manual(values = cols) +
  scale_linetype_manual(values = rep(1:5, 3)) +
  theme_bw() +
  theme(
    legend.key.width = unit(1.2, "cm"),
    axis.text = element_text(size = 12),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title = element_text(size = 14)
  )
p2 <- ggplot(
  tibav,
  aes(
    x = minvol, y = -MISE,
    col = mtry,
    linetype = mtry
  )
) +
  coord_cartesian(ylim = c(
    diff(-range(tibav$MISE)) * 0.15 +
      max(-tibav$MISE),
    NA
  )) +
  xlab(expression("Volume"[min])) +
  geom_line(linewidth = 0.6) +
  scale_color_manual(values = cols) +
  scale_linetype_manual(values = rep(1:5, 3)) +
  theme_bw() +
  theme(
    legend.key.width = unit(1.2, "cm"),
    axis.text = element_text(size = 12),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.title = element_text(size = 14)
  )

library(patchwork)
p1 + p2 + plot_layout(guides = "collect",widths = c(4, 4))
ggsave("Figure5.png")
future::plan("sequential")


