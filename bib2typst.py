#!/usr/bin/env python3
"""Convert BibTeX entries to Typst formatted text with keyword filtering.

Used to replace BibLaTeX's \\printbibliography[keyword=...] functionality
when building the CV with Typst instead of LaTeX.
"""

import bibtexparser
import re
import sys
import argparse


def clean_latex(text):
    """Convert LaTeX markup to Typst-compatible text."""
    if not text:
        return ""

    # Handle \textbf{...} -> #strong[...]
    text = re.sub(r"\\textbf\{([^}]*)\}", r"#strong[\1]", text)
    # Handle {\bf ...} {\bf ...} (space-separated groups)
    text = re.sub(r"\{\\bf\s+([^}]*)\}", r"#strong[\1]", text)
    # Handle remaining \bf (rare)
    text = re.sub(r"\\bf\b\s*", "", text)
    # Handle \textit{...} -> #emph[...]
    text = re.sub(r"\\textit\{([^}]*)\}", r"#emph[\1]", text)
    # Handle \emph{...} -> #emph[...]
    text = re.sub(r"\\emph\{([^}]*)\}", r"#emph[\1]", text)
    # Handle \href{url}{text} -> #link("url")[text]
    text = re.sub(r"\\href\{([^}]*)\}\{([^}]*)\}", r'#link("\1")[\2]', text)
    # Handle \url{...} -> #link("...")
    text = re.sub(r"\\url\{([^}]*)\}", r'#link("\1")', text)
    # Handle LaTeX accents
    replacements = {
        "{\\'i}": "í", "{\\'a}": "á", "{\\'e}": "é",
        "{\\'o}": "ó", "{\\'u}": "ú", "{\\~n}": "ñ",
        "\\~n": "ñ", "\\'i": "í", "\\'a": "á",
        "\\'e": "é", "\\'o": "ó", "\\'u": "ú",
        "\\&": "&",
    }
    for old, new in replacements.items():
        text = text.replace(old, new)
    # Handle {{...}} -> ...
    text = re.sub(r"\{\{([^}]*)\}\}", r"\1", text)
    # Handle remaining single braces (remove them)
    text = re.sub(r"\{([^}]*)\}", r"\1", text)
    # Handle LaTeX dashes
    text = text.replace("---", "—")
    text = text.replace("--", "–")

    return text.strip()


MONTH_MAP = {
    "jan": 1, "january": 1, "feb": 2, "february": 2,
    "mar": 3, "march": 3, "apr": 4, "april": 4,
    "may": 5, "jun": 6, "june": 6, "jul": 7, "july": 7,
    "aug": 8, "august": 8, "sep": 9, "september": 9,
    "oct": 10, "october": 10, "nov": 11, "november": 11,
    "dec": 12, "december": 12,
}


def parse_month(m):
    """Parse a month string or number to an integer."""
    if not m:
        return 0
    m = m.strip().lower()
    try:
        return int(m)
    except ValueError:
        return MONTH_MAP.get(m, 0)


def format_entry(entry):
    """Format a single bibliography entry as Typst text."""
    author = clean_latex(entry.get("author", ""))
    title = clean_latex(entry.get("title", ""))
    year = entry.get("year", "")
    journal = clean_latex(entry.get("journal", ""))
    volume = entry.get("volume", "")
    number = entry.get("number", "")
    pages = entry.get("pages", "").replace("--", "–")
    url = entry.get("url", "")
    doi = entry.get("doi", "")
    note = clean_latex(entry.get("note", ""))
    eventtitle = clean_latex(entry.get("eventtitle", ""))
    pubstate = clean_latex(entry.get("pubstate", ""))

    entry_type = entry.get("ENTRYTYPE", "")

    parts = []

    # Authors
    if author:
        parts.append(f"{author}.")

    # Title
    if title:
        parts.append(f'"{title}."')

    # Journal/venue details
    if entry_type == "article":
        if pubstate:
            parts.append(f"({pubstate})")
        if journal:
            j = journal
            if volume:
                j += f" *{volume}*"
                if number:
                    j += f"({number})"
            if pages:
                j += f", pp. {pages}"
            parts.append(j + ".")
        parts.append(f"({year}).")
    elif entry_type == "inproceedings":
        if eventtitle:
            parts.append(f"In: {eventtitle}.")
        parts.append(f"({year}).")
        if note:
            parts.append(note)
    else:
        parts.append(f"({year}).")
        if note:
            parts.append(note)

    # URL (skip if it's a DOI URL since we'll show DOI separately)
    if url and "doi.org" not in url:
        parts.append(f'URL: #link("{url}")')

    # DOI
    if doi:
        doi_url = doi if doi.startswith("http") else f"https://doi.org/{doi}"
        parts.append(f'DOI: #link("{doi_url}")[{doi}]')

    return " ".join(parts)


def main():
    parser = argparse.ArgumentParser(description="Convert BibTeX to Typst")
    parser.add_argument("bibfiles", nargs="+", help="BibTeX files to process")
    parser.add_argument("--keyword", "-k", help="Filter by keyword")
    parser.add_argument("--output", "-o", help="Output file (default: stdout)")
    args = parser.parse_args()

    all_entries = []
    for bibfile in args.bibfiles:
        with open(bibfile) as f:
            bib_parser = bibtexparser.bparser.BibTexParser(common_strings=True)
            db = bibtexparser.load(f, parser=bib_parser)
            all_entries.extend(db.entries)

    # Filter by keyword
    if args.keyword:
        filtered = []
        for entry in all_entries:
            keywords = [k.strip() for k in entry.get("keywords", "").split(",")]
            if args.keyword in keywords:
                filtered.append(entry)
        all_entries = filtered

    # Sort by year descending, then month descending
    def sort_key(e):
        try:
            y = int(e.get("year", "0"))
        except ValueError:
            y = 0
        m = parse_month(e.get("month", ""))
        return (-y, -m)

    all_entries.sort(key=sort_key)

    # Format output as Typst numbered list
    lines = []
    for entry in all_entries:
        formatted = format_entry(entry)
        lines.append(f"+ {formatted}\n")

    result = "\n".join(lines)

    if args.output:
        with open(args.output, "w") as f:
            f.write(result)
    else:
        print(result)


if __name__ == "__main__":
    main()
