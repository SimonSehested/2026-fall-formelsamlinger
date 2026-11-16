# Design Document: EE4007 Advanced Power Electronics (APE) Test 2 Formula Collection

**Date:** 2026-11-16  
**Target Event:** EE4007 In-Class Test 2 (Thursday, 19 November 2026)  
**Author / Assistant:** Antigravity  
**Context:** The Hong Kong Polytechnic University, EE4007 Advanced Power Electronics, Lecturer: Dr. Junwei Liu.

---

## 1. Intent and Context

The user is preparing for **Test 2** in EE4007 Advanced Power Electronics on **Thursday, 19 November 2026**.
Dr. Junwei Liu has officially confirmed the exam format:
- **Paper-only open-book:** Students are permitted to bring paper notes, books, and printed slides.
- **Strict electronics ban:** No laptops, tablets, smartwatches, or phones are allowed.
- **Explicit Test 2 Scope:** Only covers **Weeks 5, 7, 8, 9, and 10**. (Week 6 was Test 1; Week 11 is *not* included in Test 2).
- **Previous material:** Weeks 1 to 4 are not directly tested as isolated questions, but foundational concepts (CCM/DCM, switch stress, LC filters, basic buck/boost topologies) underpin Weeks 7–10.

The primary deliverable is a dedicated, compact, physical-print-optimized LaTeX document (`main_test2.tex` compiling to `main_test2.pdf`), paired with an ultra-dense **Weeks 1–4 Foundational Cheat Sheet** appendix and **Quick-Lookup Summary Tables** for instantaneous retrieval in the 60-minute in-class exam.

---

## 2. Goals, Non-Goals, and Anti-Goals

### 2.1 Goals
1. **100% Syllabus Coverage for Test 2:** Complete coverage of Dr. Junwei Liu's lecture slides for:
   - **Week 5 & Week 7 (Isolated DC/DC I & II):** Flyback (CCM & DCM), Forward converter (reset winding, tertiary $N_3$, $D_{\max}$, overvoltage), Two-transistor forward, Overlapping / commutation time $t_{ov}$ due to secondary leakage inductance $L_k$, Phase-Shifted Full-Bridge (PSFB), and Dual-Active-Bridge (DAB: SPS control, power transfer equation, ZVS condition).
   - **Week 8 (AC-DC Rectifiers & PFC):** Uncontrolled and controlled rectifiers (1-phase half/full wave, 3-phase half/full wave), firing angle $\alpha$, conduction angle $\theta$, DC average voltage $V_{dc}$, RMS values, Ripple Factor (RF), Form Factor (FF), Displacement Power Factor (DPF), Distortion Factor (DF), Total Harmonic Distortion (THD), Power Factor ($PF = DPF \times DF$), and Active Boost Power Factor Correction (PFC operating principle, control, inductor sizing).
   - **Week 9 (DC-AC Inverters & AC-AC):** Single-phase VSI (half-bridge and full-bridge), Three-phase VSI (180° and 120° conduction, square-wave), Sinusoidal PWM (SPWM: amplitude modulation ratio $m_a = \hat{V}_{control}/\hat{V}_{tri}$, frequency modulation ratio $m_f = f_s/f_1$), line-to-line output fundamental $V_{LL1,rms} \approx 0.612 m_a V_{DC}$, harmonic spectra, LC filter cutoff selection, Common-Mode (CM) voltage and leakage current, and AC-AC voltage controllers (phase control).
   - **Week 10 (Modeling & Control Part 1):** Six-step state-space averaging (SSA), state vectors $x = [i_L, v_c]^T$, perturbation $x = X + \hat{x}$, DC steady-state operating point $X = -A^{-1}B V_{in}$, small-signal AC model $\dot{\hat{x}} = A\hat{x} + F\hat{d} + B\hat{v}_{in}$, transfer function matrix $(sI-A)^{-1}F$, explicit transfer functions for Buck and Boost converters ($G_{vd}(s), G_{vg}(s), Z_{out}(s)$), and Right-Half-Plane (RHP) zero analysis (physical origin and control challenge).
2. **Weeks 1–4 Quick-Lookup Cheat Sheet:** An ultra-compact 2–3 page appendix summarizing all formulas for Buck, Boost, Buck-Boost, Cuk (CCM and DCM, boundary parameters $K_{crit}$), ZCS-QRC, and ZVS-QRC.
3. **Optimized for Physical Paper Navigation:**
   - Bold keywords and explicit section headers for fast page flipping.
   - Distinct, boxed/highlighted "Exam Recipes" providing step-by-step calculation workflows for common numerical problems.
   - Master conversion ratio and rating tables at the very front/back for 5-second lookups.
