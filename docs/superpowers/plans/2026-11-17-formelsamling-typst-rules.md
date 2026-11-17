# Global Typst Formula-Sheet Rules + APE Test 2 Rewrite Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Install root Typst formula-sheet rules and template, rewrite APE Test 2 as a compact Typst PDF (no derivations), verify with compact/prose/coverage gates, then delete APE LaTeX leftovers so the repo only shows the current workflow.

**Architecture:** Root `AGENTS.md` + `prompts/*` define hard rules for every course. A shared Typst template under `templates/formula-sheet/` styles print PDFs. APE keeps a thin override `AGENTS.md` and modular `sources/*.typ` compiled by `main_test2.typ`. Python checks enforce compact patterns and optional page caps; agents apply `avoid-ai-writing` to sheet prose. Electrical Machines stays LaTeX this delivery.

**Tech Stack:** Typst, PowerShell, Python 3 + `pypdf`, Markdown agent docs, `avoid-ai-writing` skill (technical/docs register).

**Spec:** [docs/superpowers/specs/2026-11-17-formelsamling-typst-rules-design.md](../specs/2026-11-17-formelsamling-typst-rules-design.md)

## Global Constraints

- Typesetting for new/rewritten sheets: Typst → PDF only (no new APE LaTeX).
- No derivations, proofs, worked numerical examples, or lecture-note essays in sheet sources.
- No global hard page cap; APE may set `max_pages` in course `AGENTS.md` after the first compact draft if needed.
- Course `AGENTS.md` may only tighten/specialize root rules, never weaken compact/prose gates.
- Sheet prose must pass `avoid-ai-writing` (technical/docs); do not alter math meaning.
- EM directory: do not migrate or delete its LaTeX this delivery.
- Prefer delete over archive for superseded APE LaTeX docs/specs/plans.
- Do not commit unless the user asks (plan steps may stage files; commit only on request).

## Review Focus

1. **Derivation leak:** long “Step 1… Step 6 SSA derivation” prose returns → compact gate + human skim of modeling chapter must fail/reject it.
2. **Crammed tables:** negative spacing / unreadably dense lookup cells → print sanity requires positive gutters and readable row height.
3. **Keyword-only audit:** “all keywords found” on a bloated PDF → verification must not treat keyword presence as success without compact/page checks.
4. **Wrong scope:** Week 11 control/compensation content appears in Test 2 → coverage/taxonomy and APE overrides must exclude it.
5. **Dual stack:** `.tex` sheet sources left beside `.typ` → cleanup task must leave zero APE formula-sheet `.tex` files.

---

### Task 1: Root Rules, Prompts, README, `.gitignore`

**Files:**
- Create: `AGENTS.md`
- Create: `prompts/style_guide.md`
- Create: `prompts/verification_guide.md`
- Modify: `README.md`
- Modify: `.gitignore`
- Do not create: root `STARTPROMPT.md` (YAGNI)

**Interfaces:**
- Consumes: Approved spec §§1–5; existing APE/EM `AGENTS.md` / `prompts/*` as content to lift and Typst-adapt (not copy LaTeX-only wording verbatim).
- Produces: Root hard rules that every later task’s agents must follow; verification guide naming the five gates (compile, compact, prose/`avoid-ai-writing`, coverage, print sanity).

- [ ] **Step 1: Write root `AGENTS.md`**

Port the exam-reference goal and Symboloversigt-first structure from course AGENTS, but require Typst (`main.typ` / `sources/*.typ`), forbid derivations explicitly, state rule precedence (root > course tighten-only), and require `avoid-ai-writing` on sheet prose before finish.

- [ ] **Step 2: Write `prompts/style_guide.md` and `prompts/verification_guide.md`**

Style guide: unit shape from spec §2; Typst heading/formula/table habits; table spacing must stay positive; point to `avoid-ai-writing` technical/docs.  
Verification guide: ordered gates from spec §4; compact pattern examples (derive, Fourier series expansion, “theoretical rationale”, multi-page worked example); when to run `avoid-ai-writing` detect/edit; how to record coverage in `reports/`.

