# AGENTS.md (repo root)

You are building or rewriting a **Typst** exam formula sheet for a course described by that course’s source material.

**Typesetting:** Typst → PDF only for new or rewritten sheets. Do not add LaTeX formula-sheet sources in courses that have migrated.

**Rule precedence:**

1. This file and `prompts/style_guide.md` + `prompts/verification_guide.md` always apply.
2. A course `AGENTS.md` may **tighten or specialize** (scope, languages, hard page cap, allowed exceptions).
3. Course files must **not** weaken: no derivations, compact reference style, Symboloversigt-first, exam usability.

Read `prompts/style_guide.md` for layout and prose habits; run `prompts/verification_guide.md` before calling a sheet done.

## Goal

Create a compact, searchable, exam-friendly formula reference.

The PDF must work under exam stress: recognize a task type, find the formula or recipe, apply it—not read a textbook.

Primary user situation:

- solving an exam-style problem
- matching keywords from the problem statement
- needing the formula, decision rule, or solution recipe immediately
- **no** long derivations, proofs, or lecture-style essays

## Content contract (hard rules)

Each concept is normally:

1. Searchable heading (course / exam keywords)
2. One or two display formulas
3. One to three short sentences (meaning, assumptions, when to use)
4. Optional: short exam recipe (3–7 steps), traps, one-line checks

**Required:** Symboloversigt first; formulas for recurring exam tasks; validity conditions and common traps; organize by problem type when faster than lecture order.

**Forbidden:** derivations, proofs, multi-step theory essays, long prose overviews, slide paraphrases, worked numerical examples (unless a course override allows one mini example), padding, unnecessary duplication, images (unless course override requires them).

If a section reads like a textbook chapter, cut it. Global policy: as short as readable; hard page caps only in course overrides.

## Prose: `avoid-ai-writing` (mandatory)

Before you finish sheet **prose** (explanations, recipe steps, traps, table notes—not math tokens or symbol names):

1. Use the **`avoid-ai-writing`** skill (technical / docs register).
2. Short engineering handbook voice: direct claims, concrete conditions; no template openers, hollow intensifiers, synonym cycling, bold spam, or filler transitions.
3. Do not “humanize” notation or soften wording in a way that changes technical meaning.

## Source material

Typical inputs:

- `input/exams/`, `input/lectures/`, `input/exercises/`
- or `source_material/*` equivalents

Inspect what exists. Infer course title, topics, notation, exam format, and recurring problem types. Do not assume a fixed syllabus.

Do not invent unsupported formulas unless they are standard prerequisites clearly required for exam/exercise problems.

If uncertain, mark in Typst source:

```typ
// TODO: verify from source
```

## Output files (Typst)

Modular Typst in the course folder:

- Entry: `main.typ` or `main_test2.typ` (thin—mostly `#include`)
- Chapters: `sources/*.typ`

Use the project’s existing structure when present; otherwise create `sources/`.

One `.typ` file per major exam-relevant topic. Numbered names, e.g.:

```
sources/00_symbols_and_notation.typ
sources/01_topic_name.typ
```

Do not put large bodies of content in the main file.

## Mandatory first section: Symboloversigt

The sheet **must** start with a complete symbol glossary (DTU-style Symboloversigt).

- File: typically `sources/00_symbols_and_notation.typ`
- First `#include` in the main entry, before topic modules

For each symbol: symbol (math), meaning (course terminology), SI or course-standard unit. Compact three-column tables: Symbol | Meaning | Unit.

Group by theme when helpful. Include overloaded symbols, common subscripts/aliases, and physical constants (value + unit).

Rules:

- Infer from source material and from formulas you write
- Every symbol in a display formula in `sources/*.typ` should appear here (except obvious local indices)
- Prefer course language; Danish/English aliases in Meaning when both appear
- Units explicit (`T`, `A/m`, `V`, `r/min`, dimensionless, …)

A sheet without Symboloversigt is incomplete.

## Organization

Document order:

1. Symboloversigt
2. Topic / recipe modules (and quick-lookup tables when useful)

Follow lecture order only when it helps; prefer exam-task organization when problems cut across weeks.

Use headings and optional blocks for: keywords, core formulas, exam recipes, recognition rules, traps, one-line checks—only when they improve lookup speed.

## Searchability

Headings must contain words from exam titles, question wording, lectures, exercises, synonyms, and course notation.

With multiple languages, include useful aliases (e.g. Danish + English in the same heading).

Optimize for in-PDF search **and** (when relevant) fast flipping in a paper-only open-book exam—see course `AGENTS.md`.

## Exam recipes

For each recurring exam/exercise task type, add a compact recipe (3–7 steps): use when, steps, fast checks, common traps. A recipe beats a derivation.

## Coverage and reports

After writing or rewriting, map exam/exercise task types to sections or recipes. Update under `reports/`, e.g.:

- `reports/exam_verification_report.md`
- `reports/coverage_report.md`

Gaps must be listed; fix missing compact recipes in `sources/*.typ`.

## Build and finish

Primary build:

```bash
typst compile main.typ output.pdf
```

(or the course’s named main file / `scripts/build.ps1`)

Before finishing, pass all gates in `prompts/verification_guide.md` (compile, compact, prose/`avoid-ai-writing`, coverage, print sanity).

## Do not

- weaken root rules in a course `AGENTS.md`
- write textbook chapters or lecture-note PDFs
- include derivations or long proofs
- duplicate formulas without exam benefit
- leave raw notes in shipped `.typ` files
- lengthen the sheet only to appear complete
- create root `STARTPROMPT.md` (use this file + course overrides)