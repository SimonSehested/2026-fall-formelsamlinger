"""Tests for scripts/check_compact.py — compact gate (forbidden patterns + optional page cap)."""

from __future__ import annotations

import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
CHECK_SCRIPT = REPO_ROOT / "scripts" / "check_compact.py"

FORBIDDEN_SAMPLES = [
    ("derivation", "This derivation shows why SSA works."),
    ("derived as follows", "The result is derived as follows from first principles."),
    ("proof", "A short proof of the theorem."),
    ("theoretical rationale", "Theoretical rationale for the design."),
    ("fourier series expansion", "We use fourier series expansion here."),
    ("worked numerical example", "A worked numerical example with all steps."),
    ("comprehensive overview", "This is a comprehensive overview of the topic."),
    (
        "step-by-step solution procedure",
        "Follow this step-by-step solution procedure.",
    ),
]


def run_check(args: list[str]) -> int:
    """Run check_compact.py with given args; return exit code."""
    cmd = [sys.executable, str(CHECK_SCRIPT), *args]
    result = subprocess.run(cmd, cwd=REPO_ROOT, capture_output=True, text=True)
    return result.returncode


def test_flags_derivation_phrase(tmp_path):
    p = tmp_path / "bad.typ"
    p.write_text("= Title\nThis derivation shows why SSA works.\n", encoding="utf-8")
    assert run_check([str(p)]) != 0


def test_allows_compact_formula_note(tmp_path):
    p = tmp_path / "good.typ"
    p.write_text(
        '= Buck\n$ V_o = D V_"in" $\nCCM volt-second balance.\n',
        encoding="utf-8",
    )
    assert run_check([str(p)]) == 0


def test_each_forbidden_pattern_nonzero(tmp_path):
    for name, line in FORBIDDEN_SAMPLES:
        p = tmp_path / f"bad_{name.replace(' ', '_')}.typ"
        p.write_text(f"= Title\n{line}\n", encoding="utf-8")
        code = run_check([str(p)])
        assert code != 0, f"expected failure for pattern {name!r}"


def test_forbidden_patterns_case_insensitive(tmp_path):
    p = tmp_path / "bad.typ"
    p.write_text("= Title\nThis PROOF is brief.\n", encoding="utf-8")
    assert run_check([str(p)]) != 0


def test_scans_directory_glob(tmp_path):
    bad = tmp_path / "sources"
    bad.mkdir()
    (bad / "01_topic.typ").write_text("= T\nA derivation here.\n", encoding="utf-8")
    good = tmp_path / "02_other.typ"
    good.write_text("= OK\n$ x = 1 $\n", encoding="utf-8")
    assert run_check([str(bad / "*.typ"), str(good)]) != 0


def test_max_pages_fails_when_exceeded(tmp_path, monkeypatch):
    sys.path.insert(0, str(REPO_ROOT / "scripts"))
    try:
        import check_compact  # noqa: WPS433

        pdf = tmp_path / "sheet.pdf"
        pdf.write_bytes(b"%PDF-1.4\n")
        typ = tmp_path / "ok.typ"
        typ.write_text("= Title\n$ a = b $\n", encoding="utf-8")
        monkeypatch.setattr(check_compact, "count_pdf_pages", lambda _: 40)
        assert check_compact.main(
            ["--max-pages", "25", "--pdf", str(pdf), str(typ)]
        ) != 0
    finally:
        sys.path.remove(str(REPO_ROOT / "scripts"))


def test_max_pages_passes_when_within_cap(tmp_path, monkeypatch):
    sys.path.insert(0, str(REPO_ROOT / "scripts"))
    try:
        import check_compact  # noqa: WPS433

        pdf = tmp_path / "sheet.pdf"
        pdf.write_bytes(b"%PDF-1.4\n")
        typ = tmp_path / "ok.typ"
        typ.write_text("= Title\n$ a = b $\n", encoding="utf-8")
        monkeypatch.setattr(check_compact, "count_pdf_pages", lambda _: 10)
        assert check_compact.main(
            ["--max-pages", "25", "--pdf", str(pdf), str(typ)]
        ) == 0
    finally:
        sys.path.remove(str(REPO_ROOT / "scripts"))


def test_max_pages_requires_pdf(tmp_path):
    typ = tmp_path / "ok.typ"
    typ.write_text("= Title\n", encoding="utf-8")
    code = run_check(["--max-pages", "25", str(typ)])
    assert code != 0


def test_reports_offending_line_on_stdout(tmp_path):
    p = tmp_path / "bad.typ"
    p.write_text("= Title\nline one\nproof here\n", encoding="utf-8")
    cmd = [sys.executable, str(CHECK_SCRIPT), str(p)]
    result = subprocess.run(cmd, cwd=REPO_ROOT, capture_output=True, text=True)
    assert result.returncode != 0
    combined = result.stdout + result.stderr
    assert "proof" in combined.lower() or str(p) in combined