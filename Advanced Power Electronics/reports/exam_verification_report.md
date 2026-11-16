# Exam verification report — EE4007 Advanced Power Electronics

No past exam papers are in `input/`. Verification uses every **in-class tutorial / Q** in the week 1–5 student slides, plus Cheng isolated-converter results that the slides state without algebra.

Assessment context (`EE4007_General Info_2026.pdf`): Test 1 week 6, open-book, 80 min, after Lesson 5. Final exam 60%, closed-book, 3 h — later topics not in the present `input/` set.

| Source | Problem | Problem type | Fast method | Covered in section | Missing recipe? |
|---|---|---|---|---|---|
| Week 1 tutorial | Buck \(\Delta V_o\) at \(D=0.5\) | T2 CCM ripple | \(V_o=DV_{\mathrm{in}}\), \(f_c\), \(\Delta V_o/V_o=(1-D)\pi^2/2\,(f_c/f_s)^2\) | `01` Exam recipe: buck CCM output ripple; `06` ripple table | No |
| Week 1 tutorial | Sketch \(\Delta V_o(D)\) for \(0.1\ldots 0.9\) | T2 | \(\Delta V_o\propto(1-D)D\) at fixed \(V_{\mathrm{in}}\) | `01` same recipe + trap that \(\Delta V_o\) falls as \(D\) rises | No |
| Week 2 ex. 1 | Cuk voltage ratings | T3 | \(D=t_{\mathrm{on}}f_s\), \(V_o=DV_{\mathrm{in}}/(1-D)\), switch/diode/\(C_1\) see \(V_{\mathrm{in}}+V_o\) | `01` Exam recipe: Cuk CCM voltage ratings | No |
| Week 2 ex. 2 | Buck critical \(R\) for DCM | T4 | \(D=V_o/V_s\), \(K=1-D\), \(R=2Lf_s/K\) | `02` Exam recipe: critical \(R\) for buck DCM | No |
| Week 2 ex. 3 | Boost always-CCM min \(I_o\) / max \(R\) | T4 | max of \(D(1-D)^2\) is \(4/27\) at \(D=1/3\) | `02` Exam recipe: always-CCM boost | No |
| Week 2 ex. 4 | Buck-boost CCM \(L,C\) design | T6 | \(D=V_o/(V_{\mathrm{in}}+V_o)\), \(L\) from \(\Delta i_L\), \(C\) from \(I_oDT_s/\Delta V_o\) | `02` Exam recipe: design \(L\) and \(C\) | No |
| Week 2 ex. 5(i) | Buck-boost DCM onset \(R\) | T4 | \(K_{\mathrm{crit}}=(1-D)^2\); DCM for \(R>R_{\mathrm{crit}}\) | `02` Exam recipe: buck-boost DCM onset | No (slide wording “dropped” flagged) |
| Week 2 ex. 5(ii) | DCM \(\Delta V_o\) expression | T5 | \(\delta T_s(\Delta i_L-I_o)^2/(2C\Delta i_L)\) | `02` same recipe + DCM ripple formula | No |
| Week 3 tutorial | FW ZCS-QR buck \(L_r,C_r\) at boundary | T7 | \(Z_0=V_s/I_o\), \(f_0\approx f_s/M\), \(L_r,C_r\) from \(Z_0,\omega_0\) | `03` Exam recipe: full-wave ZCS-QR buck | No |
| Week 3 tutorial | \(L_r\) ESR loss | T7 | \(P=I_{Lr,\mathrm{rms}}^2 R_{\mathrm{esr}}\) | `03` same recipe step 4 | Qualitative rms; waveform sketch not in notes as a closed formula |
| Week 4 intro | \(C_j\) loss at \(300\,\mathrm{V}\), \(1\,\mathrm{MHz}\), \(500\,\mathrm{pF}\) | T8 | \(\tfrac12 C V^2 f_s=22.5\,\mathrm{W}\) | `04` junction-capacitor loss | No |
| Week 4 tutorial | ZVS-QR buck \(L_r,C_r\), subtract \(C_j\) | T8 | \(Z_0=V_{\mathrm{in}}/I_o\), \(M=1-f_s/f_0\), \(C_{\mathrm{ext}}=C_r-C_j\) | `04` Exam recipe: ZVS-QR buck at boundary | No |
| Week 5 Q1 | Flyback CCM condition | T9 | \(K>(1-D)^2/N^2\) | `05` Exam recipe: flyback CCM or DCM | No |
| Week 5 Q2 | Flyback numbers (mode, \(V_o\), \(I_{\mathrm{in}}\), \(\Delta V_o\), peaks, \(L_m\) for DCM) | T9 | Compare \(K\) to \(K_{\mathrm{crit}}\); CCM or DCM formulae | `05` same recipe | No |
| Week 5 (notes) | Forward \(D_{\max}\), \(v_T\) | T10 | \(D_R=(N_3/N_1)D\le 1-D\) | `05` Exam recipe: forward reset | No |
| Cheng 5.3.6 | Forward DCM gain | T10 | buck DCM shape \(\times N_2/N_1\) | `05` Forward DCM | Formula present (from notes, not a numbered student Q) |
| Cheng 5.4–5.5 | Two-transistor forward; PSFB \(N\theta/\pi\) | T10 | lookup | `05` + `06` | No numerical exercise in student slides |
| Admin PDF | Midterm session list | — | not a problem | — | N/A |
| — | Weeks 7–13 / final exam | rectifiers, inverters, control, EMI | no source | **not covered** | Yes — no slides |

## Symboloversigt check

- `sources/00_symbols_and_notation.tex` exists and is the first `\input` in `main.tex`.
- Port voltages, \(D,\delta,K,M\), tank \(L_r,C_r,\omega_0,Z_0,\Phi,\alpha,g\), transformer \(N,N_1{:}N_2{:}N_3\), ripples, and rms subscripts are listed with units.
- Overloaded \(D\) (duty vs diode) and \(\Phi\) (QRC vs forward flux) are noted.
- Constants: \(\mu_0\); energy identities \(\tfrac12 LI^2\), \(\tfrac12 CV^2\).

## Compile

`pdflatex main.tex` succeeds (`main.pdf`, 17 pages). Remaining messages are hyperref PDF-bookmark warnings on keyword lines and a few overfull `\hbox` on long keyword headings — not errors.

## Residual gaps (need more `input/` to close)

- Isolated converters II, AC/DC, DC/AC, modelling/control, EMI.
- Actual Test 1 / Test 2 / final scripts.
- Closed-form \(I_{Lr,\mathrm{rms}}\) for the week 3 ESR-loss part (notes leave the waveform approximation to the student).
