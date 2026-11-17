# Coverage Report — EE4007 Advanced Power Electronics (Test 2)

**Date:** 2026-11-17  
**Sheet:** `Advanced Power Electronics/main_test2.typ` → `main_test2.pdf`  
**Page count:** 16 (A4, title page included). `max_pages` in course `AGENTS.md` is still unset. The 30-page cut line from the Typst plan is not reached.  
**Engine:** Typst (`typst compile --root .`). The earlier 67-page pdfTeX sheet is not the current artifact.

## Gate status

| Gate | Result |
|---|---|
| Compile | Pass, 2026-11-17, exit 0, 16 pages |
| Compact | Pass. `scripts/check_compact.py` on the seven `sources/*.typ` files included by `main_test2.typ`. `scripts/audit_test2_pdf.py` is a wrapper around that check plus a keyword smoke. It does not encode a page count. |
| Prose | Unchanged this pass. Task 5 wrote the sheet prose in the technical/docs register. No sheet sentences were edited here. |
| Coverage | Pass with listed gaps. Task types below map to a heading. Missing recipes are named. Week 11 is excluded on purpose. |
| Print sanity | Template is A4, 1.35 cm margin, 10 pt, table inset 6 pt × 5 pt, gutter 4 pt. Sources have no negative spacing. Text extracts on all 16 pages. No PDF rasterizer in this environment, so row clipping was not checked on a bitmap. |

## Scope

Test 2 is Weeks **5, 7, 8, 9, 10**, plus a Weeks **1–4** appendix.

Week **11** (`Modeling and Control 2_Week 11 - For Students.pdf`) is closed-loop control: voltage mode, current mode, compensators. It is not in the sheet. The Week 10 RHP note only sets a crossover limit and warns against cancelling the RHP zero with an RHP compensator pole. That is a use-limit, not a Week 11 design section.

The appendix (`appendix_weeks1_4.typ`) is a cheat sheet: CCM, DCM, and ZCS/ZVS tables. It is not a chapter and it has no exam recipes.

## Sources used

Lecture PDFs in `Advanced Power Electronics/input/` (flat folder; no `input/exams/` papers in this tree):

- Weeks 1–2 CCM/DCM, Weeks 3–4 ZCS/ZVS (appendix only)
- Week 5 isolated DC/DC I, Week 7 isolated DC/DC II
- Week 8 rectifiers (outline: uncontrolled/controlled rectifiers, power factor, PFC, harmonics, power quality)
- Week 9 inverters
- Week 10 modeling and control, part 1 (open-loop small signal)
- Week 11 listed above, excluded
- `EE4007_General Info_2026.pdf` for course identity
- `Midterm Test Arrangement - Sessions 1&2.pdf` is a seating list, not problems

There is no past-paper set. The matrix in `exam_verification_report.md` maps lecture task types, not scored exam questions.

## Sheet order

1. Symboloversigt — `sources/00_symbols_test2.typ` (first include)
2. Quick lookup — `sources/test2_quick_lookup.typ` (isolated, rectifiers, inverters, $G_{vd}$)
3. Isolated DC/DC — `sources/05_isolated_dcdc_test2.typ`
4. Rectifiers and PFC — `sources/07_ac_dc_rectifiers.typ`
5. Inverters and AC-AC — `sources/08_dc_ac_inverters.typ`
6. SSA and $G_{vd}$ — `sources/09_modeling_and_small_signal.typ`
7. Weeks 1–4 tables — `sources/appendix_weeks1_4.typ`

## Notation

Symboloversigt groups constants, circuit and isolation quantities, Week 8 rectifier symbols, Week 9 inverter/SPWM symbols, Week 10 SSA symbols, QRC symbols, and overloaded letters (`n`, `phi`, `alpha`, `Q`, `d`, `f_c`, `omega_0`, `L_k`).

## Gaps and uncertainties

1. **PSFB.** Heading, $D_"eff"$, ZVS note, and a trap. No `#recipe`.
2. **Common-mode voltage.** One formula block. No recipe.
3. **Single-phase $2\omega$ bus capacitor.** One formula block. No recipe.
4. **Rectifier $V_"dc"$.** Averages sit in the Week 8 sections and the quick-lookup table. Recipes exist for PF and Boost PFC, not for picking the $V_"dc"$ row.
5. **Six-step.** Formulas are in the three-phase VSI section. The SPWM recipe has one square-wave step. No standalone six-step recipe.
6. **AC-side overlap angle $\mu$.** Symboloversigt defines $\mu$, and $\alpha_"max" = 180° - \gamma - \mu$ is printed. There is no formula for $\mu$ or for the DC drop from source inductance. Week 8 text extraction did not contain the words “overlap” or “commutation” (slides are figure-heavy). Leave the formula out until a problem or a readable slide states it.
7. **DAB $n$.** `05_isolated_dcdc_test2.typ` still has `// TODO: verify from source` on $n$ in the numerator with $L_k$ primary-referred.
8. **Appendix recipes.** Omitted on purpose. Add a recipe only if a Test 2 problem needs steps the tables do not show.
9. **Week 11.** Excluded. Do not add compensator design to close a coverage gap.

Plan, not done in this pass: add short recipes for PSFB, CMV, and the $2\omega$ capacitor if a later edit wants recipe parity. Confirm item 6 from a figure or a problem before writing an $L_s$ formula.
