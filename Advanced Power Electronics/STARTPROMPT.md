# Startprompt til Codex

Kør Codex med cwd i denne mappe:

`Electrical Machines`

## Prompt

```text
Read AGENTS.md, PLAN.md, prompts/style_guide.md, and prompts/verification_guide.md.

Then execute PLAN.md fully.

Build a complete LaTeX formula collection for the course described by the files in input/.

Do not assume the course topic structure in advance.
Infer the course title, topic order, notation, and recurring exam concepts from the source material.

Create sources/*.tex dynamically using one file per inferred lecture/topic.
The first source file MUST be sources/00_symbols_and_notation.tex: a Symboloversigt listing every exam-relevant symbol with meaning and unit (three-column tables).
Update main.tex to input all generated source files, with the Symboloversigt first.

Work slide package by slide package, then verify against the exam sets.
After writing chapters, audit formulas and complete any missing Symboloversigt entries.

Compile the document, fix LaTeX errors, and update:
- reports/coverage_report.md
- reports/exam_task_taxonomy.md
- reports/exam_verification_report.md

Do not stop after planning. Start implementing.
```

## Før du kører

Læg pensum her:

- `input/lectures/` — slides / lecture PDFs
- `input/exams/` — eksamenssæt (+ facit hvis du har det)
- `input/exercises/` — opgaver (valgfrit)