4. **Symbol Glossary:** Complete Symboloversigt table specifically for Test 2, detailing every symbol, meaning, and SI unit.
5. **Flawless Compilation:** Produces a clean PDF via standard `pdflatex` without errors or clipping.

### 2.2 Non-Goals
- **Week 11 material (Modeling and Control Part 2):** Feedback compensation circuits (Type I, II, III), Bode plot loop-shaping, and current-mode slope compensation are explicitly excluded from Test 2 per the course announcement. They will be archived for the Final Exam compendium.
- **Proof-heavy lecture derivations:** Lengthy mathematical proofs of steady-state formulas that waste space on physical paper will be omitted in favor of the starting assumptions, final formula, and physical interpretation.

### 2.3 Anti-Goals
- **Bloated page count:** Printing 80 pages of slides is useless in a 60-minute test. The document must be dense, clean, and immediately readable.
- **Ambiguous or conflicting notation:** Avoid using different variable definitions across sections without explicit clarification in the Symboloversigt.

---

## 3. Approaches Considered and Selection

### 3.1 Approaches
- **Approach 1: Full Monolithic Rebuild:** Rebuild the entire semester's formula sheet (Weeks 1–11) into a single document.
  - *Trade-off:* 30+ pages, contains topics not on Test 2 (Week 11) and dilutes the critical Test 2 material.
- **Approach 2: Dedicated Test 2 Compendium + Week 1–4 Foundational Cheat Sheet (Selected):**
  - Create a tailored master file `main_test2.tex` targeting the exact Test 2 scope (Weeks 5, 7, 8, 9, 10).
  - Include an ultra-dense 2–3 page Appendix for Weeks 1–4.
  - *Trade-off:* Perfectly matches the exact exam instructions from Dr. Junwei Liu; minimal physical weight and maximum speed in the exam room.
- **Approach 3: Formula Tables Only:** Purely tabular reference without recipes or explanations.
  - *Trade-off:* Fails when exam questions require multi-step derivations (e.g. state-space averaging matrices or DAB commutation time).

### 3.2 Decision
The user explicitly selected **Approach 2**.

---

## 4. System Architecture and File Structure

### 4.1 Input Files Staging
The new files in `C:\Users\sehes\Downloads\ADVANCED-POWER-ELECTRONICS-2026-Nov-16_05-19-43-769\ADVANCED-POWER-ELECTRONICS-2026-Nov-16_05-19-43-769\viewer\files` will be copied into `Advanced Power Electronics/input/`:
- `Isolated DCDC converters II_Week 7  - For Students.pdf`
- `AC-DC Converters (Rectifiers)_Week 8 - For Students.pdf`
- `DC-AC Converters (Inverters) - Week 9 - For Students.pdf`
- `Modeling and Control 1_Week 10 - For Students.pdf`
- (Week 11 will also be copied to `input/` for future reference, but not included in `main_test2.tex`).

### 4.2 Modular LaTeX Source Files (`Advanced Power Electronics/sources/`)
1. **`main_test2.tex`**:
   - Master LaTeX document with 10pt font, geometry margins (1.5cm), `amsmath`, `amssymb`, `booktabs`, `siunitx`, `hyperref`.
   - Title: *EE4007 Advanced Power Electronics — Test 2 Formula Collection & Exam Reference*.
2. **`00_symbols_and_notation_test2.tex`**:
   - Comprehensive symbol tables for Weeks 5, 7, 8, 9, 10, plus core circuit symbols.
3. **`test2_quick_lookup_tables.tex`**:
   - Placed right after the symbols for immediate exam access:
     - Table 1: Isolated topologies ($M$, switch stress, transformer reset condition).
     - Table 2: Rectifiers ($V_{dc}$, $V_{rms}$, PF, THD formulas for 1-ph/3-ph half/full bridge).
     - Table 3: Inverters ($V_{LL1}$, $m_a, m_f$, carrier harmonics).
     - Table 4: Small-signal models ($A, B, F$ matrices, transfer functions $G_{vd}, G_{vg}, Z_o$).