- [ ] **Step 3: Update `README.md` and `.gitignore`**

README: multi-course Typst workflow; EM noted as legacy LaTeX until migrated; link root `AGENTS.md`.  
`.gitignore`: keep LaTeX aux (EM); add `.cursor/`, `.antigravity/`, Typst cache patterns (e.g. `.typstcache/` if used).

- [ ] **Step 4: Sanity-check docs exist**

Run: `Test-Path AGENTS.md, prompts/style_guide.md, prompts/verification_guide.md, README.md, .gitignore`  
Expected: all `$true`

---

### Task 2: Shared Typst Template + Smoke Compile

**Files:**
- Create: `templates/formula-sheet/lib.typ` (theme + helpers: margins, fonts, `symbol-table`, `recipe`, `traps`)
- Create: `templates/formula-sheet/smoke.typ` (tiny sample using helpers)
- Create: `templates/formula-sheet/README.md` (how courses import the lib)

**Interfaces:**
- Consumes: Spec §3 layout values (A4, ~1.2–1.5 cm margins, ~9–10 pt, positive table gutters).
- Produces: Importable helpers later APE `main_test2.typ` uses via relative path into `templates/formula-sheet/lib.typ`.

- [ ] **Step 1: Confirm Typst CLI available**

Run: `typst --version`  
Expected: version prints; if missing, install Typst before continuing.

- [ ] **Step 2: Implement `lib.typ` + `smoke.typ`**

`lib.typ` sets page/text defaults and exports helpers. `smoke.typ` imports lib, shows one symbol table row, one formula, one recipe box.

- [ ] **Step 3: Compile smoke PDF**

Run: `typst compile templates/formula-sheet/smoke.typ templates/formula-sheet/smoke.pdf`  
Expected: exit 0; PDF created.

- [ ] **Step 4: Visual spot-check**

Open `smoke.pdf`: margins ok; table not cramped; text readable when printed.

---

### Task 3: Compact Gate Script (TDD)

**Files:**
- Create: `scripts/check_compact.py` (repo-root shared checker)
- Create: `scripts/tests/test_check_compact.py`
- Later used by: APE `scripts/` wrapper or direct invocation

**Interfaces:**
- Consumes: Paths to `.typ` sources; optional `--max-pages N` + PDF path.
- Produces: CLI exit `0` if clean, nonzero if derivation/lecture-note patterns found or page cap exceeded; stdout lists offending files/lines.

```text
check_compact.py [--max-pages N] [--pdf path.pdf] path/to/sources/*.typ
```

Forbidden substring patterns (case-insensitive), minimum set:

- `derivation`, `derived as follows`, `proof`, `theoretical rationale`
- `fourier series expansion`, `worked numerical example`
- `comprehensive overview`, `step-by-step solution procedure` (lecture-essay recipes longer than compact recipes still allowed only as short `recipe` helper content — flag phrases that signal textbook essays)

- [ ] **Step 1: Write failing tests in `scripts/tests/test_check_compact.py`**

```python
def test_flags_derivation_phrase(tmp_path):
    p = tmp_path / "bad.typ"
    p.write_text("= Title\nThis derivation shows why SSA works.\n", encoding="utf-8")
    assert run_check([str(p)]) != 0

def test_allows_compact_formula_note(tmp_path):
    p = tmp_path / "good.typ"
    p.write_text("= Buck\n$ V_o = D V_\"in\" $\nCCM volt-second balance.\n", encoding="utf-8")
    assert run_check([str(p)]) == 0

def test_max_pages_fails_when_exceeded(tmp_path, monkeypatch):
    # stub page count = 40, --max-pages 25 → nonzero
    ...
```

- [ ] **Step 2: Run tests — expect FAIL (module missing)**

Run: `python -m pytest scripts/tests/test_check_compact.py -v`  
Expected: FAIL (import/collection error or failing asserts).

