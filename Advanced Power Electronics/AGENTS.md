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

**Converter atlas (mandatory appendix):** one clear schematic per Test 2 topology in `sources/appendix_converter_atlas.typ`. Exam has asked students to *draw* a converter — the atlas is the flip target.

| Must draw (atlas) | Notes |
|-------------------|--------|
| Buck, boost, buck-boost, Cuk | Weeks 1–4 |
| Flyback; forward tertiary; two-transistor forward; PSFB; DAB | Weeks 5/7 |
| 1φ diode bridge; 3φ 6-pulse; boost PFC | Week 8 |
| 1φ half/full-bridge VSI; 3φ VSI; AC voltage controller | Week 9 |

**Image override (this course only):** topology schematics in the converter atlas are allowed. Root “no images” still applies elsewhere.

**How to get schematics (do this — do not invent drawings):**

1. Prefer **Wikimedia Commons** (or another clearly open-licensed source). Search the topology name + `schematic` / `Schaltbild`.
2. Download into `Advanced Power Electronics/assets/commons/` (SVG preferred, PNG ok).
3. Keep a short attribution list in `assets/commons/SOURCES.md` (file → Commons title → license → author).
4. Embed with Typst `#image(...)` in the atlas — compact cards, readable on A4 print.
5. **Do not** hand-draw converter schematics in CeTZ/TikZ/path spaghetti. They come out messy and wrong for exam copy-from-sheet use.
6. If Commons has no usable figure for a topology (often PSFB/DAB), mark `// TODO: find Commons schematic` and leave a labeled empty slot — do not fake it with a bad sketch.

## Exam format

- **Paper-only** open book (≈60 min Test 2)
- Optimize for **physical flip and scan**, not Ctrl+F alone
- Heading keywords still help PDF search during prep
- **Mandatory Indholdsfortegnelse** right after the title (`#sheet-outline`, depth 2): eye-scan keyword → page number → flip. Missing TOC is a hard fail for this course.
- **Symboloversigt Sider column:** find $P$ (etc.) → read every page it appears on. Pages come from `#sym-here` marks only; exhaustive + correct or hard fail (`scripts/check_symbol_pages.py`).
- **Missing converter atlas** (or a topology from the table above) is a hard fail.

## Prose

All sheet **prose** (explanations, recipe steps, traps) must pass **`avoid-ai-writing`** before the sheet is called done.

## Optional page cap

```yaml
max_pages: TBD   # set after first compact Typst PDF draft
```

Global compact rules apply until `max_pages` is set; then verification must enforce the cap.