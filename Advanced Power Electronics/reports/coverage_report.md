# Coverage report — EE4007 Advanced Power Electronics

## Detected source files

All material is in `input/` (flat; no separate `exams/` or `exercises/` folders).

### Lectures / student slides
- `DC-DC CCM_Week 1_For Students.pdf` — PWM DC/DC I (CCM: buck, boost, buck-boost, Cuk)
- `DC-DC converter DCM_Week 2_For Students.pdf` — PWM DC/DC II (Cuk wrap-up + DCM)
- `ZCS_QRC_Week 3 - For Students.pdf` — ZCS quasi-resonant converters
- `ZVS_QRC_Week 4 - For Students.pdf` — ZVS quasi-resonant converters
- `Isolated DCDC Converters 1_Week 5 - For Students.pdf` — flyback, forward, phase-shift intro

### Cheng reference notes (same weeks)
- `Reference-Week 1-Non-isolated DC-DC Converters in Continuous Mode.pdf`
- `Reference-Week 2-Non-isolated DC-DC Converters in Discontinuous Mode.pdf`
- `Reference-Week 3-Zero-current Switching Quasi-resonant Converters.pdf`
- `Reference-Week 4-Zero-Voltage Switching Quasi-Resonant Converters.pdf`
- `Reference-Week 5-Isolated DCDC Converters 1.pdf`

### Admin (not formula content)
- `EE4007_General Info_2026.pdf` — syllabus, assessment, 13-week plan
- `Midterm Test Arrangement - Sessions 1&2.pdf` — seating/session list only (no questions)

### Missing relative to full syllabus
Weeks 7–13 slides are **not** in `input/`: isolated converters II, rectifiers, inverters/AC–AC, modelling/control, EMI/emerging topologies. The formula collection covers **weeks 1–5 only**, which is the stated Test 1 window.

No past examination papers or homework PDFs were supplied.

## Inferred course title

**EE4007 Advanced Power Electronics**, Department of Electrical and Electronic Engineering, The Hong Kong Polytechnic University. Level 4 specialist elective, 3 credits, 2026/1. Lecturer: Dr. Junwei Liu. Textbook/notes: Cheng, *Classical Switched Mode and Resonant Power Converters*; Mohan/Undeland/Robbins; Masters.

## Inferred topic structure (lecture order)

| Week | Lesson | Topics in `input/` |
|---|---|---|
| 1 | PWM DC/DC I | Buck, boost, buck-boost, Cuk CCM; volt-second; ripple; ratings |
| 2 | PWM DC/DC II | Cuk CCM ratings; DCM gain, \(K\), boundary, DCM ripple/ratings |
| 3 | Resonant I | ZCS-QRC buck/boost/buck-boost; half/full-wave; \(g(\Phi)\) |
| 4 | Resonant II | ZVS-QRC; \(C_j\) loss; dual of ZCS; \(L_r,C_r\) design |
| 5 | Isolated I | Flyback CCM/DCM; forward reset/\(D_{\max}\); two-transistor forward; phase-shifted FB |
| 6 | Test 1 | Open-book, 80 min, weeks 1–5 |
| 7–13 | (no files) | Isolated II, rectifiers, inverters, small-signal control, EMI |

## Recurring exam and exercise concepts (from in-class tutorials + notes)

1. CCM conversion ratio from volt-second balance
2. Buck CCM \(\Delta V_o\) via \(8LC\) or \(f_c/f_s\)
3. Device voltage ratings (especially Cuk \(V_{\mathrm{in}}+V_o\))
4. DCM vs CCM using \(K=2L/(RT_s)\)
5. Critical \(R\) or always-CCM worst-case \(D\) (boost \(4/27\))
6. CCM \(L,C\) design from \(\Delta i_L\), \(\Delta V_o\)
7. ZCS/ZVS boundary \(\Phi=1\) to size \(L_r,C_r\)
8. Full-wave approximation \(g\approx f_s/f_0\)
9. Subtract \(C_j\) from required ZVS \(C_r\)
10. Flyback CCM/DCM identification; DCM \(M=D/\sqrt{K}\) without \(N\)
11. Forward flux reset and transistor overvoltage \(V_{\mathrm{in}}(1+N_1/N_3)\)
12. Phase-shift \(M=N\theta/\pi\)

## Standard notation

| Symbol | Meaning |
|---|---|
| \(V_{\mathrm{in}},V_o\) | DC ports |
| \(D\) | PWM duty |
| \(\delta\) | DCM extra conduction fraction |
| \(K\) | \(2L/(RT_s)\) |
| \(M\) | \(V_o/V_{\mathrm{in}}\) |
| \(\omega_0,f_0,Z_0\) | resonant tank |
| \(\Phi,\alpha,g\) | QRC normalised load, angle, equivalent duty |
| \(L_m,N,N_1{:}N_2{:}N_3\) | magnetising inductance and turns |

Overloaded: \(D\) = duty or diode; \(\Phi\) = QRC load (not flux) except forward \(\Delta\Phi\).

## Proposed / implemented output structure

| File | Section |
|---|---|
| `sources/00_symbols_and_notation.tex` | Symboloversigt |
| `sources/01_pwm_dcdc_ccm.tex` | Week 1 CCM PWM converters |
| `sources/02_pwm_dcdc_dcm.tex` | Week 2 DCM + Cuk exercise |
| `sources/03_zcs_qrc.tex` | Week 3 ZCS-QRC |
| `sources/04_zvs_qrc.tex` | Week 4 ZVS-QRC |
| `sources/05_isolated_dcdc.tex` | Week 5 isolated converters |
| `sources/06_conversion_ratio_lookup.tex` | Cross-topic \(M\) and boundary tables |

## Known uncertainties

- Boost DCM device voltage tables in the student slides / Cheng DCM chapter list switch/diode voltage as \(V_{\mathrm{in}}\). Physically the blocking voltage is \(V_o\); the collection uses \(V_o\) and flags the printed table.
- Flyback CCM/DCM boundary \(K_{\mathrm{crit}}=[(1-D)/N]^2\) is from the week 5 slides (Q1); Cheng writes DCM \(M=D/\sqrt{K}\) with \(L_p\).
- ZCS conversion-ratio integrals are given in closed \(g(\Phi)\) form; numerical \(M(\Phi)\) curves are not reproduced.
- In-class exercise 5 wording (“how much is the load resistance **dropped**” for DCM) conflicts with light-load DCM; recipe uses \(R>R_{\mathrm{crit}}\).
- Weeks 7–13 and any true exam papers are absent: Test 2 / final coverage cannot be verified.
