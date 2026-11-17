# Style guide — Typst formula sheets

Shared layout and wording rules for all courses. Course `AGENTS.md` may add stricter limits only.

**Prose:** explanatory text around formulas must follow the **`avoid-ai-writing`** skill (technical/docs register) before you call the sheet done. Formulas stay formulas—do not rephrase math for “tone.”

## Unit shape

Each concept is normally:

```typ
=== Searchable concept name, dansk alias, keyword
$
  formula
$
One or two short sentences: meaning, assumptions, when to use.
```

Optional: boxed recipe, trap block, one-line check (use shared template helpers when `templates/formula-sheet/` exists).

## Mandatory habits

- Valid Typst only in `sources/*.typ` and main entry files—no Markdown inside `.typ`.
- Clear heading hierarchy (`=`, `==`, `===`—match template conventions).
- One concept per lowest-level heading when possible.
- Important results in display math (`$ ... $` or `#math.block`).
- After each formula block: **1–3 concise sentences** (see `avoid-ai-writing`).
- Physical/mathematical meaning over procedure, except in exam recipes.
- No long paragraphs; no bullet lists unless they speed lookup.
- No worked examples unless a course override allows one mini example.
- Infer notation from course sources; do not import another course’s symbols.

## Explanation style

Good:

> The torque–speed relation follows from air-gap power and rotor current.

Bad:

> This formula is useful when you need to calculate the answer on exams.

Good:

> Synchronous speed is set by supply frequency and pole-pair count.

Bad:

> You should remember this because it often appears in exams.

## Headings and searchability

Include exam wording, lecture titles, synonyms, and notation.

Good:

```typ
=== Synchronous speed, synkron hastighed, pole pairs, $n_s$
```

Bad:

```typ
=== Important formula
=== Theory
```

## Exam recipes

```typ
== Exam recipe: task name

*Use when:* short condition.

+ Step 1.
+ Step 2.
+ Step 3.

*Fast checks:* …

*Common traps:* …
```

Keep **3–7** steps. Prefer template “boxed recipe” styling when available.

## Length

A normal concept block:

- 1 searchable heading
- 1–2 display equations
- 1–3 short sentences

Longer content is for lookup tables, symbol tables, decision matrices, and appendix cheat sheets—not narrative.

## Tables

Use tables for symbol overview, conversion ratios, mode summaries, sign conventions, traps at a glance.

**Spacing:** row and paragraph spacing must stay **positive** and readable. Do not cram tables with negative vertical glue or ultra-tight leading; illegible tables fail print sanity.

Symboloversigt example (three columns):

```typ
= Symboloversigt

#table(
  columns: (auto, 1fr, auto),
  table.header([Symbol], [Meaning], [Unit]),
  [$B$], [Air-gap flux density], [$"T"$],
  [$T$], [Torque], [$"N*m"$],
)
```

Rules:

- Every important symbol in topic modules appears in Symboloversigt
- Meaning states what the quantity is—not a repeat of the symbol name
- Units explicit; use “dimensionless” when needed
- Split thematic tables if one table grows too long
- Note overloaded symbols with context

Constants table when relevant: symbol, value, unit, short note.

## Typst formula habits

- Prefer `align` / `equation` blocks for multi-line results
- Keep main entry thin: `#include "sources/00_symbols_and_notation.typ"` first, then topics in exam-usable order
- Use `// TODO: verify from source` when slides are unclear—do not guess silently

## Forbidden patterns (style)

Do not write:

- step-by-step derivations (“starting from … we obtain …” chains)
- Fourier series or harmonic expansions as teaching sections
- “theoretical rationale” or “physical interpretation” essays
- multi-page worked examples
- slide-by-slide paraphrase

If you need a result, state the **final** formula and one line on when it applies.

## Verification cross-reference

When the sheet is structurally complete, run `prompts/verification_guide.md` (all five gates, including `avoid-ai-writing` on prose).