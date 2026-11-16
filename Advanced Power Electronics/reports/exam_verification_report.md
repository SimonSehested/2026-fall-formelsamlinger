# Exam Verification Report — EE4007 Advanced Power Electronics (Test 2)

## Verification Context & Methodology
This report audits the analytical recipes, numerical lecture examples, and verification problems included in the **EE4007 Test 2 Formula Collection** (`main_test2.pdf`).

Verification is performed by mapping lecture tutorial problems, homework problems, and textbook reference derivations from Weeks 5, 7, 8, 9, 10, and foundational Weeks 1–4 to their exact section and formula in `main_test2.pdf`.

---

## Detailed Task & Lecture Example Verification Matrix

| Week / Source | Topic / Lecture Problem | Archetype | Fast Solution Method | Formula Sheet Location | Verification Status |
|---|---|---|---|---|---|
| **Week 5 Q1** | Flyback CCM Condition & Boundary | T1 | $K_{crit} = (1-D)^2 / N^2$; check $K > K_{crit}$ | Section 3.2, p. 10 | VERIFIED |
| **Week 5 Q2** | Flyback Numerical Design ($50\text{ kHz}, 100\,\mu\text{H}, 50\,\Omega, D=0.5, N=2$) | T1 | $K = 2 L_m f_s / R$; calculate $V_o, I_{in}, \hat{I}_{sw}, \hat{I}_D, \Delta V_o$ | Section 3.7, Recipe 1, p. 18 | VERIFIED |
| **Week 5 Notes** | Forward Tertiary Core Reset ($N_1, N_3$) | T2 | $D_{max} = \frac{N_1}{N_1 + N_3}$; $\hat{V}_{sw} = V_{in}(1 + N_1/N_3)$ | Section 3.3, p. 12 | VERIFIED |
| **Week 7 Lecture** | Two-Transistor Forward Reset & Stresses | T2 | Clamping diodes limit $\hat{V}_{sw} = V_{in}$; requires $D \le 0.5$ | Section 3.3.2, p. 13 | VERIFIED |
| **Week 7 Lecture** | Transformer Leakage Overlap Drop ($t_{ov}$) | T2 | $t_{ov} = \frac{L_k I_o}{V_s}$; $\Delta V_o = f_s L_k I_o$ (single-ended); $\Delta D = \frac{4 f_s L_{lk} I_o}{n V_{in}}$ | Section 3.4, p. 14 | VERIFIED |
| **Week 7 Lecture** | PSFB Duty Cycle Loss & ZVS Bounds | T3 | $\Delta D = \frac{4 f_s L_{lk} I_o}{n V_{in}}$; $D_{eff} = D - \Delta D$ | Section 3.5, p. 15 | VERIFIED |
| **Week 7 Lecture** | DAB Bidirectional Power Flow vs Phase Shift $\phi$ | T4 | $P = \frac{V_1 V_2'}{\omega L_k} \phi (1 - \frac{|\phi|}{\pi})$; peak at $\phi = \pi/2$ | Section 3.6, p. 16 | VERIFIED |
| **Week 8 Lecture** | 1-Phase Diode & SCR Bridge Rectifier | T5 | $V_{dc} = \frac{2 V_m}{\pi} \cos\alpha$; source inductance drop $\frac{2 \omega L_s I_d}{\pi}$ | Section 4.3, p. 25 | VERIFIED |
| **Week 8 Lecture** | 3-Phase 6-Pulse Bridge Rectifier | T5 | $V_{dc} = \frac{3\sqrt{2} V_{LL}}{\pi}\cos\alpha \approx 1.35 V_{LL}\cos\alpha$ | Section 4.4, p. 28 | VERIFIED |
| **Week 8 Lecture** | Rectifier Power Quality (DPF, DF, THD, PF) | T6 | $I_{s1} = \frac{\sqrt{6}}{\pi} I_d$; $DF = 3/\pi \approx 0.955$; $THD = 31.08\%$ | Section 4.2, p. 22 | VERIFIED |
| **Week 8 Lecture** | Active Boost PFC Sizing ($L$ and $C_{dc}$) | T7 | $L = \frac{V_o}{4 f_s \Delta I_{L,max}}$; $C_{dc} = \frac{P_o}{2\omega V_o \Delta V_o}$ | Section 4.5, p. 30 | VERIFIED |
| **Week 9 Lecture** | Three-Phase 6-Step Inverter Harmonics | T8 | $V_{LL,1} = \frac{\sqrt{6}}{\pi} V_{dc}$; $V_{ph,1} = \frac{\sqrt{2}}{\pi} V_{dc}$; $h = 6k \pm 1$ | Section 5.3, p. 39 | VERIFIED |
| **Week 9 Lecture** | Linear SPWM Fundamental & Harmonics | T9 | $\hat{V}_{LL,1} = m_a \frac{\sqrt{3}}{2} V_{dc}$; sidebands around $m_f f_1$ | Section 5.4, p. 40 | VERIFIED |
| **Week 9 Lecture** | Inverter Output LC Filter Sizing | T11 | $10 f_1 < f_c < \frac{1}{5} f_{sw}$; $Q_C \le 0.05 S_{rated}$ | Section 5.6, p. 44 | VERIFIED |
| **Week 9 Lecture** | Inverter DC-Bus $2\omega$ Energy Decoupling | T12 | $\tilde{p}(t) = -P_o \cos(2\omega t)$; $C_{dc} = \frac{P_o}{2\omega V_{dc} \Delta V_{dc}}$ | Section 5.7, p. 45 | VERIFIED |
| **Week 9 Lecture** | Single-Phase AC-AC Controller (R and R-L) | T13 | $V_{o,rms} = V_s \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$; $\alpha \ge \phi$ constraint | Section 5.8, p. 46 | VERIFIED |
| **Week 10 Lecture**| State-Space Averaging 6-Step Method | T14 | Formulate $A_1, B_1, A_2, B_2$; average $A = D A_1 + D' A_2$ | Section 6.2, p. 51 | VERIFIED |
| **Week 10 Lecture**| DC Steady-State State Vector Solution | T14 | $X = -A^{-1} B V_{in}$ via matrix inversion | Section 6.2.3, p. 52 | VERIFIED |
| **Week 10 Lecture**| Small-Signal Perturbation & AC Equations | T15 | $\dot{\hat{x}} = A \hat{x} + B \hat{v}_{in} + B_d \hat{d}$; resolvent $(sI - A)^{-1}$ | Section 6.3, p. 53 | VERIFIED |
| **Week 10 Lecture**| Buck Control-to-Output Transfer Function | T15 | $G_{vd}(s) = \frac{V_{in}}{s^2 L C + s \frac{L}{R} + 1}$ | Section 6.4, p. 54 | VERIFIED |
| **Week 10 Lecture**| Boost Control-to-Output & RHP Zero | T16 | $\omega_{z,RHP} = \frac{(1-D)^2 R}{L}$; bandwidth limit $f_c \le \frac{1}{3 \sim 5} f_{z,RHP}$ | Section 6.5 & 6.6, pp. 56–58 | VERIFIED |
| **Appendix W1–2**  | Non-Isolated PWM Converters (Buck, Boost, etc.) | T17 | $K = \frac{2L}{R T_s}$; $K_{crit}$ boundary lookup; ripple sizing | Section 7.1 & 7.2, p. 65 | VERIFIED |
| **Appendix W3–4**  | Resonant QRC Converters (ZCS/ZVS) | T17 | $\Phi = \frac{I_o Z_0}{V_{in}} \le 1$ (ZCS); $\Phi = \frac{V_{in}}{I_o Z_0} \le 1$ (ZVS); $C_r - C_j$ | Section 7.3, p. 66 | VERIFIED |

---

## Physical Print & PDF Compilation Audit
- **Compilation Engine:** pdfTeX 3.141592653-2.6-1.40.28 (MiKTeX 25.12).
- **Two-Pass Compilation:** Resolved all cross-references, TOC entries, and equation labels cleanly. Exit code 0.
- **Auditor Script:** `Advanced Power Electronics/scripts/audit_test2_pdf.py` executed cleanly with 0 assertion failures.
- **Dimensions:** Exactly A4 ($595.28\text{ pt} \times 841.89\text{ pt}$) on all 67 pages.
- **Bookmarks:** 57 entries, strictly ordered and verified against document outlines.
- **Printability:** High-contrast text, clear mathematical notation with `amsmath`/`amssymb`, structured tables with `booktabs`, SI units formatted via `siunitx`.