4. **`05_isolated_dcdc_test2.tex` (Weeks 5 & 7)**:
   - Flyback CCM/DCM: magnetizing inductance $L_m$, volt-second balance, conversion ratios, stress, boundary $K_{crit}$.
   - Forward Converter: reset winding $N_3$, tertiary diode, maximum duty cycle $D_{\max} = 1/(1 + N_3/N_1)$, switch voltage stress $V_{sw} = V_{in}(1 + N_1/N_3)$. Two-transistor forward (automatic clamp to $V_{in}$, $D < 0.5$).
   - Overlapping / Commutation Time: effect of transformer leakage inductance $L_k$ on secondary diodes $D_1, D_2$, linear current ramp $i_{D2}$, derivation of overlapping time $t_{ov} = \frac{I_o L_k}{V_{in} (N_2/N_1)}$, and output voltage drop $\Delta V_o = 2 f_s L_k (N_2/N_1)^2 I_o$.
   - Phase-Shifted Full-Bridge (PSFB): working principle, phase-shift angle $\phi$ (or $\theta$), effective duty $D_{eff} = \theta/\pi$, loss of duty cycle $\Delta D$ due to primary leakage inductance $L_{lk}$.
   - Dual-Active-Bridge (DAB): primary bridge $H_1$, secondary bridge $H_2$, Single-Phase-Shift (SPS) control, phase shift angle $\phi \in [-\pi/2, \pi/2]$, power transmission formula:
     $$P = \frac{V_1 V_2}{2\pi f_s L_k} \phi \left(1 - \frac{|\phi|}{\pi}\right) = \frac{n V_1 V_2}{\omega L_k} \phi \left(1 - \frac{|\phi|}{\pi}\right)$$
     Forward and reverse power flow, peak inductor current, and ZVS soft-switching conditions.
5. **`07_ac_dc_rectifiers.tex` (Week 8)**:
   - Power quality & definitions: $P = V_{rms} I_{rms} \cos \phi$, Apparent power $S = V I$, Reactive power $Q = V I \sin \phi$, Power factor $PF = P/S$.
   - Harmonic distortion: fundamental current $I_{s1}$, RMS current $I_s$, Displacement Power Factor $DPF = \cos \phi_1$, Distortion Factor $DF = I_{s1,rms}/I_{s,rms}$, $THD = \sqrt{(I_s/I_{s1})^2 - 1}$, relationship $PF = DPF \times DF = \frac{DPF}{\sqrt{1 + THD^2}}$.
   - Uncontrolled Diode Rectifiers:
     - 1-phase half-wave: $V_{dc} = \frac{V_m}{\pi} \approx 0.318 V_m$, $V_{rms} = V_m/2$.
     - 1-phase full-wave bridge: $V_{dc} = \frac{2V_m}{\pi} \approx 0.637 V_m$, $V_{rms} = V_m/\sqrt{2}$.
     - 3-phase half-wave: $V_{dc} = \frac{3\sqrt{3}V_m}{2\pi} \approx 0.827 V_m$.
     - 3-phase full-wave bridge (6-pulse): $V_{dc} = \frac{3\sqrt{3}V_{m,ph}}{\pi} = \frac{3 V_{m,LL}}{\pi} \approx 1.35 V_{LL,rms}$.
   - Controlled Rectifiers (SCR / Thyristor):
     - Firing angle $\alpha$, conduction angle $\theta$.
     - 1-phase controlled full-wave: $V_{dc} = \frac{2V_m}{\pi} \cos \alpha$ (continuous current).
     - 3-phase controlled full-bridge: $V_{dc} = \frac{3 V_{m,LL}}{\pi} \cos \alpha \approx 1.35 V_{LL,rms} \cos \alpha$.
     - Inversion mode ($\alpha > 90^\circ$).
   - Boost Power Factor Correction (PFC):
     - Active PFC structure: bridge rectifier + boost converter + inner current loop shaping input current to follow rectified voltage $v_{in}(t) = |V_m \sin \omega t|$.
     - Inductor current ripple and minimum inductance sizing: $L \ge \frac{V_{in}^2 (V_o - \sqrt{2}V_{in})}{f_s \Delta I_L V_o P_o}$.
     - Bulk output capacitor sizing for $100\text{ Hz}$ / $120\text{ Hz}$ ripple: $C_o \ge \frac{P_o}{2\omega_{line} V_o \Delta V_o}$.
