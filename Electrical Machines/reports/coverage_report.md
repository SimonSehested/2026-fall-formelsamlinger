# Coverage report — EE4003 Electrical Machines

## Detected source files

### Lectures (`input/lectures/`)
- `0_2_EE4003_EE4021_Subject_briefing2026.pdf` — course intro, schedule
- `Unit_1_Basic_concept_of_design.pdf` … `Unit_7_Harmonic_effects.pdf`
- Review packs: `Review_Unit_1` … `Review_Unit_7`, `Final_Review_0_Basic_Formulae.pdf`, `Final_Review_0_Formula_Sheet.pdf`, `Final_Review_1.pdf`

### Exams (`input/exams/`)
- `EE4003_Questions_2016-17.pdf` (scanned; questions recovered via solutions)
- `EE4003_Solutions_2016-17.pdf`
- `EE4002_test_2024_25_solutions.pdf` (file name says EE4002; header is **EE4003** In-Class Test I, S1 2024/25)

### Exercises (`input/exercises/`)
- Tutorial Units 1–7 (design track)
- Mini-project briefs (phasor/space vector, IM ab/dq Simulink, VSI, PWM, wind, sensorless, FEA, …)

## Inferred course title

**EE4003 Electrical Machines** (PolyU; related code EE4021 in briefing). Credits: 3.

## Inferred topic structure (lecture order)

| Week | Block | Topics |
|---|---|---|
| 1–6 | Prof. Niu | Design concepts, main dimensions, initial design, winding MMF, reactances, UMP, harmonic effects |
| 7 | Test I | Open-book design / magnetics focus |
| 8–12 | Dr. Jiang | Sync machine modelling, winding transforms, IM modelling, AC motor control, PWM |
| 13 | Test II | Modelling / drives focus |

## Recurring exam and exercise concepts

1. Output coefficient \(G\), square-pole \(D,L\), \(T_{\mathrm{ph}}\), conductor area
2. Magnetizing inductance / effective air gap \(g'\)
3. Slot leakage permeance and \(X_s\) scaling
4. Magnetic circuit \(B_g,\Phi\) with series air gaps
5. Skew factor killing slot harmonics
6. Fringing vs laminated cores (qualitative)
7. Sync power angle + hunting frequency
8. Clarke/Park / orthogonal transforms
9. IM torque, breakdown, starting
10. PWM: equal-area, \(M\), \(p\), 3rd-harmonic injection, pulse widths

## Standard notation (deterministisk standard)

| Symbol | Meaning |
|---|---|
| \(p\) | pole-pairs (\(2p\) is total poles) |
| \(D_g,L_c\) | air-gap diameter, core length |
| \(\bar{B}\) | specific magnetic loading (average air-gap flux density) |
| \(ac\) | specific electric loading (ampere-conductors/m) |
| \(G\) | output coefficient (\(S_{3\phi}/(D_g^2 L_c n)\)) |
| \(K_w=K_p K_d\) | winding factor |
| \(g,g'\) | geometric / Carter-effective air gap |
| \(S_{3\phi}\) | apparent power (VA) |
| \(T_{\mathrm{ph}}\) | turns per phase |
| \(z_s\) | conductors per slot |
| \(\Phi_m\) | flux per pole |
| \(X_m,X_p,X_s,X_d,X_q\) | magnetizing / leakage / sync / \(d\)–\(q\) reactances |
| \(S_1,S_2\) | stator / rotor slot numbers |
| \(A_{\mathrm{cond}},A_{\mathrm{slot}},A_g\) | conductor area, gross slot area, air gap pole area |
| \(V_{\mathrm{LL}},V_{\mathrm{ph}},E_{\mathrm{ph}}\) | line-to-line voltage, phase voltage, induced phase EMF |
| \(\omega_e,\omega_m,\omega_{ms}\) | electrical frequency, mechanical speed, synchronous speed |
| \(J_{\mathrm{cond}},J_{\mathrm{iner}}\) | conductor current density, rotor moment of inertia |
| \(\varepsilon_{\mathrm{ch}},\varepsilon_{\mathrm{drop}},\varepsilon_{\mathrm{ecc}}\) | chording angle, leakage drop ratio, relative eccentricity |

## Proposed / implemented output structure

| File | Section |
|---|---|
| `sources/01_basic_electromagnetics.tex` | Ampere, Faraday, 3-ph VA, speed/slip |
| `sources/02_basic_concept_of_design.tex` | Losses, materials, saturation effects |
| `sources/03_main_dimensions.tex` | \(B\), \(ac\), \(G\), square pole, gap, Carter, fringing |
| `sources/04_initial_design.tex` | Design checklist |
| `sources/05_mmf_windings.tex` | MMF, \(K_p,K_d,K_w\), cage |
| `sources/06_reactances.tex` | Slot leakage, \(X_m\) |
| `sources/07_unbalanced_magnetic_pull.tex` | Eccentricity UMP, slot rules |
| `sources/08_harmonic_effects.tex` | Cogging, crawling, skew |
| `sources/09_synchronous_machines.tex` | Power angle, hunting |
| `sources/10_transformations.tex` | Symmetrical components, Clarke/Park |
| `sources/11_induction_machine_torque.tex` | \(T(\omega_2)\), \(T_b\), \(T_{\mathrm{st}}\) |
| `sources/12_pwm_inverters.tex` | PWM / VSI exam formulas |

## Known uncertainties

- EE4003 2016/17 question PDF is image-scanned; problem text inferred from solutions.
- Week 8–12 lecture PDFs are sparse in `input/lectures/`; sync / transform / PWM content taken from formula sheet + exams (marked where needed).
- Exact \(C_1\) row layout on the printed formula sheet is OCR-noisy; scaling matched to 2016/17 QA3.
- Mini-project PDFs are survey/Simulink tasks, not formula drivers.

## Build status

- `main.tex` inputs all 12 source files.
- `pdflatex` produces `main.pdf` (23 pages) successfully without errors.
