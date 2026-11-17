# Exam verification report — EE4003 Electrical Machines

Mapped after generating `sources/*.tex`. Focus: coverage, not full numerical solutions.

| Source | Problem | Problem type | Fast method | Covered in section | Missing recipe? |
|---|---|---|---|---|---|
| Test 2024/25 | Q1 | Main dimensions + \(T_{\mathrm{ph}}\) + conductor area | \(G\)→\(D^2L\)→square pole→EMF/\(ac\)→\(z_s A_c\) | `03_main_dimensions` (recipe: find D and L) | No |
| Test 2024/25 | Q2 | Magnetizing inductance too small | PF via \(I_m\); raise \(L_m\) by \(g'\downarrow\) or \(T,D,L\uparrow\) | `06_reactances` + `11_induction_machine_torque` | No |
| Test 2024/25 | Q3 | Slot leakage \(X_s\) + parametric changes | \(\sum\lambda\); \(X=2\pi f Nn^2\lambda\); scale rules | `06_reactances` (recipe: slot leakage) | No |
| Test 2024/25 | Q4 | Air-gap \(B,\Phi\) from coil | Series \(2g\); \(B=\mu_0 NI/(2g)\) | `01_basic_electromagnetics` (recipe: air-gap B) | No |
| Exam 2016/17 | QA1 | PWM equal-area + amplitude/harmonics | Volt-second; raise \(v_{\mathrm{control}}\) / \(p\) | `12_pwm_inverters` | No |
| Exam 2016/17 | QA2 | Modulation index, \(p\), double-edge pulses | \(M\), \(p\), \(\delta_{1k}/\delta_{2k}\) + 3rd harm. | `12_pwm_inverters` (recipe) | No |
| Exam 2016/17 | QA3 | Orthogonal transform constants | \(C^{*t}C=I\) → \(b,c\) | `10_transformations` (recipe) | No |
| Exam 2016/17 | QA4 | Inverter Fourier / selective harmonic | \(A_n\propto\cos(n\gamma/2)\) | `12_pwm_inverters` (Fourier note) | Partial — waveform-specific algebra stays in exam; general form covered |
| Exam 2016/17 | QA5 | IM \(T(\omega_2)\), \(T_b\), \(T_{\mathrm{st}}\) | \(\mathrm{d}T/\mathrm{d}\omega_2=0\) | `11_induction_machine_torque` | No |
| Exam 2016/17 | QB1 | Fringing; laminated core | Directional statements | `03_main_dimensions` (fringing) + `02_basic_concept_of_design` | No |
| Exam 2016/17 | QB2 | Skew cancels slot harmonics | \(n=S_1/p\pm1\), \(K_{\mathrm{sk},n}\approx0\) | `08_harmonic_effects` (recipe) | No |
| Exam 2016/17 | QB3 | Deduce \(G\) + numerical \(D,L\) | Motor \(1/(1-\varepsilon)\) form + square pole | `03_main_dimensions` | No |
| Exam 2016/17 | QB4 | \(\Phi\), \(T_{\mathrm{ph}}\), \(g_c\) from \(X_m\) | EMF → \(T_{\mathrm{ph}}\) → rearrange \(X_m\) | `06_reactances` (recipe: air gap from Xm) | No |
| Exam 2016/17 | QB5 | Sync hunting frequency | \(P_s\)→\(T_s\)→\(f_{\mathrm{osc}}\) | `09_synchronous_machines` (recipe) | No |

## Tutorial spot-checks

| Source | Focus | Covered? |
|---|---|---|
| Tutorial Unit 2 | \(G\), square pole, IM sizing | Yes — `03` |
| Tutorial Unit 4 | \(F_a\), speed/poles of MMF | Yes — `05` |
| Tutorial Unit 5 | Slot \(\lambda\), \(X_m\)→\(g'\) | Yes — `06` |
| Tutorial Unit 6–7 | UMP rules, skew | Yes — `07`,`08` |

## Gaps / follow-ups

1. **QA4** detailed Fourier derivation is exam-specific; collection keeps the reusable cosine form only.
2. **Week 8–12** control topics beyond PWM/transforms have little lecture PDF in `input/`; add if more slides appear.
3. Mini-projects (Simulink/FEA) are not formula-collection targets.

## Verdict

All identified exam problems map to a searchable section and (where recurring) an exam recipe. Document compiles to `main.pdf`.
