# NIST/SEMATECH e-Handbook of Statistical Methods — Tidyverse Edition

[![Book](https://img.shields.io/badge/book-live-brightgreen)](https://ray-semoctuo.github.io/nist-sematech-statistics-book/)
[![Render and Publish Book](https://github.com/ray-semoctuo/nist-sematech-statistics-book/actions/workflows/publish.yml/badge.svg)](https://github.com/ray-semoctuo/nist-sematech-statistics-book/actions/workflows/publish.yml)

A migration of the [NIST/SEMATECH e-Handbook of Statistical
Methods](https://www.itl.nist.gov/div898/handbook/) from its original static
HTML/Dataplot form into a [Quarto](https://quarto.org/) book, with worked
examples re-implemented in R using the [tidyverse](https://www.tidyverse.org/).

## About this project

The e-Handbook's content is excellent and still relevant, but the original
site is a 1990s-era HTML frameset, last substantively updated in 2012, and
periodically unavailable during U.S. government shutdowns. This project
reproduces the full handbook as a modern, searchable Quarto book, with every
worked example re-implemented and numerically verified in R rather than the
original Dataplot/S-PLUS code. See the book's Preface and "Methodology"
appendix for the full story of why and how this edition was produced.

## Forking this book

This repository is meant to be forked. New material here (R code, Quarto
source, diagrams, and original prose) is released under CC0 1.0 Universal —
see `LICENSE` — so you're free to take this as a starting point for your own
course materials, your own re-implementation, or your own restructuring,
with no attribution required and no need to ask. See `CONTRIBUTING.md` for
more on the distinction between contributing a fix back to this edition
versus forking to build your own.

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
output is deployed to GitHub Pages at
<https://ray-semoctuo.github.io/nist-sematech-statistics-book/>.
