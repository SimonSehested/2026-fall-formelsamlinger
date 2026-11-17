#!/usr/bin/env python3
"""Compact gate: forbid lecture-note phrases in Typst sources; optional PDF page cap."""

from __future__ import annotations

import argparse
import glob
import sys
from pathlib import Path

FORBIDDEN_PATTERNS: tuple[str, ...] = (
    "derivation",
    "derived as follows",
    "proof",
    "theoretical rationale",
    "fourier series expansion",
    "worked numerical example",
    "comprehensive overview",
    "step-by-step solution procedure",
)


def count_pdf_pages(pdf_path: Path) -> int:
    from pypdf import PdfReader

    reader = PdfReader(str(pdf_path))
    return len(reader.pages)


def expand_typ_paths(patterns: list[str]) -> list[Path]:
    paths: list[Path] = []
    seen: set[Path] = set()
    for pattern in patterns:
        matches = glob.glob(pattern, recursive=True)
        if not matches:
            candidate = Path(pattern)
            if candidate.suffix == ".typ" and candidate.is_file():
                matches = [str(candidate)]
        for match in sorted(matches):
            p = Path(match).resolve()
            if p.suffix.lower() != ".typ" or not p.is_file():
                continue
            if p not in seen:
                seen.add(p)
                paths.append(p)
    return paths


def scan_file(path: Path) -> list[tuple[int, str, str]]:
    """Return (line_no, pattern, line_text) for each hit."""
    hits: list[tuple[int, str, str]] = []
    text = path.read_text(encoding="utf-8")
    for line_no, line in enumerate(text.splitlines(), start=1):
        lower = line.lower()
        for pattern in FORBIDDEN_PATTERNS:
            if pattern in lower:
                hits.append((line_no, pattern, line.rstrip()))
    return hits


def scan_sources(paths: list[Path]) -> list[tuple[Path, int, str, str]]:
    all_hits: list[tuple[Path, int, str, str]] = []
    for path in paths:
        for line_no, pattern, line in scan_file(path):
            all_hits.append((path, line_no, pattern, line))
    return all_hits


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Compact gate for formula-sheet Typst sources.",
    )
    parser.add_argument(
        "sources",
        nargs="+",
        help="Paths or globs to .typ files (e.g. course/sources/*.typ)",
    )
    parser.add_argument(
        "--max-pages",
        type=int,
        default=None,
        metavar="N",
        help="Fail if PDF has more than N pages (requires --pdf).",
    )
    parser.add_argument(
        "--pdf",
        type=Path,
        default=None,
        help="Compiled PDF for page-count check.",
    )
    args = parser.parse_args(argv)

    if args.max_pages is not None and args.pdf is None:
        print("error: --max-pages requires --pdf", file=sys.stderr)
        return 2

    typ_paths = expand_typ_paths(args.sources)
    if not typ_paths:
        print("error: no .typ files matched", file=sys.stderr)
        return 2

    failed = False

    hits = scan_sources(typ_paths)
    for path, line_no, pattern, line in hits:
        failed = True
        print(f"{path}:{line_no}: forbidden {pattern!r}: {line}")

    if args.max_pages is not None and args.pdf is not None:
        pdf_path = args.pdf
        if not pdf_path.is_file():
            print(f"error: PDF not found: {pdf_path}", file=sys.stderr)
            return 2
        pages = count_pdf_pages(pdf_path)
        if pages > args.max_pages:
            failed = True
            print(
                f"{pdf_path}: page count {pages} exceeds --max-pages {args.max_pages}",
            )

    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())