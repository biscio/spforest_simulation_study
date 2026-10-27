source(file = "00_prelim.R")

# No parallelism is used ----
message("The computations should take approximately 1 hour. To reduce time, you may change the argument Ntree from 500 to 100, which still shows good results.")

Ntree <- 500

# Figure 3 ----

### Code to find the largest OOB
# library(future)
# library(future.apply)
# library(future.mirai)
# plan("mirai_multisession", workers=50)
# gridparams <- list(
#   mtry = 1:length(bcismooth),
#   minpts = 1,
#   minvol = floor(area(bcismooth[[1]])/seq(2,50, by = 2)),
#   Ntree = 500
# )
# 
# alloob <- OOBoptim(bei,
#                    listcovariates = bcismooth,
#                    params = gridparams,
#                    parallel = T)
# alloob[which.max(alloob$OOB),]
# plan("sequential")

forestsmooth <- spforest(
  X = bei,
  listcovariates = bcismooth,
  Ntree = Ntree,
  minpts = 1,
  minvol =  250,
  mtry = 12,
  verbose = F,
  parallel = F
)

co2 <- colourmap(
  getSpatstatVariable("DefaultImageColours")[1:256],
  range = c(
    range(log(as.im(forestsmooth)))[1],
    range(log(as.im(forestsmooth)))[2]
  )
)

pdf(file = "Figure3.pdf",  width = 9,  height = 5)
plot(log(as.im(forestsmooth)),
     main = "",
     col = co2,
     ribbon = TRUE,
     ribsep = 0.05,
     workaround = FALSE,
     ribargs = list(cex.axis = 1)
)
dev.off()
# dev.print(pdf,
#   "Figure3.pdf",
#   width = 9, height = 5
# )


# Figure 4 ----

df <- tibble(
  VIMP = vip(forestsmooth),
  covariates = names(bcismooth)
)

ggplot(df, aes(x = reorder(covariates, -VIMP), VIMP)) +
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
ggsave(
  width = 7,
  height = 2,
  dpi = 300,
  filename = "Figure4.jpeg"
)
