# EE4007 Advanced Power Electronics (APE) Test 2 Formula Collection Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a complete, physical-print-optimized LaTeX formula collection and exam quick-reference guide (`main_test2.tex` compiling to `main_test2.pdf`) for EE4007 Test 2 covering Weeks 5, 7, 8, 9, and 10, accompanied by a 2–3 page foundational Weeks 1–4 cheat sheet.

**Architecture:** A modular LaTeX architecture rooted in `Advanced Power Electronics/` with dedicated `.tex` files per lecture topic in `sources/`, an up-front symbol glossary and master quick-lookup tables, step-by-step "Exam Recipes", and an appendix for Weeks 1–4. The build compiles with standard `pdflatex` into an error-free, high-density PDF suitable for printed paper use in an open-book exam without electronic devices.

**Tech Stack:** LaTeX (`pdflatex`, `geometry`, `amsmath`, `amssymb`, `booktabs`, `siunitx`, `hyperref`), Python (`pypdf` for slide verification), PowerShell / Git.

**Spec:** [docs/superpowers/specs/2026-11-16-ape-test2-formelsamling-design.md](file:///c:/Users/sehes/GitHub/2026-fall-formelsamlinger/docs/superpowers/specs/2026-11-16-ape-test2-formelsamling-design.md)

## Global Constraints

- Exam date: Thursday 19 November 2026; paper-only open-book (no electronic devices).
- Scope: Weeks 5, 7, 8, 9, 10 strictly. (Week 11 is excluded from Test 2).
- Source material: Dr. Junwei Liu's lecture slides and notes in `viewer/files` and `Advanced Power Electronics/input/`.
- Working directory for LaTeX compilation: `Advanced Power Electronics/`.
- Typography: 10pt article, 1.5 cm margins, `booktabs` tables, SI units, compact display equations.
- Every display math symbol must appear in the Symbol Glossary.

## Review Focus

1. **Overlapping time in forward converter:** Secondary diode commutation formula $t_{ov} = \frac{I_o L_k}{V_{in}(N_2/N_1)}$ and average voltage drop $\Delta V_o = 2 f_s L_k (N_2/N_1)^2 I_o$ must match slide definitions.
2. **DAB power equation:** Single-phase-shift power $P = \frac{V_1 V_2}{2\pi f_s L_k}\phi(1 - |\phi|/\pi)$ and phase angle bounds $[-\pi/2, \pi/2]$.
3. **SPWM 3-phase line-to-line RMS voltage:** $V_{LL1,rms} = \frac{\sqrt{3}}{2\sqrt{2}} m_a V_{DC} \approx 0.612 m_a V_{DC}$ in linear range ($m_a \le 1$).
4. **Boost converter Right-Half-Plane (RHP) zero:** Frequency $\omega_{z,RHP} = \frac{(1-D)^2 R}{L}$ and negative phase contribution correctly derived.
5. **PDF compilation clean:** No missing package errors, zero undefined references, and no catastrophic overfull `\hbox`.

---

### Task 1: Staging Input Files & Directory Setup

**Files:**
- Create/Copy: `Advanced Power Electronics/input/Isolated DCDC converters II_Week 7  - For Students.pdf`
- Create/Copy: `Advanced Power Electronics/input/AC-DC Converters (Rectifiers)_Week 8 - For Students.pdf`
- Create/Copy: `Advanced Power Electronics/input/DC-AC Converters (Inverters) - Week 9 - For Students.pdf`
- Create/Copy: `Advanced Power Electronics/input/Modeling and Control 1_Week 10 - For Students.pdf`
- Create/Copy: `Advanced Power Electronics/input/Modeling and Control 2_Week 11 - For Students.pdf`

**Interfaces:**
- Consumes: Files in `C:\Users\sehes\Downloads\ADVANCED-POWER-ELECTRONICS-2026-Nov-16_05-19-43-769\ADVANCED-POWER-ELECTRONICS-2026-Nov-16_05-19-43-769\viewer\files`
- Produces: Verified files in `Advanced Power Electronics/input/` ready for reference and verification.

- [ ] **Step 1: Copy new lecture PDFs from download path to input folder**

Copy files using PowerShell `Copy-Item`.

- [ ] **Step 2: Verify all 5 new PDFs exist in `Advanced Power Electronics/input/`**

Run: `Get-ChildItem -Path "Advanced Power Electronics/input" -Filter "*Week*"`
Expected: Weeks 1, 2, 3, 4, 5, 7, 8, 9, 10, 11 present.

- [ ] **Step 3: Commit staged input files or log status**

Commit message: `chore: stage weeks 7-11 lecture slides into input/`

---

### Task 2: Master LaTeX Architecture (`main_test2.tex`) & Symbols (`sources/00_symbols_and_notation_test2.tex`)

**Files:**
- Create: `Advanced Power Electronics/main_test2.tex`
- Create: `Advanced Power Electronics/sources/00_symbols_and_notation_test2.tex`

**Interfaces:**
- Consumes: Symbol definitions and notation from Weeks 5, 7, 8, 9, 10 slides.
- Produces: Compilable LaTeX root file importing modular sources.

- [ ] **Step 1: Write `sources/00_symbols_and_notation_test2.tex`**

Include three-column tables (`Symbol`, `Meaning / Course Terminology`, `SI Unit`) grouped by:
1. Circuit & Component Quantities ($V_{in}, V_o, I_o, L_m, L_k, N_1, N_2, N_3$).
2. AC-DC Rectifier & Power Quality Symbols ($V_m, \alpha, \theta, V_{dc}, I_{s1}, DPF, DF, THD, PF$).
3. DC-AC Inverter & SPWM Symbols ($m_a, m_f, f_s, f_1, V_{LL1}, v_{no}, v_{CM}, i_{leak}, C_{parasitic}$).
4. Dynamic Modeling & Control Symbols ($x, u, d, X, D, U, \hat{x}, \hat{d}, \hat{u}, A_1, A_2, B_1, B_2, A, B, F, G_{vd}(s), G_{vg}(s), Z_{out}(s), \omega_{z,RHP}$).

- [ ] **Step 2: Write `main_test2.tex`**

Document preamble with `\documentclass[10pt,a4paper]{article}`, `geometry[margin=1.5cm]`, `amsmath,amssymb`, `booktabs`, `siunitx`, `hyperref`, customized titles, and structured `\input{...}` calls.

- [ ] **Step 3: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Output `main_test2.pdf` generated with exit code 0.

- [ ] **Step 4: Commit**

```bash
git add "Advanced Power Electronics/main_test2.tex" "Advanced Power Electronics/sources/00_symbols_and_notation_test2.tex"
git commit -m "feat(ape): add main_test2.tex and Test 2 symbol glossary"
```

---

### Task 3: Test 2 Quick-Lookup Summary Tables (`sources/test2_quick_lookup_tables.tex`)

**Files:**
- Create: `Advanced Power Electronics/sources/test2_quick_lookup_tables.tex`
- Modify: `Advanced Power Electronics/main_test2.tex` (input `test2_quick_lookup_tables`)

**Interfaces:**
- Consumes: Formulas and conversion ratios from Weeks 5, 7, 8, 9, 10.
- Produces: 2-page physical lookup reference placed immediately after the symbols for rapid retrieval during the test.

- [ ] **Step 1: Draft `sources/test2_quick_lookup_tables.tex`**

Include:
- **Table 1: Isolated Topologies:** Topology, $M(D,\phi)$, Switch Blocking Voltage, Diode Blocking Voltage, Notes/Reset.
- **Table 2: AC-DC Rectifiers:** 1-ph Half, 1-ph Full Bridge, 3-ph Half, 3-ph Full (6-pulse); Diode vs Thyristor $V_{dc}(\alpha)$; $I_{rms}$; $PF$ & $THD$ relations.
- **Table 3: DC-AC Inverters:** Square-wave vs SPWM; 1-phase vs 3-phase; Fundamental peak and RMS equations; Harmonic order $k m_f \pm n$.
- **Table 4: Dynamic Modeling & SSA:** Matrix definitions ($A, B, F$); Buck & Boost $G_{vd}(s), G_{vg}(s), Z_{out}(s)$ and RHP zero frequency.

- [ ] **Step 2: Input in `main_test2.tex` and test compile**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles cleanly, tables render without overflowing page margins.

- [ ] **Step 3: Commit**

```bash
git add "Advanced Power Electronics/sources/test2_quick_lookup_tables.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add master quick-lookup tables for Test 2"
```

---

### Task 4: Isolated DC/DC Converters I & II (`sources/05_isolated_dcdc_test2.tex`) (Weeks 5 & 7)

**Files:**
- Create: `Advanced Power Electronics/sources/05_isolated_dcdc_test2.tex`
- Modify: `Advanced Power Electronics/main_test2.tex`

**Interfaces:**
- Consumes: Week 5 and Week 7 lecture slides (`Isolated DCDC Converters 1_Week 5`, `Isolated DCDC converters II_Week 7`).
- Produces: Complete section on Flyback, Forward (single & two-transistor), Overlapping time $t_{ov}$, Phase-shifted full-bridge, and DAB.

- [ ] **Step 1: Write Flyback & Forward converter sections**

- Flyback CCM & DCM: volt-second balance, magnetizing inductance $L_m$, $M = \frac{N D}{1-D}$, peak currents $\hat{\imath}_p, \hat{\imath}_s$, DCM boundary $K_{crit} = [(1-D)/N]^2$, DCM gain $M = \frac{D}{\sqrt{K}}$.
- Forward converter: tertiary reset winding $N_3$, flux reset condition $\Delta \Phi = 0$, maximum duty cycle $D_{\max} = \frac{1}{1 + N_3/N_1}$, switch stress $V_{sw} = V_{in}(1 + N_1/N_3)$.
- Two-transistor forward: operation, automatic reset via clamp diodes to $V_{in}$, switch stress clamped to $V_{in}$, $D < 0.5$.

- [ ] **Step 2: Write Overlapping Time & Commutation section**

- Cause: Transformer leakage inductance $L_k$ on secondary.
- During turn-on: Secondary diode $D_1$ cannot turn off instantly; $D_2$ current rises with rate $\frac{di_{D2}}{dt} = \frac{V_s}{L_k} = \frac{V_{in}(N_2/N_1)}{L_k}$.
- Overlapping time formula:
  $$t_{ov} = \frac{I_o L_k}{V_{in}(N_2/N_1)}.$$
- Output voltage drop due to commutation overlap:
  $$\Delta V_o = \left(\frac{N_2}{N_1}\right) V_{in} \frac{t_{ov}}{T_s} = 2 f_s L_k \left(\frac{N_2}{N_1}\right)^2 I_o.$$
- Effective output voltage: $V_o = \left(\frac{N_2}{N_1}\right) D V_{in} - \Delta V_o$.

- [ ] **Step 3: Write Phase-Shifted Full-Bridge & Dual-Active-Bridge (DAB) sections**

- Phase-Shifted Full-Bridge: Phase shift $\theta$ or $\phi$, duty cycle loss $\Delta D = \frac{4 f_s L_{lk} I_o}{n V_{in}}$, effective duty $D_{eff} = D - \Delta D$.
- Dual-Active-Bridge (DAB):
  - Primary bridge $H_1$, secondary bridge $H_2$, high-frequency transformer with leakage inductance $L_k$.
  - Single-Phase-Shift (SPS) control: phase shift angle $\phi$ between primary and secondary AC square waves.
  - Power transmission formula:
    $$P = \frac{V_1 V_2}{2\pi f_s L_k} \phi \left(1 - \frac{|\phi|}{\pi}\right) = \frac{n V_1 V_2}{\omega L_k} \phi \left(1 - \frac{|\phi|}{\pi}\right), \quad \phi \in [-\pi/2, \pi/2].$$
  - Maximum power at $\phi = \pi/2$: $P_{\max} = \frac{\pi V_1 V_2}{8 \omega L_k}$.
  - Forward power flow ($\phi > 0$) vs reverse power flow ($\phi < 0$).
  - ZVS soft-switching criteria for primary and secondary bridge switches.

- [ ] **Step 4: Add step-by-step Exam Recipes**

- Recipe 1: Sizing Forward converter reset winding $N_3$ and determining $D_{\max}$ and switch voltage rating.
- Recipe 2: Calculating commutation overlapping time $t_{ov}$ and output voltage loss in Forward converter.
- Recipe 3: Calculating required phase shift angle $\phi$ for specified power transfer in DAB.

- [ ] **Step 5: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles with 0 errors.

- [ ] **Step 6: Commit**

```bash
git add "Advanced Power Electronics/sources/05_isolated_dcdc_test2.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add isolated DC-DC converters chapter (flyback, forward, overlapping, DAB)"
```

---

### Task 5: AC-DC Rectifiers & Power Factor Correction (`sources/07_ac_dc_rectifiers.tex`) (Week 8)

**Files:**
- Create: `Advanced Power Electronics/sources/07_ac_dc_rectifiers.tex`
- Modify: `Advanced Power Electronics/main_test2.tex`

**Interfaces:**
- Consumes: Week 8 lecture slides (`AC-DC Converters (Rectifiers)_Week 8`).
- Produces: Comprehensive chapter on rectifiers, harmonic distortion, PF, and Boost PFC.

- [ ] **Step 1: Write Power Factor & Harmonics foundation**

- Instantaneous power $p(t) = v(t) i(t)$, average active power $P = V_s I_{s1} \cos \phi_1$.
- Apparent power $S = V_{rms} I_{rms}$, Reactive power $Q = V_s I_{s1} \sin \phi_1$, Power triangle.
- Harmonic quantities:
  - Displacement Power Factor: $DPF = \cos \phi_1$.
  - Distortion Factor: $DF = \frac{I_{s1,rms}}{I_{s,rms}}$.
  - Total Harmonic Distortion: $THD = \sqrt{\frac{I_{s,rms}^2 - I_{s1,rms}^2}{I_{s1,rms}^2}} = \sqrt{\left(\frac{1}{DF}\right)^2 - 1}$.
  - True Power Factor: $PF = \frac{P}{S} = DPF \times DF = \frac{\cos \phi_1}{\sqrt{1 + THD^2}}$.
  - Form Factor $FF = V_{rms}/V_{dc}$, Ripple Factor $RF = \frac{\sqrt{V_{rms}^2 - V_{dc}^2}}{V_{dc}} = \sqrt{FF^2 - 1}$.

- [ ] **Step 2: Write Uncontrolled & Controlled Rectifier Topologies**

- 1-Phase Half-Wave: Diode $V_{dc} = \frac{V_m}{\pi}$, $V_{rms} = \frac{V_m}{2}$. Thyristor with firing angle $\alpha$: $V_{dc} = \frac{V_m}{2\pi}(1 + \cos \alpha)$ (resistive load), conduction angle $\theta = \pi - \alpha$.
- 1-Phase Full-Wave Bridge: Diode $V_{dc} = \frac{2V_m}{\pi} \approx 0.637 V_m$, $V_{rms} = \frac{V_m}{\sqrt{2}}$. Controlled bridge (continuous current): $V_{dc} = \frac{2V_m}{\pi} \cos \alpha$. PIV ratings $= V_m$.
- 3-Phase Half-Wave (3-pulse): Diode $V_{dc} = \frac{3\sqrt{3}V_{m,ph}}{2\pi} \approx 0.827 V_{m,ph}$. Controlled: $V_{dc} = \frac{3\sqrt{3}V_{m,ph}}{2\pi} \cos \alpha$.
- 3-Phase Full-Wave Bridge (6-pulse): Diode $V_{dc} = \frac{3 V_{m,LL}}{\pi} = \frac{3\sqrt{2}}{\pi} V_{LL,rms} \approx 1.35 V_{LL,rms}$. Controlled: $V_{dc} = \frac{3 V_{m,LL}}{\pi} \cos \alpha \approx 1.35 V_{LL,rms} \cos \alpha$.
- Inverter mode: When $\alpha > 90^\circ$ and DC side has active source, $V_{dc} < 0$, power flows from DC to AC.

- [ ] **Step 3: Write Active Boost Power Factor Correction (PFC)**

- Circuit topology: Diode bridge + Boost converter ($L_{pfc}, S, D_{pfc}, C_o$).
- Operating principle: Inner current loop forces average input current $i_{in}(t)$ to be in phase and proportional to $|v_{ac}(t)| = V_m |\sin \omega t|$.
- Inductor sizing equation:
  $$L \ge \frac{V_{in}^2 (V_o - \sqrt{2}V_{in})}{f_s \Delta I_L V_o P_o}.$$
- Bulk output capacitor sizing for double-line-frequency ($2\omega_{line} = 100\text{ Hz}$ or $120\text{ Hz}$) ripple:
  $$C_o \ge \frac{P_o}{2 \omega_{line} V_o \Delta V_o}.$$

- [ ] **Step 4: Add Exam Recipes**

- Recipe 1: Calculating $DPF, DF, THD$, and true $PF$ from Fourier current components.
- Recipe 2: Determining firing angle $\alpha$ to achieve desired DC load voltage or active power.
- Recipe 3: Sizing PFC boost inductor $L$ and output filter capacitor $C_o$.

- [ ] **Step 5: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles with 0 errors.

- [ ] **Step 6: Commit**

```bash
git add "Advanced Power Electronics/sources/07_ac_dc_rectifiers.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add AC-DC rectifiers and power factor correction chapter"
```

---

### Task 6: DC-AC Inverters & AC-AC Regulators (`sources/08_dc_ac_inverters.tex`) (Week 9)

**Files:**
- Create: `Advanced Power Electronics/sources/08_dc_ac_inverters.tex`
- Modify: `Advanced Power Electronics/main_test2.tex`

**Interfaces:**
- Consumes: Week 9 lecture slides (`DC-AC Converters (Inverters) - Week 9`).
- Produces: Complete chapter on single/three-phase VSIs, SPWM, harmonic spectrum, filter design, and AC-AC controllers.

- [ ] **Step 1: Write Single-Phase & Three-Phase Inverter Topologies**

- 1-Phase Half-Bridge VSI: $v_o \in \{\pm V_{DC}/2\}$, split DC capacitors, fundamental amplitude $\hat{V}_{o1} = \frac{2}{\pi} V_{DC}$.
- 1-Phase Full-Bridge VSI: $v_o \in \{\pm V_{DC}, 0\}$, fundamental amplitude $\hat{V}_{o1} = \frac{4}{\pi} V_{DC} \approx 1.273 V_{DC}$, $V_{o1,rms} = \frac{2\sqrt{2}}{\pi} V_{DC} \approx 0.90 V_{DC}$.
- 3-Phase VSI (180° conduction): phase voltages $v_{an}$, line-to-line voltages $v_{ab} = v_{an} - v_{bn}$, neutral-to-ground voltage $v_{no} = \frac{1}{3}(v_{ao} + v_{bo} + v_{co})$.
- Line-to-line square-wave fundamental: $\hat{V}_{LL1} = \frac{2\sqrt{3}}{\pi} V_{DC} \approx 1.103 V_{DC}$, $V_{LL1,rms} = \frac{\sqrt{6}}{\pi} V_{DC} \approx 0.78 V_{DC}$.

- [ ] **Step 2: Write Sinusoidal Pulse Width Modulation (SPWM)**

- Definitions:
  - Carrier wave: triangle $v_{tri}$ with amplitude $\hat{V}_{tri}$ and frequency $f_s$.
  - Control wave: sinusoidal $v_{control}$ with amplitude $\hat{V}_{control}$ and frequency $f_1$.
  - Amplitude modulation ratio: $m_a = \frac{\hat{V}_{control}}{\hat{V}_{tri}}$.
  - Frequency modulation ratio: $m_f = \frac{f_s}{f_1}$ (select odd integer, multiple of 3 for 3-phase).
- Linear Modulation Region ($0 \le m_a \le 1$):
  - Phase fundamental peak: $\hat{V}_{an1} = m_a \frac{V_{DC}}{2}$.
  - Line-to-line fundamental peak: $\hat{V}_{LL1} = \sqrt{3} \hat{V}_{an1} = \frac{\sqrt{3}}{2} m_a V_{DC}$.
  - Line-to-line fundamental RMS:
    $$V_{LL1,rms} = \frac{\hat{V}_{LL1}}{\sqrt{2}} = \frac{\sqrt{3}}{2\sqrt{2}} m_a V_{DC} \approx 0.612 m_a V_{DC}.$$
  - Required DC link voltage: $V_{DC} = \frac{V_{LL1,rms}}{0.612 m_a}$.
- Overmodulation ($m_a > 1$) and transition to square wave ($m_a \to \infty$).
- Harmonic spectrum: Harmonics appear at carrier sidebands $h = k m_f \pm n$. Triplen harmonics ($3rd, 9th, \dots$) cancel in line-to-line voltages.

- [ ] **Step 3: Write Filter Sizing, Parasitics & AC-AC Controllers**

- Output low-pass filter (LC): Cutoff frequency $f_c = \frac{1}{2\pi \sqrt{L_f C_f}}$. Placement rule: $10 f_1 < f_c < \frac{1}{10} f_s$.
- Common-Mode voltage: $v_{CM} = \frac{v_{ao} + v_{bo} + v_{co}}{3}$, leakage current $i_{leak} \approx C_{parasitic} \frac{dv_{CM}}{dt}$.
- AC-AC Voltage Controllers: Back-to-back thyristors / Triac. Firing angle $\alpha$, RMS load voltage $V_{o,rms} = V_s \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$.

- [ ] **Step 4: Add Exam Recipes**

- Recipe 1: Dr. Junwei Liu's Test Problem: Sizing required $V_{DC}$ and carrier frequency $f_s$ for a 3-phase SPWM inverter supplying $380\text{ V}_{rms}$ line-to-line at $50\text{ Hz}$.
- Recipe 2: Output LC filter selection for SPWM inverters to attenuate carrier frequency harmonics.
- Recipe 3: Calculating AC-AC controller output RMS voltage and power factor.

- [ ] **Step 5: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles with 0 errors.

- [ ] **Step 6: Commit**

```bash
git add "Advanced Power Electronics/sources/08_dc_ac_inverters.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add DC-AC inverters, SPWM, and AC-AC controllers chapter"
```

---

### Task 7: Dynamic Modeling & Small-Signal Analysis (`sources/09_modeling_and_small_signal.tex`) (Week 10)

**Files:**
- Create: `Advanced Power Electronics/sources/09_modeling_and_small_signal.tex`
- Modify: `Advanced Power Electronics/main_test2.tex`

**Interfaces:**
- Consumes: Week 10 lecture slides (`Modeling and Control 1_Week 10`).
- Produces: Complete chapter on State-Space Averaging, small-signal models, canonical circuits, transfer functions, and RHP zeros.

- [ ] **Step 1: Write State-Space Averaging (SSA) 6-Step Method**

- Detailed breakdown of each step:
  1. State definition $x = [i_L, v_c]^T$, input $u = v_{in}$.
  2. Switch ON state: $\dot{x} = A_1 x + B_1 u$.
  3. Switch OFF state: $\dot{x} = A_2 x + B_2 u$.
  4. Time-averaging over $T_s$: $\dot{x} = [d A_1 + (1-d)A_2] x + [d B_1 + (1-d)B_2] u$.
  5. Small-signal perturbation: $x = X + \hat{x}, d = D + \hat{d}, u = V_{in} + \hat{v}_{in}$.
  6. Separation of DC steady-state and AC small-signal dynamics:
     - DC equation: $0 = A X + B V_{in} \implies X = -A^{-1} B V_{in}$.
     - AC small-signal equation: $\dot{\hat{x}} = A \hat{x} + F \hat{d} + B \hat{v}_{in}$, where:
       $$A = D A_1 + (1-D) A_2, \quad B = D B_1 + (1-D) B_2, \quad F = (A_1 - A_2)X + (B_1 - B_2)V_{in}.$$

- [ ] **Step 2: Derive Laplace Transfer Function Matrix**

- $\hat{x}(s) = (sI - A)^{-1} F \hat{d}(s) + (sI - A)^{-1} B \hat{v}_{in}(s)$.
- Characteristic equation: $\det(sI - A) = 0$.
- Transfer functions:
  - Control-to-output: $G_{vd}(s) = \left.\frac{\hat{v}_o(s)}{\hat{d}(s)}\right|_{\hat{v}_{in}=0}$.
  - Line-to-output (audio susceptibility): $G_{vg}(s) = \left.\frac{\hat{v}_o(s)}{\hat{v}_{in}(s)}\right|_{\hat{d}=0}$.
  - Control-to-inductor current: $G_{id}(s) = \left.\frac{\hat{\imath}_L(s)}{\hat{d}(s)}\right|_{\hat{v}_{in}=0}$.
  - Output impedance: $Z_{out}(s) = \left.\frac{\hat{v}_o(s)}{\hat{\imath}_o(s)}\right|_{\hat{d}=0, \hat{v}_{in}=0}$.

- [ ] **Step 3: Explicit Buck and Boost Converter Transfer Functions**

- **Buck Converter:**
  - Matrices: $A_1 = \begin{bmatrix} 0 & -1/L \\ 1/C & -1/(RC) \end{bmatrix}$, $A_2 = A_1$, $B_1 = \begin{bmatrix} 1/L \\ 0 \end{bmatrix}$, $B_2 = \begin{bmatrix} 0 \\ 0 \end{bmatrix}$.
  - Averaged: $A = A_1$, $B = D B_1$, $F = B_1 V_{in} = \begin{bmatrix} V_{in}/L \\ 0 \end{bmatrix}$.
  - Transfer function:
    $$G_{vd}(s) = \frac{V_{in}}{L C s^2 + \frac{L}{R} s + 1} = \frac{V_{in}}{1 + \frac{s}{Q\omega_0} + \frac{s^2}{\omega_0^2}},$$
    where $\omega_0 = \frac{1}{\sqrt{LC}}$, $Q = R\sqrt{\frac{C}{L}}$. Two left-half plane conjugate poles, NO right-half plane zero.
- **Boost Converter:**
  - Matrices: $A_1 = \begin{bmatrix} 0 & 0 \\ 0 & -1/(RC) \end{bmatrix}$, $A_2 = \begin{bmatrix} 0 & -1/L \\ 1/C & -1/(RC) \end{bmatrix}$, $B_1 = B_2 = \begin{bmatrix} 1/L \\ 0 \end{bmatrix}$.
  - Averaged: $A = \begin{bmatrix} 0 & -(1-D)/L \\ (1-D)/C & -1/(RC) \end{bmatrix}$, $F = \begin{bmatrix} V_o/L \\ -I_L/C \end{bmatrix}$.
  - Steady state: $X = \begin{bmatrix} I_L \\ V_o \end{bmatrix} = \begin{bmatrix} \frac{V_{in}}{(1-D)^2 R} \\ \frac{V_{in}}{1-D} \end{bmatrix}$.
  - Transfer function:
    $$G_{vd}(s) = \frac{V_o}{1-D} \frac{1 - s \frac{L}{(1-D)^2 R}}{1 + \frac{L}{(1-D)^2 R} s + \frac{LC}{(1-D)^2} s^2}.$$
  - **Right-Half-Plane (RHP) Zero:**
    $$\omega_{z,RHP} = \frac{(1-D)^2 R}{L} \quad\Rightarrow\quad f_{z,RHP} = \frac{(1-D)^2 R}{2\pi L}.$$
  - Physical origin of RHP zero: Step increase in $d$ keeps switch ON longer; inductor energy builds up, but diode remains reverse biased; output capacitor alone supplies load, so $v_o$ momentarily dips before rising.
  - Control impact: Adds positive magnitude slope ($+20\text{ dB/decade}$) like a standard zero, but adds $-90^\circ$ phase lag like a pole! Imposes hard constraint on crossover frequency: $f_c < \frac{1}{3 \sim 5} f_{z,RHP}$.

- [ ] **Step 4: Add Exam Recipes**

- Recipe 1: Six-step procedure to derive state-space matrices from any switching schematic.
- Recipe 2: Calculating DC operating point $(I_L, V_o)$ from $-A^{-1}B V_{in}$.
- Recipe 3: Calculating Boost converter RHP zero frequency and closed-loop bandwidth limit.

- [ ] **Step 5: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles with 0 errors.

- [ ] **Step 6: Commit**

```bash
git add "Advanced Power Electronics/sources/09_modeling_and_small_signal.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add dynamic modeling and small-signal analysis chapter"
```

---

### Task 8: Weeks 1–4 Foundational Cheat Sheet (`sources/appendix_weeks1_4_cheatsheet.tex`)

**Files:**
- Create: `Advanced Power Electronics/sources/appendix_weeks1_4_cheatsheet.tex`
- Modify: `Advanced Power Electronics/main_test2.tex`

**Interfaces:**
- Consumes: Key formulas from existing `sources/01` through `04` in `Advanced Power Electronics/`.
- Produces: High-density 2–3 page appendix covering foundational non-isolated and resonant converters.

- [ ] **Step 1: Write Weeks 1–2 Non-Isolated PWM Converters summary**

- CCM: Buck ($V_o/V_{in}=D$), Boost ($1/(1-D)$), Buck-Boost ($-D/(1-D)$), Cuk ($-D/(1-D)$).
- Inductor current ripple $\Delta I_L$, Capacitor voltage ripple $\Delta V_o$.
- Device voltage and current stresses (Transistor $\hat{V}_{sw}$, Diode $\hat{V}_D$, $\hat{I}$).
- DCM: Dimensionless conduction parameter $K = \frac{2L}{R T_s}$, critical parameter $K_{crit}(D)$:
  - Buck: $K_{crit} = 1-D$.
  - Boost: $K_{crit} = D(1-D)^2$ (worst case $4/27$ at $D=1/3$).
  - Buck-Boost & Cuk: $K_{crit} = (1-D)^2$.
  - DCM voltage ratios $M(D,K)$.

- [ ] **Step 2: Write Weeks 3–4 Resonant QRC Converters summary**

- Resonant tank: Characteristic impedance $Z_0 = \sqrt{L_r/C_r}$, resonant frequency $\omega_0 = 1/\sqrt{L_r C_r}$, $f_0 = \omega_0 / (2\pi)$.
- ZCS-QRC: Normalized load $\Phi = \frac{I_o Z_0}{V_{in}}$. Soft switching condition: $\Phi \le 1$. Half-wave vs full-wave ($M \approx f_s/f_0$).
- ZVS-QRC: Dual load parameter $\Phi = \frac{V_{in}}{I_o Z_0} \le 1$. Junction capacitance absorption: $C_r = C_{r,calc} - C_j$.

- [ ] **Step 3: Test compilation**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Compiles with 0 errors.

- [ ] **Step 4: Commit**

```bash
git add "Advanced Power Electronics/sources/appendix_weeks1_4_cheatsheet.tex" "Advanced Power Electronics/main_test2.tex"
git commit -m "feat(ape): add weeks 1-4 foundational cheat sheet appendix"
```

---

### Task 9: Complete Document Verification, Reports & Physical Print Audit

**Files:**
- Modify: `Advanced Power Electronics/reports/coverage_report.md`
- Modify: `Advanced Power Electronics/reports/exam_task_taxonomy.md`
- Modify: `Advanced Power Electronics/reports/exam_verification_report.md`
- Output: `Advanced Power Electronics/main_test2.pdf`

**Interfaces:**
- Consumes: All written source files and slide contents.
- Produces: Fully audited and verified PDF and markdown reports documenting coverage.

- [ ] **Step 1: Run two-pass compilation of `main_test2.tex`**

Run: `cd "Advanced Power Electronics"; pdflatex -interaction=nonstopmode main_test2.tex; pdflatex -interaction=nonstopmode main_test2.tex`
Expected: Table of contents resolved, page numbers correct, exit code 0.

- [ ] **Step 2: Verify page count and layout using Python pypdf**

Write a quick script to inspect the generated `main_test2.pdf` (page count, outlines, ensure no broken symbols or missing fonts).

- [ ] **Step 3: Update coverage and verification reports in `reports/`**

Document full coverage of Weeks 5, 7, 8, 9, 10 and the Week 1–4 appendix.

- [ ] **Step 4: Commit final documents**

```bash
git add "Advanced Power Electronics/reports/" "Advanced Power Electronics/main_test2.pdf"
git commit -m "docs(ape): update coverage and exam verification reports for Test 2"
```
