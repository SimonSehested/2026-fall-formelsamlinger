#!/usr/bin/env python3
"""Fail if Symboloversigt Sider index is incomplete or has orphan marks.

Uses typst eval query on <sym-decl> / <sym-ref>. Required decls need ≥1 ref.
Optional decls (required: false / id!) may be unmarked. Orphan refs fail.
"""

from __future__ import annotations

import json
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
MAIN = REPO / "Advanced Power Electronics" / "main_test2.typ"


def query_values(label: str) -> list:
    code = f'query({label}).map(it => it.value)'
    cmd = [
        "typst",
        "eval",
        code,
        "--root",
        str(REPO),
        "--in",
        str(MAIN),
    ]
    out = subprocess.check_output(cmd, text=True, encoding="utf-8")
    return json.loads(out)


def main() -> int:
    if not MAIN.is_file():
        print(f"error: missing {MAIN}", file=sys.stderr)
        return 2
    try:
        decls = query_values("<sym-decl>")
        refs = query_values("<sym-ref>")
    except subprocess.CalledProcessError as exc:
        print(f"error: typst eval failed: {exc}", file=sys.stderr)
        return 2

    ref_counts: dict[str, int] = defaultdict(int)
    for r in refs:
        if isinstance(r, dict) and r.get("kind") == "sym-ref":
            ref_counts[str(r["id"])] += 1

    missing: list[str] = []
    declared: set[str] = set()
    for d in decls:
        if not isinstance(d, dict) or d.get("kind") != "sym-decl":
            continue
        sid = str(d["id"])
        declared.add(sid)
        if d.get("required", True) and ref_counts.get(sid, 0) == 0:
            missing.append(sid)

    orphans = sorted(set(ref_counts) - declared)

    print(f"decls={len(declared)} unique_ref_ids={len(ref_counts)} marks={sum(ref_counts.values())}")
    if missing:
        print("MISSING required pages:", ", ".join(missing))
    if orphans:
        print("ORPHAN refs (not in Symboloversigt):", ", ".join(orphans))
    if missing or orphans:
        return 1
    print("symbol page index: ok")
    return 0


if __name__ == "__main__":
    sys.exit(main())
