# AGENTS.md — EE4007 Advanced Power Electronics

**Precedence:** Root `AGENTS.md` and `prompts/style_guide.md` + `prompts/verification_guide.md` apply first. This file only tightens scope and exam context.

## Entry and build

- **Test 2 sheet:** Typst → `main_test2.typ`, modular `sources/*.typ`
- **Do not** add LaTeX formula sources. Test 2 is Typst only.
- Build from the repo root: `typst compile --root . "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"` or `scripts/build_test2.ps1` (script already passes `--root`)

## Test 2 scope

| In | Out |
|----|-----|
| Weeks **5, 7, 8, 9, 10** | Week **11** |
| Ultra-short **Weeks 1–4** appendix (compact tables, not chapters) | Full lecture-style Weeks 1–4 body in the main spine |

**Quick lookup:** four appendix-style tables (isolated, rectifiers, inverters, modeling) — keep scannable on paper.

## Exam format

- **Paper-only** open book (≈60 min Test 2)
- Optimize for **physical flip and scan**, not Ctrl+F alone
- Heading keywords still help PDF search during prep

## Prose

All sheet **prose** (explanations, recipe steps, traps) must pass **`avoid-ai-writing`** before the sheet is called done.

## Optional page cap

```yaml
max_pages: TBD   # set after first compact Typst PDF draft
```

Global compact rules apply until `max_pages` is set; then verification must enforce the cap.