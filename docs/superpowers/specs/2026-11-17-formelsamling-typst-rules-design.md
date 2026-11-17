# Design: Global Formula-Sheet Rules + Typst Pipeline (APE Test 2 First)

**Date:** 2026-11-17  
**Repo:** `2026-fall-formelsamlinger`  
**Status:** Approved  
**Supersedes for APE Test 2 tooling:** `docs/superpowers/specs/2026-11-16-ape-test2-formelsamling-design.md` and `docs/superpowers/plans/2026-11-16-ape-test2-formelsamling.md` (LaTeX-era; remove after this design ships)

---

## Intent

Build a **reproducible** pipeline for exam formula sheets across any course:

- Global hard rules every agent must follow
- Thin per-course overrides (scope, exam format, optional hard page cap)
- **Typst → PDF** as the only print path for new/rewritten sheets
- Content = formulas + short theory pointers — **no derivations**
- Clean repo: APE has no LaTeX leftovers; no editor/agent junk; docs match current practice

**In scope:** root rules + Typst template + APE Test 2 rewrite + APE cleanup.  
**Out of scope this delivery:** migrating Electrical Machines off LaTeX (leave as-is).

### Goals

1. Any new course folder can be filled by following root `AGENTS.md` + a short course `AGENTS.md` and produce a usable print PDF.
2. APE Test 2 sheet is compact, searchable, printable, and usable in a 60-minute paper-only open-book test (Weeks 5, 7, 8, 9, 10 + short Weeks 1–4 appendix).
3. Layout stays readable (especially tables): no crammed negative spacing.
4. Repo looks intentional: one current way of working, no parallel obsolete stacks in APE.

### Non-Goals

- HTML-first authoring (PDF quality/ease is the requirement; Typst chosen).
- Global hard page cap (syllabi differ; caps only in course overrides).
- Rewriting Electrical Machines in this delivery.
- Textbook completeness or “100% slide paraphrase.”

### Anti-Goals

- Lecture-note / derivation style that produced the 67-page APE Test 2 PDF.
- Audits that rubber-stamp bloated page counts.
- Duplicate rule files that drift out of sync per course.

### Decisions Locked

| Decision | Choice |
|---|---|
| Rule layout | Root `AGENTS.md` + root `prompts/*`; course `AGENTS.md` = overrides only |
| Page budget | No global hard cap; “as short as readable”; hard caps only in course overrides |
| Typesetting | Typst → PDF |
| First delivery | Rules + template + APE Test 2 rewrite; EM later |
| Architecture style | Shared Typst template + strict agent contract + verification gates |
| Prose quality | Formula-sheet explanatory text must pass `avoid-ai-writing` (technical/docs register) |
| APE LaTeX | Delete; do not keep dual stack |
| Editor leftovers | Remove `.cursor/`, `.antigravity/`, and similar; ignore in `.gitignore` |

---

## 1. Architecture / Folder Layout

```
/
  AGENTS.md
  prompts/
    style_guide.md
    verification_guide.md
  templates/
    formula-sheet/          # shared Typst theme + helpers
  README.md                 # current Typst workflow only
  Advanced Power Electronics/
    AGENTS.md               # overrides only
    main_test2.typ
    sources/*.typ
    input/                  # lecture/exam PDFs (keep)
    reports/                # coverage + verification
    scripts/                # build + compact/coverage checks
  Electrical Machines/      # unchanged this delivery (still LaTeX)
  docs/superpowers/
    specs/                  # this design; archive/remove old APE LaTeX spec
    plans/                  # implementation plan for this design
```

### Rule precedence

1. Root `AGENTS.md` and root `prompts/*` always apply.
2. Course `AGENTS.md` may **tighten or specialize** (exam scope, languages, hard page cap, allowed exceptions).
3. Course files must **not** weaken: no derivations, compact reference style, Symboloversigt-first, exam usability.

---

## 2. Content Contract

### Unit shape

Each concept is normally:

1. Searchable heading (course keywords / exam wording)
2. One or two display formulas
3. One to three short sentences (meaning, assumptions, when to use)
4. Optional: short exam recipe (3–7 steps), traps, one-line checks

### Required

- Symboloversigt first (symbol, meaning, unit)
- Formulas needed for recurring exam/exercise tasks
- Validity conditions and common traps when they prevent wrong use
- Organization by problem type when that is faster than lecture order

### Forbidden

- Derivations, proofs, multi-step “theory essays”
- Long prose overviews and slide paraphrases
- Worked numerical examples unless a course override explicitly allows one mini example
- Padding for completeness; unnecessary duplication
- Images unless the course override requires them

### Prose: `avoid-ai-writing` (mandatory)

Explanatory sentences, recipe steps, traps, and table notes in the formula sheet must be written (and revised) with the `avoid-ai-writing` skill.

- **Register:** technical / docs — short engineering handbook voice, not marketing or chat
- **Apply to:** human-readable prose around formulas (not math tokens, symbol names, or path/identifiers)
- **Required habits:** direct claims; concrete conditions; no hollow intensifiers; no template openers; no synonym cycling; no bold spam; no “it’s not X, it’s Y” frames; no filler transitions
- **Root docs:** `AGENTS.md` and `prompts/style_guide.md` must point agents at this skill before finishing sheet prose
- **Formulas stay formulas:** do not “humanize” notation or invent softer wording that changes technical meaning

### Length policy

