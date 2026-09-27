# Migration progress

This tracks, page by page, how much of the NIST/SEMATECH e-Handbook has been ported into this
book. The row-level data lives in `PROGRESS.csv` (one row per page in NIST's own detailed table of
contents, `handbook/dtoc.htm`); this file is just the rolled-up summary.

**Do not re-derive this by guessing or re-running an anchor-ID heuristic on the fly** -- earlier
attempts at that undercounted Chapter 1 by half, because different chapters (and even different
pages within the same chapter) use different anchor-naming conventions. Anchor IDs are not a
reliable signal of what's done; title text is far more reliable, since NIST's title is usually
kept verbatim or lightly reworded. `scripts/build_progress.py` implements that title-matching
approach and regenerates `PROGRESS.csv` from scratch -- but it **overwrites hand corrections**, so
treat `PROGRESS.csv` itself as the durable, edit-by-hand source of truth: only rerun the script for
a chapter that hasn't been hand-corrected yet, and re-apply any known corrections (see the script's
own docstring) after rerunning it for an already-corrected chapter.

## Column meanings (PROGRESS.csv)

- `status`: `done`, `not_started`, or `skipped` (intentionally never ported -- a Dataplot-macro-only
  page, or a standalone References page since citations go straight into `references.bib`).
- `verified`: `yes` means a human (or an agent working directly on that chapter) confirmed the
  status by actually reading the file, not just automated title-matching. `no` means the row is
  only as good as the title-matching heuristic -- usually right, but can have false negatives when
  NIST's title was reworded beyond what substring matching catches (e.g. word order changes), or
  false positives if two unrelated pages happen to share generic wording.
- `book_file` / `notes`: filled in opportunistically during verification, not exhaustively.

## Summary (as of 2026-09-27)

| Chapter | Done | Skipped | Not started | Total | % done |
|---|---:|---:|---:|---:|---:|
| 1. Exploratory Data Analysis | 211 (185 verified) | 1 | 0 | 212 | 100% |
| 2. Measurement Process Characterization | 183 | 4 | 7 | 194 | 94%* |
| 3. Production Process Characterization | 59 | 1 | 1 | 61 | 97%* |
| 4. Process Modeling | 108 (108 verified) | 0 | 0 | 108 | 100% |
| 5. Process Improvement | 36 (36 verified) | 1 | 104 | 141 | 26% |
| 6. Process or Product Monitoring and Control | 0 | 1 | 93 | 94 | 0% |
| 7. Product and Process Comparisons | 0 | 1 | 57 | 58 | 0% |
| 8. Assessing Product Reliability | 0 | 1 | 84 | 85 | 0% |
| **Total** | **597** | **10** | **346** | **953** | **63%** |

Chapter 5's total grew from 139 to 141 pages: two pages (5.3.3.4.1 and 5.3.3.4.2) were missing
from the original auto-generated `PROGRESS.csv` -- `build_progress.py`'s dtoc.htm regex silently
skipped them for reasons not yet root-caused -- and were added by hand during manual verification.

\* Chapters 2 and 3 are auto-detected only (`verified: no` on every row) -- not yet hand-checked
against the actual files the way Chapters 1 and 4 have been. Treat these two percentages as
approximate until someone verifies them directly.

## Known remaining gaps

- **Chapter 1**: only the standalone References page is unported (intentionally, folded into
  `references.bib`).
- **Chapter 2**: 7 pages genuinely not started, concentrated in Section 2.4 (Gauge R&R studies) --
  worth checking with `grep not_started PROGRESS.csv` before assuming this is exhaustive, since the
  chapter hasn't been hand-verified.
- **Chapter 3**: 1 page (`3.4.1. First Steps`) shows as not started, but this is unverified and may
  be a title-wording false negative -- check before acting on it.
- **Chapter 5**: in progress. Section 5.1 (Introduction), 5.2 (Assumptions), and the first six of
  Section 5.3.3's ten design-type subsections (5.3.3.1 Completely randomized, 5.3.3.2 Randomized
  block plus Latin/Graeco-Latin/Hyper-Graeco-Latin square subpages, 5.3.3.3 Full factorial plus
  subpages, 5.3.3.4 Fractional factorial plus its 7 subpages, 5.3.3.5 Plackett-Burman, 5.3.3.6
  Response surface designs plus its 4 subpages) are done and verified. Remaining: 5.3.3.7 through
  5.3.3.10, then Sections 5.4-5.7.
- **Chapters 6-8**: entirely unstarted.

To regenerate the automated pass (loses any un-preserved hand corrections for chapters you rerun):

```
python3 book/scripts/build_progress.py
```
