# EE4007 Advanced Power Electronics — formelsamling (Test 2)

Typst-baseret eksamensopslagsbog for **Test 2** (uge 5, 7, 8, 9, 10 + kort uge 1–4 bilag). Se `AGENTS.md` for scope og regler; root `AGENTS.md` har forrang.

## Struktur

```text
input/              forelæsnings-/eksamen-PDF'er (fladt)
sources/*.typ       modulært indhold (Test 2)
main_test2.typ      Typst-entry for Test 2
scripts/build_test2.ps1
reports/            coverage + verification
```

## Byg Test 2 PDF

Kræver [Typst](https://typst.app/) på `PATH` (fx `winget install --id Typst.Typst`).

Fra repo-roden:

```powershell
typst compile --root . "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"
```

Eller fra kursusmappen:

```powershell
.\scripts\build_test2.ps1
```

## Verifikation

Kompakt-gate (fra repo-roden). Ingen side-cap før `max_pages` er sat i `AGENTS.md`.

```powershell
python scripts/check_compact.py `
  "Advanced Power Electronics/sources/00_symbols_test2.typ" `
  "Advanced Power Electronics/sources/test2_quick_lookup.typ" `
  "Advanced Power Electronics/sources/05_isolated_dcdc_test2.typ" `
  "Advanced Power Electronics/sources/07_ac_dc_rectifiers.typ" `
  "Advanced Power Electronics/sources/08_dc_ac_inverters.typ" `
  "Advanced Power Electronics/sources/09_modeling_and_small_signal.typ" `
  "Advanced Power Electronics/sources/appendix_weeks1_4.typ"
```

`scripts/audit_test2_pdf.py` kalder samme gate og tjekker derefter at kerneord findes i PDF'en. Scriptet har ingen forventet sidetal eller bogmærke-layout.

```powershell
python "Advanced Power Electronics/scripts/audit_test2_pdf.py"
```

Dækning og huller: `reports/coverage_report.md`, `reports/exam_task_taxonomy.md`, `reports/exam_verification_report.md`.

## Workflow (agent)

1. Læg pensum i `input/`
2. Følg root `AGENTS.md` + course `AGENTS.md`
3. Skriv/omskriv `sources/*.typ`; kør `prompts/verification_guide.md` før “færdig”
4. Byg med kommandoerne ovenfor