- [ ] **Step 3: Implement `scripts/check_compact.py`**

Minimal scanner + optional `pypdf` page count when `--max-pages` and `--pdf` given.

- [ ] **Step 4: Run tests — expect PASS**

Run: `python -m pytest scripts/tests/test_check_compact.py -v`  
Expected: PASS

---

### Task 4: APE Overrides + Typst Skeleton

**Files:**
- Replace: `Advanced Power Electronics/AGENTS.md` (overrides only: Test 2 scope Weeks 5,7,8,9,10; exclude Week 11; paper-only; appendix 1–4 tables; optional `max_pages:` TBD until after first compact PDF)
- Create: `Advanced Power Electronics/main_test2.typ`
- Create empty/stub:  
  `sources/00_symbols_test2.typ`  
  `sources/test2_quick_lookup.typ`  
  `sources/05_isolated_dcdc_test2.typ`  
  `sources/07_ac_dc_rectifiers.typ`  
  `sources/08_dc_ac_inverters.typ`  
  `sources/09_modeling_and_small_signal.typ`  
  `sources/appendix_weeks1_4.typ`
- Create: `Advanced Power Electronics/scripts/build_test2.ps1`
- Modify: `Advanced Power Electronics/README.md` (Typst build instructions)

**Interfaces:**
- Consumes: `templates/formula-sheet/lib.typ`; root AGENTS.
- Produces: Compilable empty skeleton PDF with section titles only.

- [ ] **Step 1: Write thin course `AGENTS.md`**

Must state: follow root AGENTS; Test 2 scope; Week 11 out; no dual LaTeX; prose via `avoid-ai-writing`.

- [ ] **Step 2: Wire `main_test2.typ` + stubs + build script**

Import lib; `#include` stubs in spec order; title page for EE4007 Test 2.

- [ ] **Step 3: Compile skeleton**

Run: `typst compile "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"`  
Expected: exit 0.

---

### Task 5: Rewrite APE Test 2 Content (Compact Typst)

**Files:**
- Fill all stub `Advanced Power Electronics/sources/*.typ` from Task 4
- Formula sources of truth while rewriting: existing bloated `.tex` + `input/*Week*` slides — **keep formulas, drop essays**
- Density reference: old good style in `Electrical Machines` / early APE CCM notes (handbook density), not the 67-page Test 2 chapters

**Interfaces:**
- Consumes: Content contract §2; APE overrides; template helpers.
- Produces: Full Test 2 sheet PDF substantially shorter than 67 pages, with readable lookup tables.

Required topic coverage (formulas + short notes only):

| File | Must include |
|---|---|
| `00_symbols_test2.typ` | Symboloversigt for used symbols |
| `test2_quick_lookup.typ` | Isolated / rectifier / inverter / SSA lookup tables with readable spacing |
| `05_isolated_dcdc_test2.typ` | Flyback, Forward (+ tertiary, two-transistor), overlap $t_{ov}$, PSFB, DAB |
| `07_ac_dc_rectifiers.typ` | PF/DPF/DF/THD, uncontrolled/controlled rectifiers, Boost PFC sizing |
| `08_dc_ac_inverters.typ` | 1φ/3φ VSI, SPWM $m_a,m_f$, harmonics/CM notes, LC filter rule, AC-AC RMS |
| `09_modeling_and_small_signal.typ` | SSA matrix definitions, Buck/Boost $G_{vd}$, RHP zero — **results only, no derivation essay** |
| `appendix_weeks1_4.typ` | Compact CCM/DCM/QRC tables only |

- [ ] **Step 1: Rewrite symbols + quick lookup + compile**

Run compact check on those files; compile `main_test2.typ`.

- [ ] **Step 2: Rewrite weeks 5/7 + 8; compile; compact check**

- [ ] **Step 3: Rewrite weeks 9 + 10 + appendix; compile; compact check**

- [ ] **Step 4: `avoid-ai-writing` pass on all sheet prose**

