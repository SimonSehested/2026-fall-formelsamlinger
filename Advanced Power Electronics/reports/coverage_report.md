# Coverage Report — EE4007 Advanced Power Electronics (Test 2)

## Document Metadata & Build Status
- **Target Document:** `Advanced Power Electronics/main_test2.pdf`
- **Source Root:** `Advanced Power Electronics/main_test2.tex`
- **Compilation Engine:** pdfTeX 3.141592653-2.6-1.40.28 (MiKTeX 25.12)
- **Compilation Mode:** Two-pass non-stop mode (`pdflatex -interaction=nonstopmode main_test2.tex`)
- **Compilation Result:** 0 fatal errors, 0 undefined references, 0 broken citations.
- **Page Count:** 67 pages (A4 portrait: 595.28 pt $\times$ 841.89 pt across 100% of pages).
- **Date:** November 2026.

---

## Course & Assessment Scope

### Institution & Syllabus Context
- **Course:** EE4007 Advanced Power Electronics, Department of Electrical and Electronic Engineering, The Hong Kong Polytechnic University (PolyU).
- **Target Assessment:** Midterm Test 2 (Weeks 5, 7, 8, 9, 10 + Foundational Weeks 1–4 Recall).
- **Assessment Format:** Open-book, 80 minutes, calculator permitted. High-intensity numerical problem-solving and rapid topology identification.

### Scope Demarcation & Syllabus Boundary
- **Core Test 2 Modules:**
  1. **Weeks 5 & 7:** Isolated DC-DC Converters (Flyback, Forward tertiary reset, two-transistor forward, commutation overlap $t_{ov}$, Phase-Shifted Full-Bridge [PSFB], Dual-Active-Bridge [DAB]).
  2. **Week 8:** AC-DC Converters (Rectifiers) & Active Power Factor Correction (1-phase and 3-phase, diode and SCR, Fourier harmonics, power quality metrics PF/DPF/DF/THD, active Boost PFC).
  3. **Week 9:** DC-AC Converters (Inverters) & AC-AC Controllers (1-phase and 3-phase VSI, six-step operation, SPWM linear and overmodulation, triplen harmonic cancellation, common-mode voltage, output LC filter design, 2-omega DC-bus energy decoupling, AC-AC voltage controllers).
  4. **Week 10:** Dynamic Modeling & Small-Signal Analysis (State-Space Averaging 6-step method, perturbation and linearization, steady-state $X = -A^{-1}B V_{in}$, small-signal AC equation, open-loop transfer functions $G_{vd}(s)$ and $G_{vg}(s)$ for Buck, Boost, and Buck-Boost, Right-Half-Plane [RHP] zero derivation, physics, and control bandwidth limits).
  5. **Appendix (Weeks 1–4 Foundational Cheat Sheet):** High-density rapid-lookup coverage of non-isolated PWM converters in CCM and DCM (Buck, Boost, Buck-Boost, Cuk, ripple formulas, device stress, $K$ and $K_{crit}$ boundaries) and Resonant Quasi-Resonant Converters (ZCS-QRC and ZVS-QRC tank sizing, $\Phi$ boundary, switch capacitance absorption).
- **Explicit Exclusion of Week 11:**
  - Per official course announcement and syllabus schedule, **Week 11 material is strictly excluded from Test 2**.
  - Week 11 in the master syllabus covers Resonant DC-DC / LLC resonant converters or advanced electromagnetic compatibility (EMI) / closed-loop compensator design beyond the scope of Test 2.
  - Test 2 covers material through Week 10 only.

---

## Detailed Topic Coverage Matrix

