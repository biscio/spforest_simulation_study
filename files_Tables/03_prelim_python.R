# The following code is an integration of the Python package HidKim_APP into R. 

# The package HidKim_APP adapt the Augmented Permanental Process estimation 
# method from the article: 
# Hideaki Kim, Taichi Asami, and Hiroyuki Toda. 
# "Fast Bayesian Estimation of Point Process Intensity as Function of Covariates", 
# Advances in Neural Information Processing Systems 35, 2022.


# Preliminary Python Integration in R for Point Process Analysis -----------
library(spatstat)
if (!requireNamespace("reticulate")) {pak::pkg_install("reticulate")}
library(reticulate)

# Function to export ppp and im objects into list to be imported in python ----
pptolist <- function(pp, listcovar = covar41) {
  data <- data.frame(
    x = pp$x, y = pp$y,
    lapply(listcovar, function(i) {
      i[pp]
    })
  )

  g <- expand.grid(1:128, 1:128)
  dummys <- data.frame(
    x = (2 * g$Var2 - 1) / 256, 
    # need to revert to account for the y,x indexing of im.object.
    y = (2 * g$Var1 - 1) / 256,
    lapply(listcovar, function(i) {
      as.vector(i$v)
    })
  )

  # foot <- dummys[, c("x", "y")]
  # foocov <- dummys[, -c(1, 2)]
  # foospk <- data[, c("x", "y")]
  # foospk_cov <- data[, -c(1, 2)]
  foo <- list(
    t = as.matrix(dummys[, c("x", "y")]),
    cov = as.matrix(dummys[, -c(1, 2)]),
    spk = as.matrix(data[, c("x", "y")]),
    spk_cov = as.matrix(data[, -c(1, 2)])
  )

  return(foo)
}

# Load Python functions in a clean environment ---------------------------

python_env <- new.env()
py_require("HidKim_APP @ git+https://github.com/HidKim/APP")
py_require("tensorflow")
py_require("scipy")
py_require("numpy")
py_require("qmcpy")
py_require("matplotlib")
py_require("pandas")
source_python(file = "files_Tables/runapp.py", envir = python_env)


# Function to compute the MIAE with APP ---------------------------------
fmiaeAPP <- function(x,
                     covariates = NULL,
                     section = "41") {
  foo <- lapply(
    x$pp,
    function(i) {
      python_env$runapp(
        data = pptolist(i, listcovar = covariates),
        section = section
      )
    }
  )

  iae <- sapply(foo, FUN = function(i) {
    mean(abs(i - c(x$int$v)))
  })

  return(c(MIAE = mean(iae), sdIAE = sd(iae)))
}
#
# APPmiae41b05 <- unlist(lapply(
#     pp41b05$pp[1:2],
#     function(i) {
#         python_env$runapp(
#             data = pptolist(i, listcovar = covar41),
#             alpha = alpha41b05, beta = 0.5, section = "41"
#         )
#     }
# ))
