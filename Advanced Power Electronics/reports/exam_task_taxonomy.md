# Exam task taxonomy — EE4007 Advanced Power Electronics

Inferred from week 1–5 slides, Cheng notes, and in-class tutorials. No past exam PDFs were in `input/`.

## T1 — CCM conversion ratio (volt-second)

- **Wording:** voltage conversion ratio, \(V_o/V_{\mathrm{in}}\), duty ratio, continuous mode
- **Keywords:** volt-second, CCM, buck, boost, buck-boost, Cuk
- **Formulas:** buck \(D\); boost \(1/(1-D)\); buck-boost/Cuk \(D/(1-D)\)
- **Method:** \(\int v_L\,\mathrm{d}t=0\) over \(T_s\); lossless \(P_{\mathrm{in}}=P_o\) for current ratios
- **Traps:** polarity inversion; infinite gain at \(D\to 1\)
- **Sources:** Week 1 slides; Cuk repeated week 2

## T2 — CCM output voltage ripple

- **Wording:** peak-to-peak ripple, \(\Delta V_o\), sketch ripple vs \(D\)
- **Keywords:** \(8LC\), \(f_c\), \(RC\), capacitor current
- **Formulas:** buck \(\Delta V_o=V_o(1-D)T_s^2/(8LC)\); boost/buck-boost \(\Delta V_o=I_o D T_s/C\)
- **Method:** integrate positive \(i_C\) onto \(C\)
- **Traps:** using buck formula on boost; forgetting \(V_o=DV_{\mathrm{in}}\)
- **Sources:** Week 1 in-class tutorial (buck \(30\,\mathrm{V}\), \(10\,\mathrm{kHz}\), \(1\,\mathrm{mH}\), \(10\,\mu\mathrm{F}\), \(D=0.5\))

## T3 — CCM component voltage/current ratings

- **Wording:** voltage rating of all circuit components, rms current
- **Keywords:** Cuk, \(V_{\mathrm{in}}+V_o\), \(V_{C1}\)
- **Formulas:** Cuk \(V_{C1}=V_{\mathrm{in}}/(1-D)=V_o/D\); switch/diode \(V_{\mathrm{in}}+V_o\)
- **Method:** \(D=t_{\mathrm{on}}f_s\), then CCM \(M\), then blocking voltages
- **Traps:** rating switch at \(V_{\mathrm{in}}\) only
- **Sources:** Week 2 Cuk exercise (\(50\,\mathrm{kHz}\), \(12\,\mu\mathrm{s}\), \(100\,\mathrm{V}\))

## T4 — DCM identification and \(K\) boundary

- **Wording:** critical load resistor, always CCM for any duty ratio, discontinuous mode
- **Keywords:** \(K=2L/(RT_s)\), \(K_{\mathrm{crit}}\), \(\Delta i_L/2>\overline{i}_L\)
- **Formulas:** buck \(K<(1-D)\); boost \(K<D(1-D)^2\) max \(4/27\); buck-boost \(K<(1-D)^2\)
- **Method:** compute CCM \(D\) at given \(V_o/V_{\mathrm{in}}\), then \(R_{\mathrm{crit}}=2Lf_s/K_{\mathrm{crit}}\)
- **Traps:** DCM at **light** load (\(R\) large), not heavy load
- **Sources:** Week 2 exercises 2, 3, 5

## T5 — DCM conversion ratio

- **Wording:** output voltage in discontinuous mode, depends on \(K\)
- **Keywords:** energy balance, \(\delta\), triangular \(i_L\)
- **Formulas:** buck \(2/(1+\sqrt{1+4K/D^2})\); boost \((1+\sqrt{1+4D^2/K})/2\); buck-boost \(D/\sqrt{K}\)
- **Method:** \(P_{\mathrm{in}}=P_o\) with triangle averages
- **Traps:** applying CCM \(M(D)\) after DCM onset; boost no-load runaway

## T6 — CCM \(L,C\) design from ripple specs

