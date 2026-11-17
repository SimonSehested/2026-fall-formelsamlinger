# 2026-fall-formelsamlinger

Formelsamlinger til DTU-efterår 2026: reproducerbar **Typst → PDF**-pipeline med fælles agentregler.

## Start her

1. Læs **[AGENTS.md](AGENTS.md)** (globale krav, indholdskontrakt, Symboloversigt-first).
2. Læs **`prompts/style_guide.md`** og **`prompts/verification_guide.md`** før du afleverer et ark.
3. Skriv eller omskriv prose omkring formler med skillen **`avoid-ai-writing`** (technical/docs).

## Workflow (Typst)

Per kursus (når Typst er på plads):

```
<course>/
  main.typ eller main_test2.typ   # tynd entry — #include af sources
  sources/*.typ                   # modulært indhold
  input/                          # forelæsninger, eksamener, øvelser
  reports/                        # coverage + verification
  scripts/                        # typst compile / checks (valgfrit)
```

Byg:

```bash
typst compile main.typ main.pdf
```

Shared layout ligger i `templates/formula-sheet/`. Nye og omskrevne ark må **kun** leveres som Typst-kilder + PDF—ikke LaTeX-formelsamlinger.

## Kurser

| Mappe | Status |
|-------|--------|
| **Advanced Power Electronics/** | Test 2 er Typst (`main_test2.typ` → PDF). Ingen LaTeX-formelkilder i mappen. Nyt arbejde følger root [AGENTS.md](AGENTS.md). |
| **Electrical Machines/** | **Legacy LaTeX** indtil separat migration. Rør ikke EM-indhold i denne leverance; behold eksisterende `main.tex` / `sources/*.tex` workflow. |

## Regelhierarki

- Root **AGENTS.md** + **prompts/** gælder altid.
- Kursus-**AGENTS.md** må kun **stramme** (scope, sprog, sidecap, undtagelser)—ikke tillade afledninger eller tekstbogslængde.

## Repo-layout (mål)

```
AGENTS.md
prompts/
templates/formula-sheet/   # delt Typst-tema (lib.typ)
README.md
<course folders>
docs/superpowers/          # design & planer
```

Design: `docs/superpowers/specs/2026-11-17-formelsamling-typst-rules-design.md`