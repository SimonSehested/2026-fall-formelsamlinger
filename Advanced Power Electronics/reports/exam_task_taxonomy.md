# Exam Task Taxonomy — EE4007 Advanced Power Electronics (Test 2)

This taxonomy catalogs the recurring calculation patterns, problem archetypes, exam traps, and fast solution recipes for **EE4007 Test 2** (Weeks 5, 7, 8, 9, 10 + Foundational Weeks 1–4).

---

## T1 — Flyback Converter Analysis & Mode Identification (Weeks 5 & 7)

- **Exam Wording:** Determine operating mode (CCM or DCM); calculate output voltage $V_o$; input current $I_{in}$; peak switch current $\hat{I}_{sw}$; peak diode current $\hat{I}_D$; output voltage ripple $\Delta V_o$; critical magnetizing inductance $L_{m,crit}$.
- **Keywords:** Flyback, magnetizing inductance $L_m$, turns ratio $N = N_s/N_p$, dimensionless parameter $K = \frac{2 L_m}{R T_s}$, boundary parameter $K_{crit}$.
- **Governing Formulas:**
  - CCM conversion ratio: $M = \frac{V_o}{V_{in}} = N \frac{D}{1-D}$.
  - Boundary condition: $K_{crit} = \frac{(1-D)^2}{N^2}$.
    - If $K > K_{crit}$: CCM.
    - If $K < K_{crit}$: DCM.
  - DCM conversion ratio: $M = \frac{V_o}{V_{in}} = \frac{D}{\sqrt{K}}$ (independent of turns ratio $N$ when $K$ uses primary inductance).
  - Peak switch current: $\hat{I}_{sw} = \bar{I}_{in} + \frac{\Delta I_m}{2}$ (CCM), or $\hat{I}_{sw} = \frac{V_{in} D T_s}{L_m}$ (DCM).
  - Peak secondary diode current: $\hat{I}_D = \frac{\hat{I}_{sw}}{N}$.
  - Peak switch voltage stress: $\hat{V}_{sw} = V_{in} + \frac{V_o}{N}$.
  - Peak diode reverse voltage stress: $\hat{V}_D = N V_{in} + V_o$.
  - Output capacitor voltage ripple: $\Delta V_o = \frac{I_o D T_s}{C} = \frac{V_o D T_s}{R C}$.
- **Fast Solution Recipe:**
  1. Calculate $K = 2 L_m f_s / R$.
  2. Compute nominal CCM duty cycle $D = \frac{V_o}{N V_{in} + V_o}$ (or use given $D$).
  3. Evaluate $K_{crit} = (1-D)^2 / N^2$. Compare $K$ to $K_{crit}$.
  4. If CCM: use $V_o = V_{in} N \frac{D}{1-D}$.
  5. If DCM: use $V_o = V_{in} \frac{D}{\sqrt{K}}$.
- **Common Exam Traps:**
  - Forgetting the turns ratio $N$ in the switch voltage stress ($V_{in} + V_o/N$).
  - Incorrectly including $N$ in the standard DCM gain formula $M = D/\sqrt{K}$ when $K$ is referred to primary $L_m$.
  - Thinking increasing $L_m$ pushes converter into DCM (increasing $L_m$ increases $K$, pushing it into CCM!).

---

## T2 — Forward Converter Reset, Voltage Stress & Commutation Overlap (Weeks 5 & 7)

- **Exam Wording:** Find maximum allowable duty ratio $D_{max}$; peak switch voltage stress $\hat{V}_{sw}$; output voltage drop $\Delta V_o$ due to leakage inductance; commutation overlapping time $t_{ov}$.
- **Keywords:** Forward converter, tertiary demagnetizing winding $N_3$, primary winding $N_1$, secondary winding $N_2$, transformer leakage inductance $L_l$, commutation overlap.
- **Governing Formulas:**
  - Core reset volt-second balance: $V_{in} D T_s \le V_{in} \frac{N_1}{N_3} D_R T_s$ with $D + D_R \le 1$.
  - Maximum duty ratio: $D_{max} = \frac{N_1}{N_1 + N_3}$.
    - Symmetrical winding ($N_1 = N_3$): $D_{max} = 0.5$.
  - Peak switch voltage stress: $\hat{V}_{sw} = V_{in} \left(1 + \frac{N_1}{N_3}\right)$.
    - For $N_1 = N_3$: $\hat{V}_{sw} = 2 V_{in}$.
  - Two-Transistor Forward converter: Clamped by clamping diodes directly to $V_{in}$ ($\hat{V}_{sw} = V_{in}$); requires $D_{max} \le 0.5$.
  - Commutation overlap time: $t_{ov} = \frac{L_k I_o}{V_s}$ (where $V_s = V_{in}(N_2/N_1)$ is secondary transformer voltage; single-ended forward).
  - Output voltage drop due to leakage inductance: $\Delta V_o = f_s L_k I_o = V_s \frac{t_{ov}}{T_s}$ (secondary referred $L_k$; note: factor of 2 applies to full-bridge/push-pull).
  - Real conversion ratio with overlap: $V_o = n D V_{in} - \Delta V_o$.
