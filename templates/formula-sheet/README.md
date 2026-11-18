# Formula sheet Typst template

Shared layout and helpers for course formula sheets (design spec §3).

## Import in a course main file

From a course folder (e.g. `Advanced Power Electronics/main_test2.typ`):

```typ
#import "../templates/formula-sheet/lib.typ": formula-sheet, sheet-outline, symbol-table, recipe, traps
#show: formula-sheet

#sheet-outline() // after title, before Symboloversigt
#include "sources/00_symbols_and_notation.typ"
// …other topic modules
```

Adjust the relative path if the entry file lives elsewhere.

## Helpers

| Name | Purpose |
|------|---------|
| `formula-sheet` | `#show` rule: A4, ~1.35 cm margins, 10 pt body, print-friendly contrast |
| `sheet-outline` | Dense Indholdsfortegnelse (depth 2): eye-scan → page → flip |
| `symbol-table` | Symboloversigt: `id, symbol, meaning, unit` → adds **Sider** from marks |
| `sym-here` | Invisible occurrence marker; place at every formula/section use |
| `sym-pages` | Page list for one id (used inside `symbol-table`) |
| `recipe` | Boxed exam recipe (`title`, `use-when`, `steps`, optional `fast-checks`) |
| `traps` | Left-bar list of common mistakes |

Tables use positive inset and gutter only (no negative cram).

## Smoke compile

```bash
typst compile templates/formula-sheet/smoke.typ templates/formula-sheet/smoke.pdf
```