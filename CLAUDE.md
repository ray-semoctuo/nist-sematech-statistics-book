# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

This repository is a static content mirror of the **NIST/SEMATECH e-Handbook of Statistical
Methods** (https://www.itl.nist.gov/div898/handbook/). It is a legacy 1990s/2000s-era frameset
HTML website, not a software project: there is no build system, package manifest, linter, or test
suite. There is nothing to compile or "run" — changes are made directly to the HTML/text files, and
"testing" a change means opening the affected `.htm` file in a browser and checking rendering and
links.

`handbook.zip` at the repo root is a full zip snapshot of the `handbook/` directory (~170MB); treat
it as a backup/archive, not a source to edit — edit files under `handbook/` directly.

## Structure

- `handbook/index.htm` — frameset entry point: left nav (`navi.htm`) + content pane (`index2.htm`).
- `handbook/dtoc.htm` — detailed table of contents for the whole handbook, linking every subsection.
- `handbook/main.htm`, `homepage.htm`, `glossary.htm`, `datasets.htm`, `changes.htm`, `search.htm`,
  `toolaids.htm` — top-level static pages.
- Each numbered chapter of the handbook lives in its own top-level directory, named by a short code
  rather than a number:
  - `eda/` — Ch. 1, Exploratory Data Analysis
  - `mpc/` — Ch. 2, Measurement Process Characterization
  - `ppc/` — Ch. 3, Production Process Characterization
  - `pmd/` — Ch. 4, Process Modeling
  - `pri/` — Ch. 5, Process Improvement
  - `pmc/` — Ch. 6, Process or Product Monitoring and Control
  - `prc/` — Ch. 7, Product and Process Comparisons
  - `apr/` — Ch. 8, Assessing Product Reliability
- Within each chapter directory: `<code>.htm` is the chapter landing page, `<code>_d.htm` is the
  chapter's detailed TOC, and `sectionN/` subdirectories hold the individual content pages
  (e.g. `eda/section3/eda35.htm`), each named `<code><section><subsection>.htm`. A `dpmacros/`
  subdirectory (where present) holds Dataplot macro files (`.dp`) that back the worked examples in
  that chapter; `gif/`/`gifsav/`/`gif100/` hold the chapter's plot images.
- `Rcode/` — R scripts that reproduce chapter examples (named after the section they support, e.g.
  `eda35c.r`, `mpc231d.r`); `splus/` holds equivalent older S-PLUS scripts.
- `datasets/` — raw data files referenced by examples throughout the handbook.
- `aviles/`, `semstat/` — supplementary/companion material bundles.
- `toolaids/` — large auxiliary tools/aids directory (by far the largest, ~177MB).
- `nist-header-footer/` — shared CSS/JS injected into pages for the current NIST site chrome
  (`nist-combined.css`, `nist-header-footer.js`); most content pages `<link>`/`<script>` these in.
- `gifs/`, `css/`, `js/` at the repo root — shared assets used by the top-level frameset pages.

## Working in this content

- Pages are old-style HTML (frameset-based, uppercase tags, inline styling in many places); match
  the existing markup style of the file being edited rather than modernizing it wholesale.
- Internal links are relative and frequently use `TARGET="_parent"`/`TARGET="_top"` to work
  correctly inside the navigation frameset — preserve these attributes when editing links.
- When adding or renaming a content page, update the corresponding chapter's `<code>_d.htm` detailed
  TOC and, for cross-chapter visibility, `handbook/dtoc.htm` and `handbook/sitemap.xml`.
- `handbook/nist-header-footer/` is permission-restricted in this checkout (not group/world
  readable) — expect `Permission denied` when broadly scanning the tree with tools like `find`/`bfs`.
