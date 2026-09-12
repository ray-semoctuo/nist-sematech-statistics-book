# data-raw/

Scripts that regenerate the cleaned files in `datasets/` from the original
source files under `handbook/` (e.g. reading fixed-width `.DAT` files and
writing tidy `.csv`/`.rds` output). Keeping these scripts alongside the
cleaned data makes the migration from the original handbook data
reproducible and auditable.