6. **`08_dc_ac_inverters.tex` (Week 9)**:
   - Single-Phase Inverters:
     - Half-bridge VSI: $v_o \in \{\pm V_{DC}/2\}$, fundamental amplitude $\hat{V}_{o1} = \frac{2}{\pi} V_{DC} \approx 0.637 V_{DC}$.
     - Full-bridge VSI: $v_o \in \{\pm V_{DC}, 0\}$, fundamental amplitude $\hat{V}_{o1} = \frac{4}{\pi} V_{DC} \approx 1.273 V_{DC}$.
   - Three-Phase Inverters:
     - Six-step operation (180° conduction): phase voltages $v_{an}$, line-to-line voltages $v_{ab}$.
     - Neutral-to-ground voltage $v_{no} = \frac{1}{3}(v_{ao} + v_{bo} + v_{co})$.
     - Line-to-line fundamental: $\hat{V}_{LL1} = \frac{\sqrt{3} \times 4}{\pi \times 2} V_{DC} = \frac{2\sqrt{3}}{\pi} V_{DC} \approx 1.103 V_{DC}$, $V_{LL1,rms} = \frac{\sqrt{6}}{\pi} V_{DC} \approx 0.78 V_{DC}$.
   - Sinusoidal Pulse Width Modulation (SPWM):
     - Modulation parameters: Amplitude modulation ratio $m_a = \frac{\hat{V}_{control}}{\hat{V}_{tri}}$ ($0 \le m_a \le 1$ linear range), Frequency modulation ratio $m_f = \frac{f_s}{f_1}$ (carrier frequency / fundamental).
     - Linear region output:
       - Phase fundamental: $\hat{V}_{an1} = m_a \frac{V_{DC}}{2}$.
       - Line-to-line fundamental: $\hat{V}_{LL1} = \sqrt{3} \hat{V}_{an1} = \frac{\sqrt{3}}{2} m_a V_{DC}$.
       - Line-to-line RMS: $V_{LL1,rms} = \frac{\sqrt{3}}{2\sqrt{2}} m_a V_{DC} \approx 0.612 m_a V_{DC}$.
     - Overmodulation ($m_a > 1$) and transition to square-wave.
     - Harmonic spectrum: harmonics appear at sidebands around carrier frequencies $h = k m_f \pm n$ (triplen harmonics cancel in line-to-line voltages for balanced 3-phase).
   - Inverter Design & Filtering:
     - LC filter design: cutoff frequency $f_c = \frac{1}{2\pi \sqrt{L_f C_f}}$ placed such that $10 f_1 < f_c < \frac{1}{10} f_s$.
     - DC bus link sizing (100 Hz ripple buffer in 1-phase).
     - Common-mode voltage $v_{CM} = \frac{v_{ao} + v_{bo} + v_{co}}{3}$ and parasitic leakage current $i_{leak} \approx C_{parasitic} \frac{dv_{CM}}{dt}$.
   - AC-AC Voltage Controllers: phase-angle control using back-to-back thyristors / triacs, RMS voltage as function of delay angle $\alpha$: $V_{o,rms} = V_s \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$.
