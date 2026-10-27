# Simulation Study


The scripts in this repository reproduce the figures and the tables of
the article *Nonparametric intensity estimation of spatial point
processes by random forests,*
[arXiv:2511.09307](https://arxiv.org/abs/2511.09307), 2025. They use the
companion package [`spforest`](https://github.com/biscio/spforest)
currently under active development.

For convenience, we recommend downloading the entire repository and
opening the `.Rproj` file in Rstudio. Utility functions and dependencies
are coded in the file `00_prelim.R`, which is sourced at the beginning
of every other script.

In detail :

- `Figure_1.R` illustrates the intensity estimation of the `concrete`
  dataset, based on a single tessellation and on 100 independent
  tessellations. No covariates are used in this example.

- `Figure_2.R` shows the intensity estimation of the `bei` dataset on
  the manifold defined by the geographical topography of its observation
  domain. Again, no covariates are used.

- `Figure_3_4.R` concerns the application to the 2D `bei` dataset using
  all available covariates. It shows both the estimated log-intensity
  and the VIMP scores of all covariates.

- `Figure_5.R` reports the out-of-bag (OOB) scores and the MISE scores
  over a grid of hyperparameters $minvol$ and $mtry$ involved in the
  random forest intensity estimation of a synthetic dataset.

- `Figure_6.R` presents the intensity estimation results for a synthetic
  dataset using: the random forest estimator with covariates, when
  hyperparameters are selected by OOB cross-validation; the estimator
  without covariates; and a (misspecified) parametric log-linear model.

- `Figure_7.R` displays the distribution of variable importance (VIP)
  scores for all covariates, over 100 replications of the random forest
  intensity estimation of the previous synthetic dataset.

- `Figure_8.R` shows the effect of the xy-spatial coordinates on the
  accuracy of the random forest estimator, and on the VIMP. The code
  also outputs the values for Table 1.

- `Tables.R` reproduces the simulation study comparing the random forest
  approach to state-of-the-art methods for estimating the intensity of
  benchmark models, and reported in Tables 2,3,4, and 5 of our article.
  To run this script, the deprecated R package `RandomFields` is
  required. The last version can be installed from the CRAN archive
  repository:
  <https://cran.r-project.org/src/contrib/Archive/RandomFields>.
