# Simulation Study


The scripts in this repository allows to reproduce the figures and table
of the paper REF.

Before running them, you will need the following R packages.

``` r
if (!requireNamespace("pak")) {install.packages("pak")}
if (!requireNamespace("parallel")) {pak::pkg_install("parallel")}
if (!requireNamespace("rgl")) {pak::pkg_install("rgl")}
if (!requireNamespace("spatstat")) {pak::pkg_install("spatstat")}
if (!requireNamespace("tidyverse")) {pak::pkg_install("tidyverse")}
if (!requireNamespace("patchwork")) {pak::pkg_install("patchwork")}
if (!requireNamespace("pracma")) {pak::pkg_install("pracma")}
if (!requireNamespace("spforest")) {pak::pkg_install("biscio/spforest")}
```

To run the script `Table1.R` the R deprecated package `RandomFields` is
necessary. The user may install the last version from CRAN archive
repository:
<https://cran.r-project.org/src/contrib/Archive/RandomFields>.

Finally, utility functions are loaded with the following code line.

``` r
source(file = "00_prelim.R")
```
