#!/usr/bin/env python3
"""Test 2 check: compact gate, symbol page index, then keyword smoke on the PDF.

No page-count, bookmark, or layout expectations. A course page cap, when
set, belongs on scripts/check_compact.py --max-pages. Week 11 compensator
design is not in the keyword list.
"""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
COURSE = REPO / "Advanced Power Electronics"
CHECK = REPO / "scripts" / "check_compact.py"
SYM_PAGES = COURSE / "scripts" / "check_symbol_pages.py"
PDF = COURSE / "main_test2.pdf"

SOURCES = [
    COURSE / "sources" / "00_symbols_test2.typ",
    COURSE / "sources" / "test2_quick_lookup.typ",
    COURSE / "sources" / "05_isolated_dcdc_test2.typ",
    COURSE / "sources" / "07_ac_dc_rectifiers.typ",
    COURSE / "sources" / "08_dc_ac_inverters.typ",
    COURSE / "sources" / "09_modeling_and_small_signal.typ",
    COURSE / "sources" / "appendix_weeks1_4.typ",
]

# Substrings that the Test 2 sheet should contain. Presence only.
KEYWORDS = (
    "Symboloversigt",
    "Indholdsfortegnelse",
    "Sider",
    "Flyback",
    "Forward",
    "PSFB",
    "DAB",
    "THD",
    "PFC",
    "SPWM",
    "RHP",
    "CCM",
    "ZVS",
    "Converter atlas",
    "Buck-boost",
    "Boost PFC",
    "topologi",
)


def run_compact() -> int:
    missing = [p for p in SOURCES if not p.is_file()]
    if missing:
        for path in missing:
            print(f"error: missing source {path}", file=sys.stderr)
        return 2
    if not CHECK.is_file():
        print(f"error: missing {CHECK}", file=sys.stderr)
        return 2
    cmd = [sys.executable, str(CHECK), *[str(p) for p in SOURCES]]
    print("compact:", " ".join(cmd))
    return subprocess.call(cmd)


def keyword_smoke(pdf_path: Path) -> int:
    if not pdf_path.is_file():
        print(f"error: PDF not found: {pdf_path}", file=sys.stderr)
        return 2
    try:
        from pypdf import PdfReader
    except ImportError:
        print("keyword smoke skipped: pypdf is not installed", file=sys.stderr)
        return 0

    reader = PdfReader(str(pdf_path))
    text = "\n".join((page.extract_text() or "") for page in reader.pages)
    print(f"PDF pages: {len(reader.pages)} (informational; no page gate)")
    missing_kw = []
    for kw in KEYWORDS:
        count = text.count(kw)
        if count == 0:
            print(f"  [MISSING] {kw}")
            missing_kw.append(kw)
        else:
            print(f"  [FOUND] {kw}: {count}")
    if missing_kw:
        print(f"keyword smoke failed: {missing_kw}", file=sys.stderr)
        return 1
    print("keyword smoke passed")
    return 0


def run_symbol_pages() -> int:
    if not SYM_PAGES.is_file():
        print(f"error: missing {SYM_PAGES}", file=sys.stderr)
        return 2
    print("symbol pages:", SYM_PAGES)
    return subprocess.call([sys.executable, str(SYM_PAGES)])


def main() -> int:
    pdf_path = PDF if len(sys.argv) < 2 else Path(sys.argv[1])
    compact_code = run_compact()
    if compact_code != 0:
        return compact_code
    sym_code = run_symbol_pages()
    if sym_code != 0:
        return sym_code
    return keyword_smoke(pdf_path)


if __name__ == "__main__":
    raise SystemExit(main())