- **Wording:** design \(L\) and \(C\) such that \(\Delta i_L\), \(\Delta V_o\)
- **Keywords:** buck-boost design, \(100\,\mathrm{kHz}\)
- **Formulas:** \(D=V_o/(V_{\mathrm{in}}+V_o)\); \(L=V_{\mathrm{in}}DT_s/\Delta i_L\); \(C=I_o DT_s/\Delta V_o\)
- **Sources:** Week 2 exercise 4 (\(5\,\mathrm{V}\to 12\,\mathrm{V}\), \(10\,\mathrm{A}\))

## T7 — ZCS-QRC analysis / tank design

- **Wording:** full-wave ZCS QR buck, boundary of zero-current switching, \(L_r,C_r\), ESR loss
- **Keywords:** \(\Phi\le 1\), \(\alpha\), \(g\approx f_s/f_0\), half-wave vs full-wave
- **Formulas:** \(Z_0=V/I\) on boundary; \(M=g\); \(L_r=Z_0/\omega_0\), \(C_r=1/(\omega_0 Z_0)\)
- **Traps:** mixing ZVS inequality; half-wave load dependence
- **Sources:** Week 3 tutorial (\(50\,\mathrm{V}\to 20\,\mathrm{V}\), \(500\,\mathrm{kHz}\), \(10\,\mathrm{A}\))

## T8 — ZVS-QRC analysis / tank design

- **Wording:** just able to achieve ZVS, junction capacitance
- **Keywords:** \(ZI>V\), \(C_j\), dual, \(M=1-g\)
- **Formulas:** \(P_{C_j}=\tfrac12 C_{\mathrm{sw}}V^2 f_s\); \(C_{r,\mathrm{ext}}=C_r-C_j\)
- **Traps:** full-wave ZVS still dissipates \(C_j\); ZVS lost at light load
- **Sources:** Week 4 tutorial (\(50\,\mathrm{V}\), \(25\,\mathrm{V}\), \(1\,\mathrm{MHz}\), \(5\,\mathrm{A}\), \(100\,\mathrm{pF}\))

## T9 — Flyback CCM/DCM numbers

- **Wording:** is it CCM or DCM; \(V_o\); \(I_{\mathrm{in}}\); \(\Delta V_o\); peak \(i_p,i_s\); \(L_m\) for DCM
- **Keywords:** magnetising, turns ratio \(1:N\), \(K=2L_m/(RT_s)\)
- **Formulas:** CCM \(ND/(1-D)\); DCM \(D/\sqrt{K}\); ripple \(D V_o T_s/(RC)\); \(K_{\mathrm{crit}}=[(1-D)/N]^2\)
- **Traps:** putting \(N\) into DCM \(M\); increasing \(L_m\) to get DCM
- **Sources:** Week 5 Q2 (\(50\,\mathrm{kHz}\), \(100\,\mu\mathrm{H}\), \(R=50\,\Omega\), \(D=0.5\), \(N=2\))

## T10 — Forward reset and isolated gain

- **Wording:** maximum duty ratio, reset winding, tertiary, two-transistor, phase shift \(\theta\)
- **Keywords:** \(D_R\), \(N_3\), \(D_{\max}=N_1/(N_1+N_3)\), \(M=(N_2/N_1)D\), \(N\theta/\pi\)
- **Traps:** \(D_{\max}=0.5\) only if \(N_1=N_3\); transistor voltage \(V_{\mathrm{in}}(1+N_1/N_3)\)
- **Sources:** Week 5 slides + Cheng 5.3–5.5

## Cross-cutting elimination rules (tests are open-book)

- One false clause kills a whole multiple-choice statement (if that format appears).
- CCM \(\Rightarrow\) \(M\) independent of \(R\); DCM \(\Rightarrow\) \(M\) depends on \(K\) (hence \(R\)).
- ZCS needs \(\Phi\le 1\) (enough \(V/Z\)); ZVS needs \(\Phi<1\) in the **reciprocal** definition (enough \(ZI\)).
- Buck-boost, Cuk, flyback invert (unless the problem states magnitude only).
