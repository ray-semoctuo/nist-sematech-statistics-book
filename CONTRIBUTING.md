# Contributing

Thanks for your interest in this project. There are two different ways people
tend to engage with this repository, and it's worth being clear about which
one you're doing.

## Fixing something in this edition

If you've found an error — a transcription mistake, a broken link, a
numerical discrepancy against the original NIST handbook, a typo — please
open an issue or a pull request against `main`. Corrections that bring this
edition closer to the original NIST content (or that fix our own
reproduction bugs) are exactly what this project wants.

A few things that help:

- Point to the specific page under `handbook/` this traces back to, if you
  know it (e.g. `handbook/prc/section4/prc46.htm`).
- If you're disputing a computed value, show your work (the R code or
  calculation you used to check it).
- Keep PRs scoped to one section/page where possible — it makes review much
  easier.

See `CLAUDE.md` at the repository root for a map of the repo layout and the
conventions used throughout (anchor-ID scheme, table/figure conventions,
citation handling, etc.) if you're touching the Quarto source in `book/`.

## Forking this project to build your own edition

This repository is intentionally built to be forked. If you want to use this
as a starting point for your own course materials, your own re-implementation
in a different language, your own opinionated restructuring, or anything
else — fork it and go. New material in this repository (R code, Quarto
source, diagrams, and original prose — everything outside of `handbook/`) is
released under CC0 1.0 Universal (see `LICENSE`), so there's no attribution
requirement and no need to ask permission.

If you fork this repository, note that:

- Content under `handbook/` originates from NIST and is not itself an
  original contribution of this project — see `book/copyright.qmd` for the
  full fair-use statement.
- This project (`ray-semoctuo/nist-sematech-statistics-book`) intends to stay
  close to the structure and content of the original NIST e-Handbook. If your
  fork diverges substantially (different scope, different language, a
  restructured table of contents), it's probably best thought of as its own
  project rather than something to merge back upstream — and that's fine.
  That's what forking is for.

We'd genuinely like to hear about interesting forks, even if they never come
back as a pull request — feel free to open an issue just to let us know what
you built.