- Global: minimize pages while remaining readable under exam stress.
- If a section reads like a textbook chapter, cut it.
- Course override may set a hard page maximum; verification must fail if exceeded.

### APE Test 2 overrides (course `AGENTS.md`)

- Scope: Weeks 5, 7, 8, 9, 10
- Appendix: ultra-short Weeks 1–4 cheat sheet (tables, not chapters)
- Exclude Week 11
- Exam: paper-only open book; optimize for physical flip / scan, not Ctrl+F alone
- Optional hard page cap: set during implementation if useful after first compact draft (not required by global rules)

---

## 3. Typst Template, Build, and Print Layout

### Template (`templates/formula-sheet/`)

- A4, margins ~1.2–1.5 cm
- Body ~9–10 pt; clear heading hierarchy
- Formula blocks and compact tables with **positive** row/paragraph spacing (readable; no negative cram)
- Helpers: symbol table, boxed recipe, trap block
- Print-friendly: high contrast, minimal decorative ink

### APE entrypoints

- `main_test2.typ` inputs modular `sources/*.typ`:
  - symbols
  - quick lookup tables
  - isolated DC/DC (weeks 5 & 7)
  - rectifiers / PFC (week 8)
  - inverters / AC-AC (week 9)
  - modeling / small-signal (week 10)
  - weeks 1–4 appendix

### Build

- Primary: `typst compile main_test2.typ main_test2.pdf`
- Thin wrapper script allowed (`scripts/build.ps1` or equivalent)
- Commit/gitignore: track sources; ignore Typst cache and local editor folders

---

## 4. Verification / Reproducibility

Verification is the ongoing gate that makes the pipeline reproducible. It is **not** the same as cleanup.

Every new or rewritten Typst sheet must pass the same checks so another agent (or you) can re-run a course and get a comparable result.

Agents must run (or the implementation must provide) checks that:

1. **Compile:** `typst compile` succeeds
2. **Compact gate:** fail on derivation/lecture-note patterns in Typst sources; fail if a course page cap is set and exceeded
3. **Prose gate:** sheet prose reviewed with `avoid-ai-writing` (detect or edit); fix P0/P1 tells before calling the sheet done
4. **Coverage:** exam/exercise task types map to a section or recipe; gaps listed in `reports/`
5. **Print sanity:** tables readable; no clipped math; no crammed lookup tables

Do **not** treat “all keywords present” as success if the PDF is lecture-note length.

Root `prompts/verification_guide.md` defines the shared procedure, including when to run `avoid-ai-writing`. Course overrides may add stricter checks (e.g. hard page cap) but must not drop the compact or prose gates.

---

## 5. Cleanup Plan

Cleanup is a hygiene pass to remove obsolete stacks and tool droppings. It is **not** a substitute for verification.

### Advanced Power Electronics

**Delete** (LaTeX era and build junk):

- `main.tex`, `main_test2.tex`, all `sources/*.tex`
- `main*.aux`, `*.toc`, `*.out`, `*.log`, old `main*.pdf`
- Course-local `prompts/` once root prompts exist (avoid drift)
- LaTeX-era `PLAN.md` / `STARTPROMPT.md` if replaced by root docs + short course README/AGENTS
- `scripts/audit_test2_pdf.py` if it encodes the 67-page expectation — replace with Typst-era checks under §4

**Keep:**

- `input/` lecture and exam PDFs
- `reports/` (rewrite to match Typst sheet)
- Course identity (`README.md` updated to Typst workflow)

### Repo hygiene

- Remove `.cursor/`, `.antigravity/`, and similar tool droppings if present
- Update `.gitignore` for: `.cursor/`, `.antigravity/`, `.superpowers/`, Typst cache, OS junk; keep ignoring obsolete LaTeX aux if EM still produces them
- Root `README.md`: describe only the current multi-course Typst rules workflow; mention EM as legacy LaTeX until migrated
- Remove superseded LaTeX APE Test 2 spec/plan after the new plan exists (prefer delete for a clean tree)

### Electrical Machines

- No content migration this delivery
- May later point at root rules; not required now

---

## 6. Success Criteria

1. Root rules + style + verification guides exist and are the single global source of truth.
2. Shared Typst template compiles a smoke-test document.
3. APE Test 2 ships as Typst PDF: compact relative to the failed 67-page LaTeX version; no derivations; readable tables.
4. Verification gates (§4) pass on APE Test 2, including compact + `avoid-ai-writing` prose checks.
5. APE directory contains no `.tex` formula-sheet sources or LaTeX aux for the sheet (§5).
6. No `.cursor` / `.antigravity` junk in the repo; README matches reality.
7. EM unchanged and still builds as before.

---

## 7. Implementation Order (for the plan)

1. Root `AGENTS.md` + `prompts/*` + `.gitignore` + README
2. `templates/formula-sheet/` + smoke compile
3. APE course `AGENTS.md` (overrides) + Typst skeleton
4. Rewrite APE Test 2 sources to content contract + `avoid-ai-writing` prose pass
5. Verification scripts + reports refresh (§4, including prose gate)
6. Cleanup: delete APE LaTeX and superseded docs; final hygiene pass (§5)

---

## 8. Open Points (resolve in plan if needed)

- Exact optional page cap number for APE Test 2 after first compact draft
- Whether root should include a one-line `STARTPROMPT.md` pointing agents at `AGENTS.md` (optional convenience)
