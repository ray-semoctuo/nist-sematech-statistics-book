# Declares the R package dependencies for this book so that `renv::snapshot()`
# picks them up and records them in renv.lock, even before every chapter's
# .qmd files reference them directly. Not sourced at render time.

library(tidyverse)
library(broom)
library(here)
library(knitr)
library(rmarkdown)
