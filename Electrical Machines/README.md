# Electrical Machines — formelsamling

Codex-pipeline som `2026-spring-formelsamlinger` (Chemistry-varianten: Ctrl+F eksamensopslag).

## Struktur

```text
input/lectures/   <- læg slides her
input/exams/      <- læg eksamenssæt her
input/exercises/  <- valgfrit
sources/          <- genereres af agenten
reports/          <- coverage + verification
prompts/          <- style + verification guides
AGENTS.md
PLAN.md
main.tex
STARTPROMPT.md
```

## Workflow

1. Drop pensum i `input/`
2. Åbn Codex i denne mappe
3. Kør prompten i `STARTPROMPT.md`
4. Byg/check PDF fra `main.tex`