- **Fast Solution Recipe:**
  1. Identify turns ratio $N_1, N_2, N_3$.
  2. Compute $D_{max} = N_1 / (N_1 + N_3)$ and check if operating $D \le D_{max}$.
  3. Determine switch voltage stress: $\hat{V}_{sw} = V_{in}(1 + N_1/N_3)$.
  4. If transformer leakage $L_k$ is given, calculate commutation time $t_{ov} = \frac{L_k I_o}{V_s}$ and deduct $\Delta V_o = f_s L_k I_o$ from ideal secondary average voltage.
- **Common Exam Traps:**
  - Assuming $D_{max} = 0.5$ without checking whether $N_3 = N_1$.
  - Forgetting that the freewheeling diode $D_2$ and forward diode $D_1$ both conduct simultaneously during the commutation overlap interval $t_{ov}$, shorting the secondary and clamping $v_s = 0$.

---

## T3 — Phase-Shifted Full-Bridge (PSFB) Converter (Weeks 5 & 7)

- **Exam Wording:** Calculate effective duty cycle $D_{eff}$; duty cycle loss $\Delta D$; secondary output voltage $V_o$; condition for ZVS in leading and lagging legs.
- **Keywords:** Phase-Shifted Full Bridge, phase shift angle $\phi$, duty cycle loss $\Delta D$, primary leakage inductance $L_{lk}$, resonant transition, ZVS.
- **Governing Formulas:**
  - Duty cycle loss: $\Delta D = \frac{4 f_s L_{lk} I_o}{n V_{in}}$, where $n = N_s/N_p$.
  - Effective duty cycle: $D_{eff} = D - \Delta D = \frac{\phi}{\pi} - \Delta D$.
  - Output voltage: $V_o = n V_{in} D_{eff} = n V_{in} \left(\frac{\phi}{\pi} - \frac{4 f_s L_{lk} I_o}{n V_{in}}\right)$.
  - Leading leg ZVS energy condition: $\frac{1}{2} (L_{lk} + n^2 L_f) I_{p,pk}^2 \ge \frac{1}{2} (2 C_{oss}) V_{in}^2$ (easily achieved by reflected filter inductor).
  - Lagging leg ZVS energy condition: $\frac{1}{2} L_{lk} I_{p,pk}^2 \ge \frac{1}{2} (2 C_{oss}) V_{in}^2$ (difficult at light load because output filter inductor is disconnected during freewheeling).
