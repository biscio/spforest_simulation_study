if (!requireNamespace("pak")) {install.packages("pak")}
if (!requireNamespace("parallel")) {pak::pkg_install("parallel")}
if (!requireNamespace("rgl")) {pak::pkg_install("rgl")}
if (!requireNamespace("spatstat")) {pak::pkg_install("spatstat")}
if (!requireNamespace("tidyverse")) {pak::pkg_install("tidyverse")}
if (!requireNamespace("patchwork")) {pak::pkg_install("patchwork")}
if (!requireNamespace("pracma")) {pak::pkg_install("pracma")}
if (!requireNamespace("spforest")) {pak::pkg_install("biscio/spforest")}

library(spatstat)
library(tidyverse)
library(parallel)
library(spforest)


#  Computing the errors ----

mise <- function(x,
                 trueint = 500 * Z / integral(Z)) {
  spatstat.geom::integral.im((as.im(x) - trueint)^2)
}

err <- function(x,
                trueint = 500 * Z / integral(Z)) {
  return(as.im(x) - trueint)
}

miseppm <- function(x,
                    trueint = 500 * Z / integral(Z),
                    data = beisoilres) {
  trend <- ppm(x, ~., data = data)
  spatstat.geom::integral.im((
    predict(trend, dimyx = dim(trueint)) - trueint)^2)
}

# Reformat data in tibble ----

## Function to compute the output as a tibble
ftib <- function(X,
                 trueintensity = 500 * Z / integral(Z),
                 listcovariates = beisoilres,
                 score = "lcv",
                 p = 0,
                 Ntree = 10,
                 minpts = 50,
                 threshold = 2*smallest_pixelarea(listcovariates), # Safety net but should never be reached (area(pixel)=25)
                 cores_trees = 1,
                 tol = Inf,
                 mtry = 1,
                 randmtry = TRUE,
                 coresPP = 1,
                 error = TRUE,
                 OOB = TRUE,
                 saveforest = FALSE,
                 savelocation = "output/") {
  listsimu <- mclapply(
    X = X, FUN = function(i) {
      spforest(
        X = i,
        listcovariates = listcovariates,
        score = score,
        p = p,
        Ntree = Ntree,
        minpts = minpts,
        threshold = threshold,
        mtry = mtry,
        randmtry = randmtry
      )
    },
    mc.cores = coresPP
  )
  names(listsimu) <- NULL

  nbsim <- length(X)

  output <- tibble(
    ID = 1:nbsim,
    forest = listsimu,
    score = rep(score, nbsim),
    p = rep(p, nbsim),
    Ntree = rep(Ntree, nbsim),
    minpts = rep(minpts, nbsim),
    threshold = rep(threshold, nbsim),
    mtry = rep(mtry, nbsim)
  ) |> bind_rows()

  if (saveforest) {
    print("Start saving forest")
    save(output, file = paste0(
      savelocation,
      "forestNtr", Ntree,
      "p", sub("\\.", "", round(p, 1)),
      "mtry", sub("\\.", "", round(mtry, 1)),
      "minpts", minpts,
      ".RData"
    ))
  }

  if (error) {
    print("Start computing error")
    MISE <- unlist(lapply(output$forest,
      FUN = mise,
      trueint = trueintensity
    ))

    ERR <- lapply(output$forest,
      FUN = err,
      trueint = trueintensity
    )

    output <- add_column(output, MISE = MISE, ERR = ERR)
  }

  if (OOB) {
    print("Start computing OOB")
    #### Computation of OOB
    OOBconc <- NULL
    for (i in 1:length(output$forest)) {
      OOBconc[[i]] <- OOBscr(
        forest = output$forest[[i]]
      )
    }
    output <- mutate(output,
      OOBscr = unlist(OOBconc)
    )
  }
  print(paste0(
    "Done: p=", round(p, 3),
    ", Ntree=", Ntree,
    ", mtry=", round(mtry, 3),
    ", minpts=", minpts
  ))
  # Return the object without the forests
  return(select(output, -forest))
}





#  To handle RF ----

absim <- function(Z) {
  abs(Z) / mean(abs(Z))
}

normim <- function(Z, rho = 500) {
  rho * abs(Z) / integral(abs(Z))
}

Zx <- as.im.funxy(
  function(x, y, ...) {
    x
  },
  W = Window(beisoilres[[1]]),
  dimyx = dim(beisoilres[[1]])
)
Zy <- as.im.funxy(
  function(x, y, ...) {
    y
  },
  W = Window(beisoilres[[1]]),
  dimyx = dim(beisoilres[[1]])
)

XYbeisoil <- c(beisoilres, list(x = Zx, y = Zy))

# Plotting ----

## My theme
mytheme <- theme_bw() + theme(
  legend.position = "bottom",
  aspect.ratio = 1,
  axis.text = element_text(size = 35),
  # axis.text.x = element_text(angle = 315),
  axis.title = element_text(size = 30),
  title = element_text(size = 20),
  legend.title = element_blank(),
  legend.text = element_text(size = rel(3)),
  # legend.spacing.x = unit(2.0, 'cm'), # space between axe and name of the key item
  legend.key.width = unit(5, "line"),
  # legend.title = element_text(size = 30),
  panel.grid.major = element_line(colour = "grey70", linewidth = 0.2),
  panel.grid.minor = element_line(colour = "grey70", linewidth = 0.1)
)


## To normalise the plots

normalise <- function(t) {
  (t - min(t)) / diff(range(t))
}

normalise_score <- function(x, param) {
  x %>%
    group_by({{ param }}) %>%
    summarise(
      OOB = mean(OOBscr, na.rm = T),
      MISE = mean(MISE)
    ) %>%
    mutate(
      scOOB = normalise(OOB),
      scMISE = normalise(MISE)
    ) %>%
    select({{ param }}, scOOB, scMISE) %>%
    pivot_longer(
      cols = c(scOOB, scMISE),
      names_to = "sc_score", values_to = "sc_value"
    ) %>%
    mutate_at("sc_score", str_replace, "sc", "")
}

## Plot OOB vs MISE
plotresults <- function(
    gg,
    param,
    xlab = "",
    title = "") {
  ggplot(gg, aes(
    x = {{ param }},
    y = sc_value,
    color = sc_score,
    linetype = sc_score
  )) +
    geom_line(lwd = 1.25) +
    geom_point(size = 5) +
    labs(title = title) +
    ylab("Normalised score") +
    xlab(xlab) +
    mytheme +
    scale_color_brewer(palette = "Dark2")
}

# Theme for vip barplots

themevip <- theme_bw() +
    theme(
        legend.position = "bottom",
        aspect.ratio = 0.25,
        axis.text = element_text(size = 10),
        # axis.text.x = element_text(angle = 315),
        axis.title = element_text(size = 10),
        axis.title.x = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()
    )
