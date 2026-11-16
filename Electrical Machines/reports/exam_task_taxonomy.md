# Exam task taxonomy — EE4003 Electrical Machines

Inferred from `input/exams/` and tutorial Units 1–7. Grouped by **task type**, not lecture number.

---

## T1 — Main-dimension design (\(D,L,T_{\mathrm{ph}}\))

- **Wording:** ratings + \(B\) + \(ac\) + square-pole; find diameter, length, turns, conductor area
- **Keywords:** output coefficient, square pole, specific loading, turns per phase, star-connected
- **Formulas:** \(G=1.11 K_w\pi^2 B\cdot ac\), \(D^2L=S/(Gn)\), \(\pi D/(2p)=L\), EMF or \(ac\) for \(T_{\mathrm{ph}}\)
- **Fast method:** \(n\) in r/s → \(G\) → \(D^2L\) → square-pole solve → \(T_{\mathrm{ph}}\) → \(z_s,A_c\)
- **Traps:** r/min in \(G\); \(p\) vs \(2p\); motor \(S=P/(\eta\cos\phi)\)
- **Sources:** Test 2024/25 Q1; Exam 2016/17 QB3; Tutorial Unit 2 Q5

## T2 — Magnetizing inductance / air-gap length

- **Wording:** \(L_m\) too small; estimate \(g'\) from \(X_m\)
- **Keywords:** magnetizing reactance, effective air gap, power factor
- **Formulas:** \(X_m=6\mu_0 f(K_w T_{\mathrm{ph}}/p)^2 D L/g_c\), \(L_m=X_m/(2\pi f)\)
- **Fast method:** get \(T_{\mathrm{ph}}\) from EMF → rearrange for \(g_c\); discuss PF via \(I_m\)
- **Traps:** line vs phase voltage; forget \(X_m=X_s-X_\ell\)
- **Sources:** Test 2024/25 Q2; Exam 2016/17 QB4; Tutorial Unit 5 Q4

## T3 — Slot leakage reactance

- **Wording:** permeances for drawn slot; how \(X_s\) changes with geometry / \(n\) / \(L_c\) / \(I\)
- **Keywords:** slot leakage, permeance \(\lambda\), open/semi-closed slot
- **Formulas:** \(\lambda_i=\mu_0 L_c(\ldots)\), \(X_s=2\pi f N n^2\lambda\)
- **Fast method:** sum only active \(\lambda\); scale with \(n^2\), \(L_c\), \(N\); \(I\)-independent
- **Traps:** changing unused dimensions; thinking \(X\propto I\)
- **Sources:** Test 2024/25 Q3; Tutorial Unit 5 Q1–Q3, Q5

## T4 — Magnetic circuit (coil + air gaps)

- **Wording:** infinite \(\mu\), series gaps, find \(B_g\) and \(\Phi\)
- **Keywords:** Ampere, reluctance, fringing neglected
- **Formulas:** \(H(2g)=Ni\), \(B=\mu_0 H\), \(\Phi=BA\)
- **Fast method:** count series gaps → \(B\) → \(\Phi\)
- **Traps:** one gap instead of two; unit conversion cm²→m²
- **Sources:** Test 2024/25 Q4

## T5 — Qualitative design effects

- **Wording:** fringing; laminated silicon steel; saturation effects on loss/PF
- **Keywords:** fringing reduces reluctance; eddy-current; core vs copper loss
- **Fast method:** recall direction of effect (no long derivation)
- **Sources:** Exam 2016/17 QB1; Final Review Unit 1 examples; Tutorial Unit 1–2

## T6 — Skew and tooth harmonics

- **Wording:** skew by one stator slot pitch; show \(K_{\mathrm{sk},n}\approx0\)
- **Keywords:** skew factor, slot harmonic order \(S_1/p\pm1\)
- **Formulas:** \(K_{\mathrm{sk},n}=\sin(n\gamma/2)/(n\gamma/2)\), \(\gamma=2\pi p/S_1\)
- **Sources:** Exam 2016/17 QB2; Unit 7 / Tutorial Unit 7

## T7 — Sync machine power and hunting

- **Wording:** natural frequency of oscillation; \(P_s\) from SC current
- **Keywords:** load angle, synchronizing torque, hunting
- **Formulas:** \(P=3E_FV\sin\delta/X_s\), \(f_{\mathrm{osc}}=(1/2\pi)\sqrt{p T_s/J}\)
- **Sources:** Exam 2016/17 QB5; Formula sheet items 9–11

## T8 — Coordinate / sequence transforms

- **Wording:** find \(b,c\) for orthogonal \(C\); symmetrical components
- **Keywords:** Clarke, Park, \(dq0\), Fortescue
- **Formulas:** formula-sheet \(C_1,C_2,C_3\); \(b=\sqrt{2/3}\), \(c=1/\sqrt{2}\)
- **Sources:** Exam 2016/17 QA3; Formula sheet items 12–13

## T9 — Induction machine torque curve

- **Wording:** \(T(\omega_2)\), breakdown, starting
- **Keywords:** slip frequency, pull-out torque
- **Formulas:** \(T\propto \omega_2 R_2/(R_2^2+\omega_2^2 L_2^2)\); \(\omega_{2b}=R_2/L_2\)
- **Sources:** Exam 2016/17 QA5

## T10 — PWM / inverter harmonics

- **Wording:** equal-area theorem; \(M\); fund+3rd; pulse widths; Fourier of line voltage
- **Keywords:** modulation index, frequency modulation ratio, asymmetrical double-edge
- **Formulas:** \(M=V_m/(V_d/2)\), \(p=f_{\mathrm{tri}}/f_1\), \(\delta_{1k},\delta_{2k}\) with \(M/6\) term
- **Sources:** Exam 2016/17 QA1, QA2, QA4

## T11 — Slot combination / UMP / cogging rules

- **Wording:** choose \(S_1,S_2\) to avoid UMP, cogging, crawling
- **Keywords:** \(S_1-S_2\neq\pm1\), skew, crawling at \(n_s/7\)
- **Sources:** Units 6–7; tutorials; mini-project context

## Cross-cutting MCQ / open-book strategy

- Open-book tests: search headings for exact keyword (square pole, skew, \(X_m\), PWM).
- If one clause in a qualitative option is false, discard the whole option.
- Always check \(p\) vs \(2p\), r/s vs r/min, phase vs line voltage.