- **Fast Solution Recipe:**
  1. Determine primary reflected load current: $I_p' = I_o / n$.
  2. Compute duty cycle loss: $\Delta D = \frac{2 f_s L_{lk} I_p'}{V_{in}}$.
  3. Compute $D_{eff} = \frac{\phi}{\pi} - \Delta D$.
  4. Output voltage: $V_o = n V_{in} D_{eff}$.
- **Common Exam Traps:**
  - Applying duty cycle loss $\Delta D$ to the primary switching signals (the loss occurs purely across the secondary rectifier due to current reversal in primary leakage inductance).
  - Believing leading and lagging legs have identical soft-switching boundaries (lagging leg is the critical one requiring either an external inductor or shim inductor to maintain ZVS at light load).

---

## T4 — Dual-Active-Bridge (DAB) Converter (Week 7)

- **Exam Wording:** Calculate transmitted power $P$; peak inductor current $\hat{I}_L$; determine direction of power flow; phase shift angle $\phi$ for rated power.
- **Keywords:** Dual Active Bridge, phase shift $\phi$, leakage inductance $L_k$, turns ratio $n = N_2/N_1$, bidirectional power flow.
- **Governing Formulas:**
  - Power transmission formula: $P = \frac{V_1 V_2'}{\omega L_k} \phi \left(1 - \frac{|\phi|}{\pi}\right)$, where $V_2' = V_2 / n$, $\omega = 2\pi f_s$, and $-\frac{\pi}{2} \le \phi \le \frac{\pi}{2}$.
  - In terms of switching frequency $f_s$: $P = \frac{V_1 V_2'}{2 f_s L_k} d (1 - d)$, where $d = \phi / \pi$.
  - Maximum power occurs at $\phi = \frac{\pi}{2}$ ($d = 0.5$): $P_{max} = \frac{\pi V_1 V_2'}{4 \omega L_k} = \frac{V_1 V_2'}{8 f_s L_k}$.
  - Direction of power flow:
    - If $\phi > 0$ ($V_1$ leads $V_2'$): Power flows from Bridge 1 to Bridge 2.
    - If $\phi < 0$ ($V_1$ lags $V_2'$): Power flows from Bridge 2 to Bridge 1.
- **Fast Solution Recipe:**
  1. Identify primary DC voltage $V_1$, secondary DC voltage $V_2$, turns ratio $n$, and primary-referred series inductance $L_k$.
  2. Compute reflected voltage $V_2' = V_2 / n$.
  3. Use normalized phase ratio $d = \phi / \pi$ to solve for power: $P = \frac{V_1 V_2'}{2 f_s L_k} d(1-d)$.
- **Common Exam Traps:**
  - Mixing radians and degrees in the formula (if using degrees: $P = \frac{V_1 V_2'}{2 f_s L_k} \frac{\phi^\circ}{180} (1 - \frac{\phi^\circ}{180})$).
  - Operating with $|\phi| > \pi/2$ (causes excessive reactive circulating current and decreased real power).

---

## T5 — AC-DC Rectifier DC Voltage & Commutation Overlap (Week 8)

- **Exam Wording:** Calculate average DC output voltage $V_{dc}$; firing angle $\alpha$; commutation overlap angle $\mu$; DC voltage drop $\Delta V_{dc}$ caused by source inductance $L_s$.
- **Keywords:** Single-phase / three-phase rectifiers, half-wave, full-wave, bridge, center-tapped, controlled (SCR), uncontrolled (diode), source inductance $L_s$, commutation angle $\mu$.
- **Governing Formulas:**
  - Single-phase full-wave:
    - Resistive / continuous R-L load: $V_{dc} = \frac{2 V_m}{\pi} \cos\alpha$.
    - With source inductance overlap: $V_{dc} = \frac{2 V_m}{\pi} \cos\alpha - \frac{2 \omega L_s I_d}{\pi}$.
    - Overlap angle: $\cos(\alpha + \mu) = \cos\alpha - \frac{2 \omega L_s I_d}{V_m}$.
  - Three-phase full-wave (6-pulse bridge):
    - Ideal average DC voltage: $V_{dc} = \frac{3 \sqrt{2} V_{LL}}{\pi} \cos\alpha \approx 1.35 V_{LL} \cos\alpha$.
    - In terms of phase peak $V_m$: $V_{dc} = \frac{3\sqrt{3} V_m}{\pi} \cos\alpha \approx 1.654 V_m \cos\alpha$.
    - With source inductance overlap: $V_{dc} = \frac{3\sqrt{2} V_{LL}}{\pi} \cos\alpha - \frac{3 \omega L_s I_d}{\pi}$.
    - Overlap angle: $\cos(\alpha + \mu) = \cos\alpha - \frac{2 \omega L_s I_d}{\sqrt{6} V_{ph}} = \cos\alpha - \frac{\sqrt{2} \omega L_s I_d}{V_{LL}}$.
  - General overlap voltage drop formula: $\Delta V_{dc} = \frac{m \omega L_s I_d}{2\pi}$ where $m$ is the pulse number ($m=2$ for 1-phase full-wave, $m=6$ for 3-phase full-wave).
- **Fast Solution Recipe:**
  1. Identify phase number (1-phase vs 3-phase) and circuit topology (half-wave vs bridge).
  2. Compute no-load average DC voltage $V_{dc0} \cos\alpha$.
  3. If $L_s$ or source reactance $X_s = \omega L_s$ is given, calculate the drop $\Delta V_{dc} = \frac{m X_s I_d}{2\pi}$.
  4. Subtract $\Delta V_{dc}$ to obtain loaded average DC voltage: $V_{dc} = V_{dc0} \cos\alpha - \Delta V_{dc}$.
  5. Compute overlap angle $\mu$ using $\cos(\alpha+\mu) = \cos\alpha - \frac{2 \Delta V_{dc}}{V_{dc0}}$.
- **Common Exam Traps:**
  - Using phase voltage $V_{ph}$ where line-to-line voltage $V_{LL}$ is required in 3-phase equations ($V_{LL} = \sqrt{3} V_{ph}$).
  - Forgetting that commutation overlap reduces the DC output voltage regardless of whether the converter is rectifying or inverting.

---

## T6 — Rectifier Power Quality, Harmonics, DPF, DF, THD & PF (Week 8)

- **Exam Wording:** Determine fundamental current $I_{s1}$; total RMS current $I_s$; Displacement Power Factor (DPF); Distortion Factor (DF); Total Harmonic Distortion (THD); total Power Factor (PF).
- **Keywords:** Power factor, displacement angle $\phi_1$, harmonic spectrum, Fourier series, distortion factor, THD.
- **Governing Formulas:**
  - Total RMS current: $I_s = \sqrt{I_{s1}^2 + \sum_{h=2}^\infty I_{sh}^2}$.
  - Fundamental RMS current for single-phase full-wave bridge (square wave $I_d$): $I_{s1} = \frac{2\sqrt{2}}{\pi} I_d \approx 0.900 I_d$. Total RMS: $I_s = I_d$.
  - Fundamental RMS current for three-phase 6-pulse bridge (quasi-square wave $I_d$): $I_{s1} = \frac{\sqrt{6}}{\pi} I_d \approx 0.780 I_d$. Total RMS: $I_s = \sqrt{\frac{2}{3}} I_d \approx 0.816 I_d$.
  - Distortion Factor: $DF = \frac{I_{s1}}{I_s}$.
    - 1-Phase full-bridge: $DF = \frac{2\sqrt{2}}{\pi} \approx 0.900$.
    - 3-Phase 6-pulse bridge: $DF = \frac{3}{\pi} \approx 0.955$.
  - Total Harmonic Distortion: $THD = \frac{\sqrt{\sum_{h=2}^\infty I_{sh}^2}}{I_{s1}} = \sqrt{\left(\frac{1}{DF}\right)^2 - 1}$.
    - 1-Phase full-bridge: $THD = \sqrt{\left(\frac{\pi}{2\sqrt{2}}\right)^2 - 1} \approx 48.34\%$.
    - 3-Phase 6-pulse bridge: $THD = \sqrt{\left(\frac{\pi}{3}\right)^2 - 1} \approx 31.08\%$.
  - Displacement Power Factor: $DPF = \cos\phi_1$ (for controlled rectifier, $\phi_1 \approx \alpha + \mu/2$).
  - Overall Power Factor: $PF = \frac{P}{S} = \frac{V_s I_{s1} \cos\phi_1}{V_s I_s} = DF \times DPF$.
- **Fast Solution Recipe:**
  1. Determine harmonic spectrum ($h = 2k+1$ for 1-phase; $h = 6k \pm 1$ for 3-phase 6-pulse).
  2. Compute fundamental RMS $I_{s1}$ and total RMS $I_s$.
  3. Compute $DF = I_{s1}/I_s$ and $THD = \sqrt{(1/DF)^2 - 1}$.
  4. Find $DPF = \cos\phi_1$ (for diode bridge without overlap, $DPF \approx 1.0$).
  5. Multiply $PF = DF \times DPF$.
- **Common Exam Traps:**
  - Conflating Power Factor ($PF$) with Displacement Power Factor ($DPF$). For non-sinusoidal currents, $PF$ is strictly lower than $DPF$ by the distortion factor $DF$.
  - Assuming $THD$ can be calculated with $I_s$ in denominator (definition of $THD$ divides by fundamental $I_{s1}$, not total $I_s$).

---

## T7 — Active Boost PFC Circuit Sizing (Week 8)

- **Exam Wording:** Design Boost inductor $L$ for specified current ripple $\Delta I_L$; size bulk capacitor $C_{dc}$ for specified $2\omega$ voltage ripple and hold-up time $t_{hold}$.
- **Keywords:** Active Power Factor Correction, Boost PFC, line frequency $\omega$, peak current, $2\omega$ ripple, hold-up time.
- **Governing Formulas:**
  - Peak AC input voltage: $V_{m} = \sqrt{2} V_{ac,rms}$. DC bus must satisfy $V_o > V_m$ (typically $400\text{ V}$ for $230\text{ V}_{ac}$).
  - Average input power: $P_{in} = P_o / \eta$.
  - Peak input current: $\hat{I}_{ac} = \frac{2 P_{in}}{V_m} = \frac{\sqrt{2} P_{in}}{V_{ac,rms}}$.
  - Duty ratio variation: $d(t) = 1 - \frac{V_m |\sin\omega t|}{V_o}$.
  - Worst-case inductor current ripple: Maximum ripple occurs when $d = 0.5$ ($V_m |\sin\omega t| = V_o / 2$):
    $$\Delta I_{L,max} = \frac{V_o T_s}{4 L} = \frac{V_o}{4 f_s L} \quad\Rightarrow\quad L = \frac{V_o}{4 f_s \Delta I_{L,max}}.$$
  - Bulk DC bus capacitor sizing for $2\omega$ ripple:
    $$\Delta V_o = \frac{P_o}{2\omega C_{dc} V_o} \quad\Rightarrow\quad C_{dc} \ge \frac{P_o}{2\omega V_o \Delta V_o}.$$
  - Hold-up time requirement:
    $$C_{dc} \ge \frac{2 P_o t_{hold}}{V_o^2 - V_{min}^2}.$$
- **Fast Solution Recipe:**
  1. Compute peak AC current $\hat{I}_{ac} = \sqrt{2} P_o / (\eta V_{ac,rms})$.
  2. Choose inductor $L$ using worst-case ripple condition: $L = \frac{V_o}{4 f_s \Delta I_{L,max}}$.
  3. Calculate capacitor size from both ripple limit and hold-up time, and select the larger value: $C_{dc} = \max(C_{ripple}, C_{holdup})$.
- **Common Exam Traps:**
  - Using single-phase line frequency $\omega$ instead of $2\omega$ ($100\text{ Hz}$ for $50\text{ Hz}$ grid) in the DC voltage ripple formula.
  - Sizing $L$ at the peak of the sinusoidal envelope instead of the maximum ripple duty point ($d=0.5$).

---

## T8 — Three-Phase Six-Step Inverter Operation (Week 9)

- **Exam Wording:** Find line-to-neutral voltage $v_{an}$; line-to-line voltage $v_{ab}$; fundamental components $V_{LL,1}$ and $V_{ph,1}$; RMS line voltage; switch ratings.
- **Keywords:** Six-step VSI, 180° conduction, 120° conduction, quasi-square wave, line-to-neutral, line-to-line, harmonic spectrum.
- **Governing Formulas:**
  - 180° conduction mode:
    - Line-to-line voltage waveform: 3-level quasi-square wave ($+V_{dc}, 0, -V_{dc}$) with $120^\circ$ pulse width.
    - Line-to-line RMS: $V_{LL,rms} = \sqrt{\frac{2}{3}} V_{dc} \approx 0.8165 V_{dc}$.
    - Fundamental line-to-line peak: $\hat{V}_{LL,1} = \frac{4}{\pi} V_{dc} \cos(30^\circ) = \frac{2\sqrt{3}}{\pi} V_{dc}$.
    - Fundamental line-to-line RMS: $V_{LL,1} = \frac{\sqrt{6}}{\pi} V_{dc} \approx 0.7797 V_{dc}$.
    - Line-to-neutral voltage waveform: 6-step staircase ($0, \pm V_{dc}/3, \pm 2V_{dc}/3$).
    - Fundamental phase RMS: $V_{ph,1} = \frac{\sqrt{2}}{\pi} V_{dc} \approx 0.4502 V_{dc}$.
    - Line-to-neutral RMS: $V_{ph,rms} = \frac{\sqrt{2}}{3} V_{dc} \approx 0.4714 V_{dc}$.
  - Harmonic spectrum: $h = 6k \pm 1$ ($h = 5, 7, 11, 13, \dots$). Amplitude: $V_h = V_1 / h$. All triplen harmonics ($3, 9, 15, \dots$) are zero.
- **Fast Solution Recipe:**
  1. Determine conduction angle (standard is 180°).
  2. Use $V_{LL,1} = \frac{\sqrt{6}}{\pi} V_{dc}$ for line fundamental RMS.
  3. Divide by $\sqrt{3}$ to obtain phase fundamental RMS: $V_{ph,1} = V_{LL,1} / \sqrt{3} = \frac{\sqrt{2}}{\pi} V_{dc}$.
  4. For harmonic $h$, divide fundamental by $h$: $V_{LL,h} = V_{LL,1} / h$.
- **Common Exam Traps:**
  - Using the single-phase square wave formula ($4/\pi$) directly for line-to-line voltage without the $\cos(30^\circ) = \sqrt{3}/2$ shortening factor.
  - Forgetting that six-step line-to-neutral waveforms contain step levels at $\pm V_{dc}/3$ and $\pm 2V_{dc}/3$.

---

## T9 — Sinusoidal PWM (SPWM) Inverters (Week 9)

- **Exam Wording:** Find modulation index $m_a, m_f$; fundamental output voltage; harmonic frequencies; linear vs overmodulation range; DC bus utilization.
- **Keywords:** SPWM, amplitude modulation index $m_a = \hat{V}_{ctrl}/\hat{V}_{tri}$, frequency modulation index $m_f = f_s / f_1$, linear range, overmodulation, triplen cancellation.
- **Governing Formulas:**
  - Linear range ($m_a \le 1$):
    - Single-phase half-bridge fundamental peak: $\hat{V}_{o,1} = m_a \frac{V_{dc}}{2}$.
    - Single-phase full-bridge fundamental peak: $\hat{V}_{o,1} = m_a V_{dc}$ (bipolar or unipolar).
    - Three-phase line-to-neutral fundamental peak: $\hat{V}_{ph,1} = m_a \frac{V_{dc}}{2}$.
    - Three-phase line-to-line fundamental peak: $\hat{V}_{LL,1} = \sqrt{3} \hat{V}_{ph,1} = m_a \frac{\sqrt{3}}{2} V_{dc} \approx 0.866 m_a V_{dc}$.
    - Three-phase line-to-line fundamental RMS: $V_{LL,1} = m_a \frac{\sqrt{3}}{2\sqrt{2}} V_{dc} \approx 0.612 m_a V_{dc}$.
  - Harmonic location: Harmonics appear at sidebands around carrier multiples: $f_h = (j \cdot m_f \pm k) f_1$.
    - Single-phase unipolar switching: First carrier sideband shifted to $2 m_f$ ($f_h \approx 2 f_s$), cutting filter requirement in half!
  - Overmodulation ($1 < m_a \le 3.24$): Output voltage increases nonlinearly with $m_a$, introducing low-order harmonics ($5, 7, 11, \dots$).
  - Square-wave limit ($m_a > 3.24$): Converges to six-step mode ($\hat{V}_{LL,1} = \frac{2\sqrt{3}}{\pi} V_{dc} \approx 1.103 V_{dc}$).
- **Fast Solution Recipe:**
  1. Calculate $m_a = \hat{V}_{ctrl} / \hat{V}_{tri}$. Check if $m_a \le 1$ (linear).
  2. For linear range 3-phase: $V_{LL,1,rms} = 0.612 m_a V_{dc}$.
  3. Determine switching harmonics from $m_f = f_{tri}/f_1$.
- **Common Exam Traps:**
  - Confusing peak voltage with RMS voltage when calculating modulation gain.
  - Applying linear formula $\hat{V}_{o,1} = m_a V_{dc}$ when $m_a > 1$ (overmodulation causes saturation).

---

## T10 — Common-Mode Voltage (CMV) & Motor Shaft Bearing Currents (Week 9)

- **Exam Wording:** Calculate common-mode voltage waveform $v_{CM}(t)$; determine peak-to-peak CMV step; explain motor bearing current mechanism.
- **Keywords:** Common-mode voltage, $v_{CM} = \frac{v_A + v_B + v_C}{3}$, neutral point, bearing current, parasitic capacitance, $dv/dt$.
- **Governing Formulas:**
  - Instantaneous common-mode voltage:
    $$v_{CM}(t) = \frac{v_{An}(t) + v_{Bn}(t) + v_{Cn}(t)}{3}.$$
  - In a 2-level three-phase VSI referenced to DC negative rail ($v \in \{0, V_{dc}\}$):
    - For non-zero active vectors (e.g. $[1, 0, 0]$): $v_{CM} = \frac{V_{dc} + 0 + 0}{3} = \frac{V_{dc}}{3}$, or $[1, 1, 0] \Rightarrow \frac{2V_{dc}}{3}$.
    - For zero vectors ($[0, 0, 0]$ or $[1, 1, 1]$): $v_{CM} = 0$ or $v_{CM} = V_{dc}$.
  - CMV step amplitude: $\Delta v_{CM} = \frac{V_{dc}}{3}$ at every switch transition.
  - Motor shaft voltage: $v_{shaft} = BVR \times v_{CM}$, where $BVR = \frac{C_{sr}}{C_{sr} + C_{rb}}$ is the Bearing Voltage Ratio ($\sim 5\%\text{--}10\%$).
- **Fast Solution Recipe:**
  1. Determine switching state $[S_A, S_B, S_C]$.
  2. Compute $v_{CM} = \frac{S_A + S_B + S_C}{3} V_{dc}$.
  3. State values take steps of size $V_{dc}/3$ across values $\{0, V_{dc}/3, 2V_{dc}/3, V_{dc}\}$.
- **Common Exam Traps:**
  - Assuming common-mode voltage is zero in balanced three-phase PWM inverters (differential voltages sum to zero, but common-mode voltage is non-zero and switches at high carrier frequency).

---

## T11 — Inverter Output LC Filter Sizing (Week 9)

- **Exam Wording:** Design low-pass output filter $L_f, C_f$ to achieve specified voltage THD or cutoff frequency $f_c$; check reactive power drawn by filter capacitor.
- **Keywords:** LC filter, cutoff frequency $f_c$, switching frequency $f_{sw}$, fundamental frequency $f_1$, capacitor reactive power limit $Q_C$.
- **Governing Formulas:**
  - Cutoff frequency selection: $10 f_1 < f_c < \frac{1}{5} f_{sw}$.
  - Cutoff frequency formula: $f_c = \frac{1}{2\pi \sqrt{L_f C_f}}$.
  - Filter capacitor reactive power limit (typically $\le 5\%$ of rated apparent power $S_{rated}$):
    $$Q_C = 3 \omega_1 C_f V_{ph,rms}^2 \le 0.05 S_{rated} \quad\Rightarrow\quad C_f \le \frac{0.05 S_{rated}}{3 \omega_1 V_{ph,rms}^2}.$$
  - Inductor sizing from cutoff frequency:
    $$L_f = \frac{1}{(2\pi f_c)^2 C_f}.$$
  - Maximum inductor ripple current: $\Delta I_{L,max} = \frac{V_{dc}}{8 f_{sw} L_f}$.
- **Fast Solution Recipe:**
  1. Choose $f_c = \sqrt{10 f_1 \cdot 0.2 f_{sw}}$ (geometric mean) or per specification.
  2. Calculate upper bound for $C_f$ from $Q_C \le 0.05 P_{nom}$.
  3. Calculate $L_f = \frac{1}{(2\pi f_c)^2 C_f}$.
  4. Verify inductor ripple does not exceed $20\%\text{--}40\%$ of rated current.
- **Common Exam Traps:**
  - Choosing $C_f$ too large, causing the inverter to draw high reactive charging current even under no-load conditions.

---

## T12 — Single-Phase DC-Bus Energy Decoupling (2-Omega Ripple) (Week 9)

- **Exam Wording:** Determine the second-harmonic power ripple; calculate required DC-link decoupling capacitor $C_{dc}$ for specified voltage ripple $\Delta V_{dc}$.
- **Keywords:** Second-harmonic ripple, $2\omega$, instantaneous AC power, energy decoupling capacitor.
- **Governing Formulas:**
  - Instantaneous AC output power:
    $$p_{ac}(t) = v(t) i(t) = \sqrt{2} V_o \sin(\omega t) \cdot \sqrt{2} I_o \sin(\omega t - \phi) = P_o \cos\phi - P_o \cos(2\omega t - \phi).$$
  - The fluctuating power component $\tilde{p}(t) = -P_o \cos(2\omega t - \phi)$ oscillates at twice line frequency ($2\omega$).
  - Energy pulsation: $\Delta E = \int_{0}^{\pi/\omega} P_o \sin(2\omega t) dt = \frac{P_o}{\omega}$.
  - DC-link capacitor voltage ripple:
    $$\Delta V_{dc} = \frac{P_o}{2\omega C_{dc} V_{dc}} \quad\Rightarrow\quad C_{dc} \ge \frac{P_o}{2\omega V_{dc} \Delta V_{dc}}.$$
- **Fast Solution Recipe:**
  1. Identify real output power $P_o$ and grid angular frequency $\omega = 2\pi f$ ($314.16\text{ rad/s}$ for $50\text{ Hz}$).
  2. Plug into $C_{dc} = \frac{P_o}{2\omega V_{dc} \Delta V_{dc}}$.
- **Common Exam Traps:**
  - Using $\omega$ instead of $2\omega$ in the denominator.

---

## T13 — Single-Phase AC-AC Voltage Controller (Phase-Angle Control) (Week 9)

- **Exam Wording:** Find RMS load voltage $V_{o,rms}$; load current $I_{o,rms}$; input power factor $PF$; firing angle range for inductive load.
- **Keywords:** AC regulator, back-to-back SCRs, TRIAC, firing angle $\alpha$, conduction angle $\gamma$, extinction angle $\beta$, load power factor angle $\phi = \arctan(\omega L / R)$.
- **Governing Formulas:**
  - Pure Resistive Load ($R$):
    $$V_{o,rms} = V_s \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}.$$
    - Power Factor: $PF = \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$.
  - Resistive-Inductive Load ($R\text{-}L$):
    - Current equation during conduction ($\alpha \le \omega t \le \beta$):
      $$i_o(\omega t) = \frac{\sqrt{2} V_s}{Z} \left[ \sin(\omega t - \phi) - \sin(\alpha - \phi) e^{-\frac{R}{\omega L}(\omega t - \alpha)} \right].$$
    - Extinction angle $\beta$ solved from $i_o(\beta) = 0$. Conduction angle $\gamma = \beta - \alpha$.
    - Critical firing condition: Control is only possible for $\alpha \ge \phi$.
      - If $\alpha \le \phi$: current becomes continuous pure sinusoidal, gate pulses lose control!
- **Fast Solution Recipe:**
  1. For resistive load: compute $\alpha$ in radians, then evaluate $V_{o,rms} = V_s \sqrt{1 - \frac{\alpha}{\pi} + \frac{\sin 2\alpha}{2\pi}}$.
  2. For $R\text{-}L$ load: check $\phi = \arctan(\omega L / R)$. Verify $\alpha > \phi$.
- **Common Exam Traps:**
  - Forgetting to convert firing angle $\alpha$ to radians when evaluating the linear term $\alpha/\pi$ (must use radians!).
  - Triggering an $R\text{-}L$ controller with $\alpha < \phi$ and wondering why output current is uncontrolled.

---

## T14 — State-Space Averaging (SSA) & DC Operating Point (Week 10)

- **Exam Wording:** Formulate state-space matrices for subintervals 1 and 2; derive averaged matrices $A, B, C, D$; compute equilibrium state vector $X = [I_L, V_C]^T$.
- **Keywords:** State-Space Averaging (SSA), state vector $x = [i_L, v_C]^T$, subinterval matrices $A_1, B_1, A_2, B_2$, steady-state $X = -A^{-1} B V_{in}$.
- **Governing Formulas:**
  - Interval 1 ($0 < t < d T_s$, switch ON): $\dot{x} = A_1 x + B_1 u$, $y = C_1 x + D_1 u$.
  - Interval 2 ($d T_s < t < T_s$, switch OFF): $\dot{x} = A_2 x + B_2 u$, $y = C_2 x + D_2 u$.
  - Averaged matrices: $A = D A_1 + D' A_2$, $B = D B_1 + D' B_2$ (where $D' = 1 - D$).
  - Equilibrium condition ($\dot{X} = 0$):
    $$0 = A X + B V_{in} \quad\Rightarrow\quad X = -A^{-1} B V_{in}.$$
  - Inversion of $2\times 2$ matrix $A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}$:
    $$A^{-1} = \frac{1}{\det(A)} \begin{bmatrix} a_{22} & -a_{12} \\ -a_{21} & a_{11} \end{bmatrix}, \quad \det(A) = a_{11} a_{22} - a_{12} a_{21}.$$
- **Fast Solution Recipe:**
  1. Write KVL for inductor and KCL for capacitor in state 1 and state 2.
  2. Read off coefficients for $A_1, B_1$ and $A_2, B_2$.
  3. Compute $A = D A_1 + (1-D) A_2$ and $B = D B_1 + (1-D) B_2$.
  4. Invert $A$ and calculate $X = -A^{-1} B V_{in}$.
  5. Sanity check: verify that $V_C / V_{in}$ matches the known CCM voltage conversion ratio ($D$ for buck, $1/(1-D)$ for boost).
- **Common Exam Traps:**
  - Sign error in off-diagonal matrix entries when computing $A^{-1}$.
  - Swapping rows of $A$ or forgetting the minus sign in $X = -A^{-1} B V_{in}$.

---

## T15 — Small-Signal AC Equations & Transfer Functions (Week 10)

- **Exam Wording:** Linearize averaged state equations; derive control-to-output transfer function $G_{vd}(s) = \hat{v}_o(s)/\hat{d}(s)$; derive input-to-output transfer function $G_{vg}(s) = \hat{v}_o(s)/\hat{v}_{in}(s)$.
- **Keywords:** Perturbation, linearization, small-signal AC model, control vector $B_d$, resolvent matrix $(sI - A)^{-1}$.
- **Governing Formulas:**
  - Perturbation: $x = X + \hat{x}$, $u = V_{in} + \hat{v}_{in}$, $d = D + \hat{d}$.
  - Small-signal state equation:
    $$\dot{\hat{x}} = A \hat{x} + B \hat{v}_{in} + B_d \hat{d}, \quad \text{where } B_d = (A_1 - A_2) X + (B_1 - B_2) V_{in}.$$
  - Small-signal output equation:
    $$\hat{y} = C \hat{x} + D \hat{v}_{in} + D_d \hat{d}, \quad \text{where } D_d = (C_1 - C_2) X + (D_1 - D_2) V_{in}.$$
  - Laplace transfer functions:
    $$G_{vd}(s) = \frac{\hat{v}_o(s)}{\hat{d}(s)} = C (sI - A)^{-1} B_d + D_d,$$
    $$G_{vg}(s) = \frac{\hat{v}_o(s)}{\hat{v}_{in}(s)} = C (sI - A)^{-1} B + D.$$
  - Standard Buck Transfer Function:
    $$G_{vd}(s) = \frac{V_{in}}{s^2 L C + s \frac{L}{R} + 1} = \frac{V_{in}}{1 + \frac{s}{Q \omega_0} + \left(\frac{s}{\omega_0}\right)^2}.$$
  - Standard Boost Transfer Function:
    $$G_{vd}(s) = \frac{V_{in}}{(1-D)^2} \frac{1 - s \frac{L}{(1-D)^2 R}}{s^2 \frac{LC}{(1-D)^2} + s \frac{L}{(1-D)^2 R} + 1}.$$
- **Fast Solution Recipe:**
  1. Compute $B_d = (A_1 - A_2) X + (B_1 - B_2) V_{in}$.
  2. Compute resolvent $(sI - A)^{-1} = \frac{1}{\det(sI - A)} \text{adj}(sI - A)$.
  3. Multiply $C (sI - A)^{-1} B_d$ to find numerator polynomial.
- **Common Exam Traps:**
  - Dropping second-order perturbation terms ($\hat{x}\hat{d} \to 0$) without explicit mention.
  - Forgetting that the characteristic equation $\det(sI - A) = 0$ is identical for both $G_{vd}(s)$ and $G_{vg}(s)$.

---

## T16 — Right-Half-Plane (RHP) Zero Diagnostics & Bandwidth Limit (Week 10)

- **Exam Wording:** Find the location of the RHP zero $\omega_{z,RHP}$; explain physical origin; determine maximum achievable closed-loop crossover frequency $f_c$.
- **Keywords:** Right-Half-Plane zero, non-minimum phase, phase lag, boost converter, buck-boost converter, crossover frequency limitation.
- **Governing Formulas:**
  - Boost RHP zero location:
    $$\omega_{z,RHP} = \frac{(1-D)^2 R}{L} \quad\Rightarrow\quad f_{z,RHP} = \frac{(1-D)^2 R}{2\pi L}.$$
  - Buck-Boost RHP zero location:
    $$\omega_{z,RHP} = \frac{(1-D)^2 R}{D L} \quad\Rightarrow\quad f_{z,RHP} = \frac{(1-D)^2 R}{2\pi D L}.$$
  - Physical origin:
    - Step increase in $d(t)$ keeps the main switch ON longer.
    - Inductor current begins to ramp up, but diode is reverse-biased; the load is fed exclusively by the output capacitor $C$.
    - Output voltage $v_o(t)$ momentarily drops before inductor energy can be delivered to the output during the subsequent OFF interval.
  - Frequency response characteristics:
    - Magnitude: $+20\text{ dB/decade}$ slope (acts like a normal zero, boosting high-frequency gain).
    - Phase: $-90^\circ$ phase lag (acts like a pole, eroding phase margin!).
  - Control loop design rule:
    $$f_c \le \frac{1}{3 \sim 5} f_{z,RHP}.$$
- **Fast Solution Recipe:**
  1. Calculate operating duty ratio $D$ and load resistance $R = V_o / I_o$.
  2. Evaluate $f_{z,RHP} = \frac{(1-D)^2 R}{2\pi L}$.
  3. The maximum allowable control bandwidth is capped at $f_c \le f_{z,RHP} / 3$ (or $/5$ for robust phase margin).
- **Common Exam Traps:**
  - Trying to compensate an RHP zero using a lead network (adding phase lead increases gain at high frequencies, accelerating gain crossover and driving the system unstable).
  - Forgetting that the worst-case (lowest) RHP zero occurs at minimum input voltage (maximum $D$) and full load (minimum $R$).

---

## T17 — Foundational Weeks 1–4 Rapid Recall (CCM/DCM/QRC)

- **Exam Wording:** Identify non-isolated converter topology; calculate critical boundary parameter $K_{crit}$; size resonant tank components $L_r, C_r$ for ZCS-QRC or ZVS-QRC; account for switch capacitance $C_j$.
- **Keywords:** Buck, Boost, Buck-Boost, Cuk, $K = \frac{2L}{R T_s}$, ZCS, ZVS, $\Phi \le 1$, $C_{r,ext} = C_r - C_j$.
- **Governing Formulas:**
  - $K_{crit}$ boundary formulas:
    - Buck: $K_{crit} = 1 - D$.
    - Boost: $K_{crit} = D(1-D)^2$ (worst case $K_{crit,max} = 4/27$ at $D = 1/3$).
    - Buck-Boost & Cuk: $K_{crit} = (1-D)^2$.
  - Resonant tank:
    - Characteristic impedance: $Z_0 = \sqrt{\frac{L_r}{C_r}}$. Resonant frequency: $\omega_0 = \frac{1}{\sqrt{L_r C_r}}$, $f_0 = \frac{\omega_0}{2\pi}$.
  - ZCS-QRC soft-switching condition:
    $$\Phi = \frac{I_o Z_0}{V_{in}} \le 1 \quad\Rightarrow\quad Z_0 \le \frac{V_{in}}{I_o}.$$
  - ZVS-QRC soft-switching condition:
    $$\Phi = \frac{V_{in}}{I_o Z_0} \le 1 \quad\Rightarrow\quad Z_0 \ge \frac{V_{in}}{I_o}.$$
  - Switch parasitic capacitance absorption (ZVS-QRC):
    $$C_{r,ext} = C_r - C_j.$$
- **Fast Solution Recipe:**
  1. Check if converter is PWM or QRC.
  2. If PWM: compute $K = 2 L f_s / R$ and compare with $K_{crit}(D)$.
  3. If ZCS: boundary occurs at $Z_0 = V_{in}/I_o$; $L_r = Z_0 / \omega_0$, $C_r = 1/(\omega_0 Z_0)$.
  4. If ZVS: boundary occurs at $Z_0 = V_{in}/I_o$; subtract internal junction capacitance $C_{r,ext} = C_r - C_j$.