Mode: edit/detect technical-docs on explanatory sentences, recipes, traps, table notes. Fix P0/P1. Do not change equations.

- [ ] **Step 5: Record page count; optionally set `max_pages` in APE `AGENTS.md`**

If PDF still ≫ readable midterm size (guideline: investigate if **> 30** pages), cut again before setting a hard `max_pages`. If already compact, leave `max_pages` unset.

Run: `python scripts/check_compact.py [--max-pages N --pdf "Advanced Power Electronics/main_test2.pdf"] "Advanced Power Electronics/sources"/*.typ`  
Expected: exit 0.

---

### Task 6: Coverage Reports + Verification Refresh

**Files:**
- Modify: `Advanced Power Electronics/reports/coverage_report.md`
- Modify: `Advanced Power Electronics/reports/exam_task_taxonomy.md`
- Modify: `Advanced Power Electronics/reports/exam_verification_report.md`
- Delete or replace: `Advanced Power Electronics/scripts/audit_test2_pdf.py` (must not encode 67-page expectations)

**Interfaces:**
- Consumes: Compact Typst PDF + `input/` slides; verification_guide gates.
- Produces: Reports that map Test 2 task types → sections; list gaps honestly; document page count.

- [ ] **Step 1: Refresh taxonomy/coverage/verification reports for Typst sheet**

Exclude Week 11. Note appendix is cheat-sheet only.

- [ ] **Step 2: Replace legacy audit script**

Either delete `audit_test2_pdf.py` or rewrite it to call `check_compact.py` + keyword smoke list **without** hardcoding 67-page layout.

- [ ] **Step 3: Run full verification sequence**

1. `typst compile ... main_test2.pdf`  
2. `python scripts/check_compact.py ...`  
3. Confirm reports updated  
4. Manual print sanity on lookup tables  

Expected: all gates pass per spec §4.

---

### Task 7: Cleanup — Remove APE LaTeX and Superseded Docs

**Files:**
- Delete APE: `main.tex`, `main_test2.tex`, all `sources/*.tex`, `main*.aux/toc/out/log`, old LaTeX `main*.pdf` if distinct junk, `PLAN.md`, `STARTPROMPT.md`, course-local `prompts/`, obsolete audit if still LaTeX-era
- Delete: `docs/superpowers/specs/2026-11-16-ape-test2-formelsamling-design.md`
- Delete: `docs/superpowers/plans/2026-11-16-ape-test2-formelsamling.md`
- Delete if present: `.cursor/`, `.antigravity/`, root `texput.log`
- Keep: `input/`, Typst sources, `main_test2.typ`, reports, root rules/template
- Do not touch: `Electrical Machines/**` formula sources

**Interfaces:**
- Consumes: Tasks 1–6 complete (Typst sheet verified).
- Produces: APE directory with zero formula-sheet `.tex` files; repo hygiene matching README.

- [ ] **Step 1: Assert Typst PDF exists and gates passed before deleting LaTeX sources**

- [ ] **Step 2: Delete listed APE LaTeX/legacy files and superseded docs**

- [ ] **Step 3: Verify cleanup**

Run:

```powershell
@(Get-ChildItem "Advanced Power Electronics" -Recurse -Filter *.tex -File).Count
Test-Path "Electrical Machines/main.tex"
Test-Path "docs/superpowers/specs/2026-11-17-formelsamling-typst-rules-design.md"
```

Expected: APE `.tex` count `0`; EM `main.tex` still `$true`; new spec still `$true`.

- [ ] **Step 4: Final compile after cleanup**

Run: `typst compile "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"`  
Expected: exit 0 (no dependency on deleted `.tex`).

---

## Self-Review Notes (plan author)

- Spec §§1–5 and success criteria map to Tasks 1–7.
- Open points resolved: no root `STARTPROMPT.md`; `max_pages` only after Task 5 if still bloated (>30 pages investigate).
- Commits deferred to user request per global constraints.
