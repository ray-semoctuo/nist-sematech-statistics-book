#!/usr/bin/env python3
"""
Builds book/PROGRESS.csv: one row per NIST e-Handbook content page (from
handbook/dtoc.htm), matched against this book's actual .qmd files by
heading/label title text (not by anchor ID -- different chapters and even
different pages within the same chapter use different anchor-naming
conventions, so anchor-based matching is unreliable).

A page counts as "done" if a normalized version of its NIST title appears
as a heading (##-######{#anchor}), a bold inline label ([**Title**]{#anchor}),
or an italic numbered sub-label (*N. Title*) anywhere in that chapter's .qmd
files. This catches pages that were intentionally merged into a parent file
as a labeled subsection rather than split into their own file.

This is a heuristic, not a certainty -- titles can be reworded (e.g. NIST's
"Alaska Pipeline" vs. this book's "Alaska Pipeline Ultrasonic Calibration"),
which shows up as a false "not_started". Rows where the title contains
"Dataplot" or is exactly "References" are marked "skipped" instead of
"not_started", since this book intentionally never ports Dataplot-macro
pages or writes a standalone References page (citations go straight into
references.bib).

Usage:
    python3 book/scripts/build_progress.py

Regenerates book/PROGRESS.csv from scratch every time. Hand corrections
belong in the `verified` and `notes` columns of PROGRESS.csv itself and
will be LOST on regeneration unless you preserve them first (the script
does not currently merge with a prior run) -- treat PROGRESS.csv as the
durable, edit-by-hand source of truth, and only re-run this script for a
chapter you haven't hand-corrected yet, or to add newly migrated pages
picked up automatically.
"""
import csv
import glob
import os
import re

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
DTOC = os.path.join(REPO_ROOT, "handbook", "dtoc.htm")
BOOK_DIR = os.path.join(REPO_ROOT, "book")
OUT = os.path.join(BOOK_DIR, "PROGRESS.csv")

CHAPTER_DIRS = {
    "eda": "01-eda",
    "mpc": "02-mpc",
    "ppc": "03-ppc",
    "pmd": "04-pmd",
    "pri": "05-pri",
    "pmc": "06-pmc",
    "prc": "07-prc",
    "apr": "08-apr",
}

CHAPTER_NAMES = {
    "eda": "1. Exploratory Data Analysis",
    "mpc": "2. Measurement Process Characterization",
    "ppc": "3. Production Process Characterization",
    "pmd": "4. Process Modeling",
    "pri": "5. Process Improvement",
    "pmc": "6. Process or Product Monitoring and Control",
    "prc": "7. Product and Process Comparisons",
    "apr": "8. Assessing Product Reliability",
}

HEADING_PAT = re.compile(r"^#{2,6}\s+(.*?)\s*\{#[\w-]+\}\s*$", re.MULTILINE)
LABEL_PAT = re.compile(r"^\[\*\*(.*?)\*\*\]\{#[\w-]+\}\s*$", re.MULTILINE)
ITALIC_PAT = re.compile(r"^\*\d+\.\s+(.*?)\*\s*$", re.MULTILINE)


def norm(title):
    title = title.lower()
    title = re.sub(r"[^a-z0-9]+", " ", title)
    return title.strip()


def parse_dtoc():
    content = open(DTOC, encoding="latin-1").read()
    pat = re.compile(
        r'HREF\s*=\s*"([a-z0-9]+)/([^"]*\.htm)"\s+TARGET="_parent">([^<]*)</a>&nbsp;&nbsp;\[([0-9.]+)\]',
        re.IGNORECASE,
    )
    entries = []
    for chapter, htmfile, title, label in pat.findall(content):
        entries.append(
            {
                "chapter": chapter,
                "number": label.rstrip("."),
                "title": re.sub(r"\s+", " ", title).strip(),
                "nist_file": f"{chapter}/{htmfile}",
            }
        )
    return entries


def collect_book_titles(dirname):
    titles = set()
    for f in glob.glob(os.path.join(BOOK_DIR, "chapters", dirname, "**", "*.qmd"), recursive=True):
        text = open(f, encoding="utf-8").read()
        for pat in (HEADING_PAT, LABEL_PAT, ITALIC_PAT):
            for m in pat.finditer(text):
                titles.add(norm(m.group(1)))
    return titles


def title_matches(nist_title_norm, book_titles):
    if nist_title_norm in book_titles:
        return True
    # substring match either direction, guarding against very short titles
    # matching too loosely (e.g. a single common word)
    if len(nist_title_norm) < 8:
        return False
    for bt in book_titles:
        if len(bt) < 8:
            continue
        if nist_title_norm in bt or bt in nist_title_norm:
            return True
    return False


def classify(title, matched):
    if matched:
        return "done"
    t = title.lower()
    if "dataplot" in t or t.strip() == "references" or t.strip().startswith("references for chapter"):
        return "skipped"
    return "not_started"


def main():
    entries = parse_dtoc()
    book_titles = {prefix: collect_book_titles(dirname) for prefix, dirname in CHAPTER_DIRS.items()}

    rows = []
    for e in entries:
        matched = title_matches(norm(e["title"]), book_titles.get(e["chapter"], set()))
        status = classify(e["title"], matched)
        rows.append(
            {
                "chapter": CHAPTER_NAMES.get(e["chapter"], e["chapter"]),
                "number": e["number"],
                "title": e["title"],
                "nist_file": e["nist_file"],
                "status": status,
                "verified": "no",
                "book_file": "",
                "notes": "",
            }
        )

    with open(OUT, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["chapter", "number", "title", "nist_file", "status", "verified", "book_file", "notes"])
        writer.writeheader()
        writer.writerows(rows)

    print(f"Wrote {len(rows)} rows to {OUT}")
    from collections import Counter
    by_chapter_status = Counter((r["chapter"], r["status"]) for r in rows)
    for chapter in CHAPTER_NAMES.values():
        done = by_chapter_status.get((chapter, "done"), 0)
        skipped = by_chapter_status.get((chapter, "skipped"), 0)
        not_started = by_chapter_status.get((chapter, "not_started"), 0)
        total = done + skipped + not_started
        print(f"  {chapter}: {done} done, {skipped} skipped, {not_started} not started (of {total})")


if __name__ == "__main__":
    main()
