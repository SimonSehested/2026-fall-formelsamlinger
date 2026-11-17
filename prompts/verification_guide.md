# Verification guide — Typst formula sheets

Run this procedure for every **new or rewritten** Typst sheet. Do not treat keyword presence alone as success if the PDF is lecture-note length.

Course `AGENTS.md` may add checks (e.g. hard page cap) but must **not** drop the compact or prose gates.

## Gate order

Pass all five gates in order; stop and fix before claiming done.

### 1. Compile

```bash
typst compile <main>.typ <output>.pdf
```

- Build succeeds with no errors
- Main file includes all `sources/*.typ` in the intended order (Symboloversigt first)
- No missing includes or broken math

Use course `scripts/build.ps1` (or equivalent) when present.

### 2. Compact gate

Fail the sheet if sources read like lecture notes.

**Scan `sources/*.typ` and the PDF for forbidden patterns**, including but not limited to:

| Pattern | Why it fails |
|--------|----------------|
| Multi-step derivations (“from …”, “substituting …”, “it follows that …” chains) | Derivation / essay content |
| Fourier series or harmonic expansions taught step-by-step | Lecture depth |
| Sections titled or framed as “theoretical rationale”, “physical interpretation” essays | Textbook voice |
| Multi-page worked numerical examples | Override-only content |
| Long prose blocks with little display math | Slide paraphrase |
| Repeated duplicate formulas without exam benefit | Padding |

**Heuristics:**

- If removing a paragraph does not remove exam utility, it should not be there.
- If page count explodes vs. a compact reference, cut before adding more keywords.
- If the course `AGENTS.md` sets a **hard page maximum**, fail when exceeded.

Automated compact scripts may be added per course; until then, agent review of sources + PDF length is required.

### 3. Prose gate (`avoid-ai-writing`)

Applies to human-readable prose in the sheet: explanations, recipe steps, traps, table notes—not math, symbols, or file paths.

1. Run **`avoid-ai-writing`** (detect and/or edit) on sheet prose in the technical/docs register.
2. Fix **P0/P1** tells before calling the sheet done (template openers, hollow intensifiers, synonym cycling, bold spam, filler transitions, “it’s not X, it’s Y” frames).
3. Re-compile after substantive prose edits.

Do not pass this gate by deleting all explanations; keep the content contract (short, direct sentences).

### 4. Coverage gate

Map **exam and exercise task types** to a section, formula, or recipe.

1. List problems or task types from `input/exams/` (and exercises when relevant).
2. For each: problem type, required formulas/method, section/heading in the sheet, recipe yes/no.
3. Record in `reports/`, e.g. `reports/exam_verification_report.md`:

| Source | Problem / task | Type | Fast method | Covered in section | Missing recipe? |
|--------|----------------|------|-------------|-------------------|-----------------|

4. Update `reports/coverage_report.md` with: sources used, topic structure, notation, gaps, uncertainties.

**Fail** if a recurring exam task has no searchable heading or compact recipe and you have not listed it as a known gap with a plan to fix.

Do not solve full exam papers unless needed to discover missing formulas.

### 5. Print sanity

Open the PDF at 100% scale (print or on-screen at A4):

- Symboloversigt and lookup tables: readable rows, no clipped text
- Display math not cut off at margins
- Tables not illegibly cramped (positive spacing; no negative cram)
- Heading hierarchy scannable for flip/search during the exam format described in course `AGENTS.md`

## Symboloversigt check (within coverage / print)

1. `sources/00_symbols_and_notation.typ` (or equivalent) exists and is **first** include in the main file.
2. Spot-check: non-trivial symbols in display math appear with meaning and unit.
3. Overloaded symbols have context notes; constants have value and unit.
4. Add missing symbols before passing gate 4.

## When to run `avoid-ai-writing`

| Phase | Action |
|-------|--------|
| While drafting new prose | Write with skill habits inline |
| After compact pass | Detect/edit all explanatory prose before final compile |
| After coverage fixes | Re-run on changed paragraphs only |

## Recording results

Per course, keep under `reports/`:

- `exam_verification_report.md` — per-problem / per-task coverage table
- `coverage_report.md` — structure, notation, gaps

Note gate pass/fail and date in the coverage report when the sheet is declared done (optional one-line status block at top).

## Anti-patterns (do not rubber-stamp)

- “All keywords present” on a 50+ page derivation-style PDF
- Skipping prose gate because “it’s only formulas” when paragraphs exist
- Adding long explanations instead of a 5-step recipe
- Passing compile while failing compact or print sanity