| Week / Section | Source Topics & Lecture Slides | Key Formulas & Analytical Models Covered | Verified Document Location |
|---|---|---|---|
| **Front Matter** | Notation, units, cross-topic lookup tables | Standard symbols, subscripts, physical constants ($\mu_0, \epsilon_0$), conversion ratio tables for all converters | `sources/00_symbols_and_notation_test2.tex`<br>`sources/test2_quick_lookup_tables.tex` (pp. 3–9) |
| **Weeks 5 & 7** | Isolated DC-DC Converters I & II | **Flyback:** CCM $M = \frac{N D}{1-D}$, DCM $M = \frac{D}{\sqrt{K}}$, boundary $K_{crit} = \frac{(1-D)^2}{N^2}$, $I_{sw,pk}, I_{D,pk}, \Delta V_o$.<br>**Forward:** Tertiary winding reset $D_{max} = \frac{N_1}{N_1 + N_3}$, switch voltage stress $V_{sw,pk} = V_{in}(1 + N_1/N_3)$, two-transistor forward clamping to $V_{in}$ with $D_{max} \le 0.5$.<br>**Commutation Overlap:** Secondary leakage inductance overlap $t_{ov} = \frac{L_k I_o}{V_s}$, output voltage drop $\Delta V_o = f_s L_k I_o = V_s \frac{t_{ov}}{T_s}$ (single-ended forward; factor of 2 for bridge/push-pull).<br>**PSFB:** Effective duty $D_{eff} = D - \Delta D$, duty cycle loss $\Delta D = \frac{4 f_s L_{lk} I_o}{n V_{in}}$, lagging vs leading leg ZVS criteria.<br>**DAB:** Single phase-shift power flow $P = \frac{V_1 V_2'}{\omega L_k} \phi (1 - \frac{|\phi|}{\pi})$, peak power at $\phi = \frac{\pi}{2}$, zero-voltage switching bounds. | `sources/05_isolated_dcdc_test2.tex` (pp. 9–21) |
| **Week 8** | AC-DC Converters & PFC | **Power Quality:** RMS $I_s = \sqrt{I_{s1}^2 + \sum I_{sh}^2}$, Displacement Factor $DPF = \cos\phi_1$, Distortion Factor $DF = I_{s1}/I_s$, $THD = \sqrt{(1/DF)^2 - 1}$, $PF = DPF \times DF$.<br>**1-Phase Rectifiers:** Half-wave diode/SCR ($V_{dc} = \frac{V_m}{\pi}(1+\cos\alpha)$), Full-wave bridge/center-tapped ($V_{dc} = \frac{2 V_m}{\pi}\cos\alpha$, $I_{s1} = \frac{2\sqrt{2}}{\pi} I_d$, $DF = \frac{2\sqrt{2}}{\pi} \approx 0.900$, $THD = 48.3\%$).<br>**3-Phase Rectifiers:** 3-pulse ($V_{dc} = \frac{3\sqrt{3}V_m}{2\pi}\cos\alpha$), 6-pulse bridge ($V_{dc} = \frac{3\sqrt{2}V_{LL}}{\pi}\cos\alpha \approx 1.35 V_{LL}\cos\alpha$, $I_{s1} = \frac{\sqrt{6}}{\pi} I_d$, $DF = \frac{3}{\pi} \approx 0.955$, $THD = 31.08\%$).<br>**Commutation Overlap:** $\cos(\alpha+\mu) = \cos\alpha - \frac{2\omega L_s I_d}{\sqrt{2}V_s}$, DC voltage drop $\Delta V_{dc} = \frac{m \omega L_s I_d}{\pi}$.<br>**Active Boost PFC:** Average inductor current $\bar{i}_L(t) = \frac{\sqrt{2}P_o}{\eta V_{ac,rms}} |\sin\omega t|$, inductor sizing for ripple ratio, bulk capacitor sizing for $2\omega$ ripple $\Delta V_o = \frac{P_o}{2\omega C V_o}$ and hold-up time $C = \frac{2 P_o t_{hold}}{V_o^2 - V_{min}^2}$. | `sources/07_ac_dc_rectifiers.tex` (pp. 22–36) |
| **Week 9** | DC-AC Inverters & AC-AC Controllers | **Topologies:** 1-Phase half-bridge ($\pm V_{dc}/2$) vs full-bridge ($\pm V_{dc}, 0$).<br>**Three-Phase 6-Step:** Line-to-line fundamental $V_{LL,1} = \frac{\sqrt{6}}{\pi} V_{dc} \approx 0.78 V_{dc}$, line-to-neutral $V_{ph,1} = \frac{\sqrt{2}}{\pi} V_{dc} \approx 0.45 V_{dc}$. 180° vs 120° conduction.<br>**SPWM:** $m_a = \hat{V}_{ctrl}/\hat{V}_{tri}$, $m_f = f_{tri}/f_{ctrl}$. Linear range ($m_a \le 1$): 1-phase half-bridge $\hat{V}_{Ao,1} = m_a \frac{V_{dc}}{2}$; full-bridge $\hat{V}_{o,1} = m_a V_{dc}$; 3-phase line-to-line $\hat{V}_{LL,1} = m_a \frac{\sqrt{3}}{2} V_{dc}$. Overmodulation ($1 < m_a \le 3.24$) and square-wave limit ($m_a \to \infty$).<br>**Triplen Harmonics:** Odd multiples of 3 ($h = 3, 9, 15, \dots$) cancel completely in balanced 3-phase line-to-line voltages and neutral lines.<br>**Common-Mode Voltage:** $v_{CM} = \frac{v_{An} + v_{Bn} + v_{Cn}}{3}$, high $dv/dt$ steps causing motor bearing damage.<br>**Output LC Filter:** Cutoff frequency $10 f_{fund} < f_c < \frac{1}{5} f_{sw}$, $f_c = \frac{1}{2\pi\sqrt{L_f C_f}}$, capacitor reactive power limit $Q_C \le 0.05 P_{nom}$.<br>**DC-Bus Decoupling:** 2-omega power pulsation $p(t) = P_o - P_o\cos(2\omega t)$, DC-link ripple $\Delta V_{dc} = \frac{P_o}{\omega C_{dc} V_{dc}}$.<br>**AC-AC Controllers:** Phase-angle control, R load $V_{o,rms} = V_s\sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$, R-L load extinction angle $\beta$, triggering constraint $\alpha \ge \phi$. | `sources/08_dc_ac_inverters.tex` (pp. 36–50) |
| **Week 10** | Dynamic Modeling & Small-Signal Analysis | **6-Step SSA Procedure:** State selection $x = [i_L, v_C]^T$, subinterval matrices $(A_1, B_1, C_1, D_1)$ and $(A_2, B_2, C_2, D_2)$, averaging $A = D A_1 + D' A_2$, $B = D B_1 + D' B_2$.<br>**DC Operating Point:** $X = -A^{-1} B V_{in}$, $Y = (C - D A^{-1} B) V_{in}$.<br>**Small-Signal AC Model:** $\dot{\hat{x}} = A \hat{x} + B \hat{v}_{in} + [(A_1 - A_2) X + (B_1 - B_2) V_{in}] \hat{d}$.<br>**Transfer Functions:** Laplace resolvent $(sI - A)^{-1}$, control-to-output $G_{vd}(s) = C(sI - A)^{-1} B_d + D_d$, line-to-output $G_{vg}(s) = C(sI - A)^{-1} B + D$.<br>**Buck Converter:** $G_{vd}(s) = \frac{V_{in}}{s^2 L C + s \frac{L}{R} + 1}$, $\omega_0 = \frac{1}{\sqrt{LC}}$, $Q = R\sqrt{\frac{C}{L}}$.<br>**Boost Converter:** $G_{vd}(s) = \frac{V_{in}}{(1-D)^2} \frac{1 - s \frac{L}{(1-D)^2 R}}{s^2 \frac{LC}{(1-D)^2} + s \frac{L}{(1-D)^2 R} + 1}$.<br>**Right-Half-Plane (RHP) Zero:** $\omega_{z,RHP} = \frac{(1-D)^2 R}{L} \Rightarrow f_{z,RHP} = \frac{(1-D)^2 R}{2\pi L}$. Physical cause: inductor charging delays energy delivery to output; $v_o$ momentarily dips before rising. Phase lag $-90^\circ$ combined with $+20\text{ dB/dec}$ gain rise. Bandwidth limit $f_c \le \frac{1}{3 \sim 5} f_{z,RHP}$. | `sources/09_modeling_and_small_signal.tex` (pp. 50–64) |
| **Appendix** | Weeks 1–4 Foundational Cheat Sheet | **Non-Isolated CCM/DCM:** Buck, Boost, Buck-Boost, Cuk conversion ratios, ripple formulas ($\Delta I_L, \Delta V_o$), switch and diode peak stresses, dimensionless parameter $K = \frac{2L}{R T_s}$, critical values $K_{crit}$ (Buck: $1-D$; Boost: $D(1-D)^2$, max $4/27$; Buck-Boost/Cuk: $(1-D)^2$).<br>**Resonant QRC:** Tank impedance $Z_0 = \sqrt{L_r/C_r}$, $\omega_0 = 1/\sqrt{L_r C_r}$. ZCS-QRC parameter $\Phi = \frac{I_o Z_0}{V_{in}} \le 1$. ZVS-QRC parameter $\Phi = \frac{V_{in}}{I_o Z_0} \le 1$. Switch capacitance absorption $C_{r,ext} = C_r - C_j$. | `sources/appendix_weeks1_4_cheatsheet.tex` (pp. 65–67) |

---

## PDF Verification & Structural Audit Summary

The physical print audit was conducted using the automated Python script `Advanced Power Electronics/scripts/audit_test2_pdf.py` powered by `pypdf`:

1. **Page Geometry Audit:**
   - Evaluated all 67 pages for standard ISO 216 A4 dimensions ($595.28\text{ pt} \times 841.89\text{ pt}$).
   - **Result:** 100% compliant. Zero orientation shifts, zero margin blowouts.

2. **Bookmark & Navigation Hierarchy:**
   - 57 bookmarks extracted across 2 hierarchical levels (L0 and L1).
   - Top-level chapters (L0) verified in strictly monotonic page order:
     - Symboloversigt & Notation (Test 2): Page 3
     - Test 2 Quick-Lookup Reference Tables: Page 7
     - Isolated DC/DC Converters (Weeks 5 & 7): Page 9
     - AC-DC Converters (Rectifiers) & Power Factor Correction (Week 8): Page 22
     - DC-AC Converters (Inverters) & AC-AC Controllers (Week 9): Page 36
     - Dynamic Modeling & Small-Signal Analysis (Week 10): Page 50
     - Foundational Cheat Sheet: Weeks 1–4 (CCM, DCM & QRC): Page 65

3. **Content Density & Typographical Metrics:**
   - Total character count: 143,387 characters.
   - Average character density per page: 2,140.1 characters.
   - Maximum density: 4,275 characters (high-density quick-lookup tables).
   - Minimum density: 184 characters (front title page).
   - Zero blank or orphan pages detected.

4. **Technical Keyword Audit:**
   - Verified positive presence and occurrence density of all critical analytical terms:
     - Flyback (9), Forward (17), Commutation overlap (10), PSFB (7), DAB (19).
     - Rectifiers (20), THD (41), DPF / Displacement (7), PFC (23), Boost PFC (9).
     - Inverter (31), SPWM (36), Overmodulation (3), Triplen harmonics (9), Common-mode voltage (8), AC-AC controllers (13).
     - State-space averaging (4), Perturbation (20), Transfer function (17), RHP zero (79).
     - CCM (41), DCM (41), ZCS (14), ZVS (31).