7. **`09_modeling_and_small_signal.tex` (Week 10)**:
   - Rationale for Dynamic Modeling: start-up, load steps, line transients cannot be predicted by DC volt-second balance.
   - Six Steps of State-Space Averaging (SSA):
     1. Define state variables $x(t) = [i_L(t), v_c(t)]^T$ and input $u(t) = v_{in}(t)$.
     2. Write linear state equations for Switch ON: $\dot{x} = A_1 x + B_1 u$.
     3. Write linear state equations for Switch OFF: $\dot{x} = A_2 x + B_2 u$.
     4. Average over switching period $T_s$: $\dot{x} = [d A_1 + (1-d)A_2] x + [d B_1 + (1-d)B_2] u$.
     5. Perturb variables: $x = X + \hat{x}$, $u = V_{in} + \hat{v}_{in}$, $d = D + \hat{d}$ where $\hat{x} \ll X, \hat{d} \ll D$.
     6. Linearize: separate DC steady-state $0 = A X + B V_{in}$ and AC small-signal dynamics $\dot{\hat{x}} = A \hat{x} + F \hat{d} + B \hat{v}_{in}$, where:
        $$A = D A_1 + (1-D) A_2,\quad B = D B_1 + (1-D) B_2,\quad F = (A_1 - A_2)X + (B_1 - B_2)V_{in}.$$
   - Transfer Function Matrix:
     Taking Laplace transform with $\hat{v}_{in} = 0$:
     $$\hat{x}(s) = (sI - A)^{-1} F \hat{d}(s).$$
   - Explicit Converter Canonical Transfer Functions:
     - **Buck Converter:**
       $$G_{vd}(s) = \left.\frac{\hat{v}_o(s)}{\hat{d}(s)}\right|_{\hat{v}_{in}=0} = \frac{V_{in}}{L C s^2 + \frac{L}{R} s + 1} = \frac{V_{in}}{1 + \frac{s}{Q\omega_0} + \frac{s^2}{\omega_0^2}},$$
       where $\omega_0 = \frac{1}{\sqrt{LC}}$, $Q = R\sqrt{\frac{C}{L}}$.
     - **Boost Converter:**
       $$G_{vd}(s) = \frac{V_o}{1-D} \frac{1 - s\frac{L}{(1-D)^2 R}}{1 + \frac{L}{(1-D)^2 R} s + \frac{LC}{(1-D)^2} s^2}.$$
     - **Right-Half-Plane (RHP) Zero:**
       $$\omega_{z,RHP} = \frac{(1-D)^2 R}{L}.$$
       *Physical origin:* When duty ratio $D$ steps up, switch stays on longer, temporarily depriving the output of inductor current. Output voltage drops before rising. Phase lag adds $90^\circ$ instead of lead, strictly limiting closed-loop bandwidth to $f_c < \frac{1}{3 \sim 5} f_{z,RHP}$.
     - Audio Susceptibility (Line-to-Output): $G_{vg}(s) = \left.\frac{\hat{v}_o(s)}{\hat{v}_{in}(s)}\right|_{\hat{d}=0}$.
     - Output Impedance: $Z_{out}(s) = \left.\frac{\hat{v}_o(s)}{\hat{\imath}_o(s)}\right|_{\hat{d}=0, \hat{v}_{in}=0}$.
8. **`appendix_weeks1_4_cheatsheet.tex`**:
   - High-density tabular summary of Weeks 1–4:
     - Buck, Boost, Buck-Boost, Cuk CCM formulas: $M(D)$, $\Delta I_L$, $\Delta V_o$, switch and diode voltage/current peak ratings.
     - DCM analysis: $K = \frac{2L}{R T_s}$, $K_{crit}(D)$, $M(D,K)$ for all four non-isolated topologies.
     - Resonant converters: ZCS-QRC (half-wave vs full-wave, characteristic impedance $Z_0 = \sqrt{L_r/C_r}$, resonant frequency $\omega_0 = 1/\sqrt{L_r C_r}$, normalized load parameter $\Phi = I_o Z_0/V_{in}$, boundary $\Phi \le 1$).
     - ZVS-QRC (dual of ZCS, $\Phi = V_{in}/(I_o Z_0) \le 1$, junction capacitance $C_j$ absorption $C_r = C_{r,req} - C_j$).
9. **`reports/` Updates**:
   - `coverage_report.md`: Updated to document Test 2 coverage across Weeks 5, 7, 8, 9, 10.
   - `exam_task_taxonomy.md`: Catalog of typical exam calculation problems for Test 2.

---

## 5. What is Left to the Builder

The builder (implementation subagent / planner) has full authority over:
1. Exact LaTeX macro definitions for boxing exam recipes (e.g. `mdframed` or standard `fbox`/`quote` with zero dependencies).
2. Spacing optimizations to ensure tables fit smoothly across page breaks without ugly page overflows.
3. Verification of arithmetic consistency in slide examples (such as Dr. Junwei Liu's 3-phase SPWM numerical example: 380V RMS line-to-line, 50 Hz, determining required $V_{DC}$).

---

## 6. Verification Plan

1. **Compilation Check:** Run `pdflatex -interaction=nonstopmode main_test2.tex` and ensure zero errors and valid PDF generation.
2. **Formula Cross-Check:** Verify every equation against the corresponding slide in `Isolated DCDC converters II_Week 7  - For Students.pdf`, `AC-DC Converters (Rectifiers)_Week 8 - For Students.pdf`, `DC-AC Converters (Inverters) - Week 9 - For Students.pdf`, and `Modeling and Control 1_Week 10 - For Students.pdf`.
3. **Symbol Consistency:** Ensure all new symbols are defined in `00_symbols_and_notation_test2.tex`.
4. **Physical Readability Audit:** Check PDF layout, page counts, table column alignment, and contrast.
