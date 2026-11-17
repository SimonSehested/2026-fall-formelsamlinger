# Formula sheet Typst template

Shared layout and helpers for course formula sheets (design spec §3).

## Import in a course main file

From a course folder (e.g. `Advanced Power Electronics/main_test2.typ`):

```typ
#import "../templates/formula-sheet/lib.typ": formula-sheet, symbol-table, recipe, traps
#show: formula-sheet

#include "sources/00_symbols_and_notation.typ"
// …other topic modules
```

Adjust the relative path if the entry file lives elsewhere.

## Helpers

| Name | Purpose |
|------|---------|
| `formula-sheet` | `#show` rule: A4, ~1.35 cm margins, 10 pt body, print-friendly contrast |
| `symbol-table` | Symboloversigt table: pass symbol / meaning / unit cells |
| `recipe` | Boxed exam recipe (`title`, `use-when`, `steps`, optional `fast-checks`) |
| `traps` | Left-bar list of common mistakes |

Tables use positive inset and gutter only (no negative cram).

## Smoke compile

```bash
typst compile templates/formula-sheet/smoke.typ templates/formula-sheet/smoke.pdf
```