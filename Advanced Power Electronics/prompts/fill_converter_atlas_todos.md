# Prompt: Fill APE converter-atlas TODOs from Wikimedia Commons

Copy everything below the line into another AI (with repo access + web/download).

---

## Task

Fill the remaining **TODO** slots in the EE4007 Advanced Power Electronics Test 2 **converter atlas** using real open-licensed schematics from the internet — primarily **Wikimedia Commons**. Do **not** hand-draw circuits in CeTZ, TikZ, SVG path junk, or ASCII art.

Repo root: this git repo (`2026-fall-formelsamlinger`).

## Hard rules

1. **Source:** Wikimedia Commons first. Other sources only if clearly open-licensed (CC BY / CC BY-SA / public domain) and you record license + author + URL.
2. **Never invent drawings.** If no usable schematic exists after a real search, leave `#todo(...)` and note why in `SOURCES.md`.
3. **Files go in:** `Advanced Power Electronics/assets/commons/`
4. **Prefer SVG originals.** Download via Commons “Original file” or  
   `https://commons.wikimedia.org/wiki/Special:FilePath/<Exact_File_Name>`  
   **without** `?width=` (that returns a PNG thumbnail mislabeled as SVG).
5. **Verify file type** after download: SVG must start with `<?xml` or `<svg`. If PNG bytes (`\x89PNG`), rename to `.png`.
6. **Rate limits:** Commons returns HTTP 429 if you hammer it. Download **one file at a time**, wait **5–10+ seconds** between requests. Retry later if blocked.
7. **Wire into atlas:** `Advanced Power Electronics/sources/appendix_converter_atlas.typ`  
   Replace each `#todo([...], [...])` with `#topo([Title], "filename.ext")` using the existing helpers.
8. **Attribution:** update `Advanced Power Electronics/assets/commons/SOURCES.md` (local file → Commons title/URL → license → author → in atlas).
9. **Compile check:** from repo root  
   `typst compile --root . "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"`  
   Fix path/image errors until it builds.
10. Read course override: `Advanced Power Electronics/AGENTS.md` (converter atlas section). Do not weaken “no hand-drawn schematics”.

## Already done (do not re-download unless replacing with a better SVG)

| Topology | Local file |
|----------|------------|
| Buck | `buck.svg` |
| Boost | `boost.svg` |
| Buck-boost | `buckboost.png` (upgrade to real SVG if possible) |
| Flyback | `flyback.svg` |
| Forward | `forward.png` (upgrade to real SVG if possible; prefer tertiary-reset if available) |
| 1φ diode bridge | `diode_bridge.png` |
| 3φ 6-pulse | `rect_3ph.png` |

## TODOs to fill

Search Commons with these queries (English + German often helps). Pick a **clear single-line schematic** suitable for an exam “draw the converter” cheat sheet — not a photo, not a waveform-only figure, not a huge multi-mode poster.

| Atlas title | Search hints |
|-------------|--------------|
| Cuk | `Cuk converter schematic`, `Cuk-wandler`, `Cuk Schematic` |
| Two-transistor forward | `two-transistor forward`, `Zwei-Transistor-Durchflusswandler`, `two switch forward` |
| PSFB | `phase-shifted full bridge`, `phase shift full-bridge converter schematic` (often scarce — leave TODO if nothing usable) |
| DAB | `dual active bridge schematic`, `Dual Active Bridge converter` (often scarce — leave TODO if nothing usable) |
| Boost PFC | `boost PFC schematic`, `Pont de diode avec PFC`, `power factor correction boost` |
| 1φ half-bridge VSI | `half-bridge inverter schematic`, `Halbbrücke Wechselrichter` |
| 1φ full-bridge VSI | `full-bridge inverter schematic`, `H-bridge inverter`, `Vollbrücke` |
| 3φ VSI | `three-phase inverter schematic`, `Pulswechselrichter schaltung`, `3-phase inverter` |
| AC voltage controller | `AC voltage controller thyristor`, `Wechselstromsteller`, `anti-parallel SCR AC` |

Optional upgrades (nice, not required): replace `buckboost.png` / `forward.png` with true SVG originals; for forward, prefer a **tertiary reset** diagram if Commons has one that matches the course.

## Done criteria

- Every topology above is either a `#topo` with a readable Commons image, or an honest remaining `#todo` with a short reason in `SOURCES.md`.
- `SOURCES.md` lists every new file.
- `main_test2.typ` compiles.
- No CeTZ/hand-drawn converter schematics added.

## Out of scope

- Do not rewrite formula chapters, Symboloversigt, or page-index marks.
- Do not add lecture photos or slide screenshots.
- Do not commit unless the human asks.
