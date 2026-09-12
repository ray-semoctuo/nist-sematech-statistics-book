# NIST/SEMATECH e-Handbook of Statistical Methods — Tidyverse Edition

A migration of the [NIST/SEMATECH e-Handbook of Statistical
Methods](https://www.itl.nist.gov/div898/handbook/) from its original static
HTML/Dataplot form into a [Quarto](https://quarto.org/) book, with worked
examples re-implemented in R using the [tidyverse](https://www.tidyverse.org/).

## Repository layout

- `handbook/` — the original static HTML handbook content (source material
  for the migration; see `CLAUDE.md` for a full map of this directory).
- `book/` — the Quarto book project.
  - `_quarto.yml` — book configuration (chapters, format, output).
  - `index.qmd` — preface.
  - `chapters/0N-<code>/` — one directory per handbook chapter (e.g.
    `01-eda` = Exploratory Data Analysis), mirroring the original chapter
    codes (`eda`, `mpc`, `ppc`, `pmd`, `pri`, `pmc`, `prc`, `apr`).
  - `R/` — shared helper functions (plotting helpers, etc.) used across
    chapters.
  - `datasets/` — cleaned datasets used by the worked examples, migrated from
    `handbook/datasets/` and per-chapter data files.
  - `data-raw/` — scripts that regenerate `datasets/` from the original
    source files, for reproducibility.
  - `renv.lock` — pinned R package versions (managed via
    [renv](https://rstudio.github.io/renv/)).

## Working on the book

```r
# From the book/ directory:
renv::restore()   # install pinned R package versions
```

```sh
cd book
quarto render      # render the full book to book/_book/
quarto preview      # live-reload local preview
```

## Publishing

The book is rendered by a GitHub Actions workflow
(`.github/workflows/publish.yml`) on every push to `main`, and the rendered
output is deployed to Netlify. See `netlify.toml` for the Netlify publish
directory configuration.
