# Exam Verification Report — EE4007 Advanced Power Electronics (Test 2)

**Date:** 2026-11-17  
**Sheet:** `main_test2.pdf`, 16 pages, Typst.  
**Method:** Lecture PDFs in `input/` mapped to headings in `sources/*.typ`. No past exam papers are in the tree, so this is not a per-question score of a paper.

Week 11 is excluded. The appendix is a cheat sheet only.

| Source | Problem / task | Type | Fast method | Covered in section | Missing recipe? |
|---|---|---|---|---|---|
| Week 5 isolated DC/DC I | Flyback CCM vs DCM, gain, peak currents | T1 | $K$ vs $K_"crit"$, then the matching $M$ | Flyback, CCM and DCM | No |
| Week 5 / 7 | Tertiary reset and two-transistor forward stress | T2 | $D_"max"$ and clamp voltage | Forward converter | No |
| Week 7 isolated DC/DC II | Leakage overlap on the secondary | T2b | $t_"ov"$, then $\Delta V_o$ | Commutation overlap | No |
| Week 7 | PSFB effective duty and ZVS leg | T3 | $\Delta D$, then $D_"eff"$ | Phase-shifted full bridge, PSFB | Yes |
| Week 7 | DAB power and phase shift | T4 | Solve $D_\phi$ in $[0, 0.5]$ | Dual active bridge, DAB | No. $n$ in the numerator is still marked TODO in the source |
| Week 8 rectifiers | 1φ and 3φ average voltage, firing angle, inversion | T5 | Quick-lookup row, then $\cos\alpha$ | Single-phase rectifiers; Three-phase rectifiers | Yes |
| Week 8 | PF, DF, DPF, THD from a harmonic list | T6 | $I_s$, then DF × DPF | Power definitions | No |
| Week 8 | Boost PFC inductor and bulk capacitor | T7 | Ripple $L$, then the larger of ripple $C$ and hold-up $C$ | Boost PFC | No |
| Week 8 slides, text extract | Source-inductance overlap $\mu$ and $\Delta V_"dc"$ | — | Not on the sheet. $\mu$ is only in Symboloversigt and in $\alpha_"max"$ | Symboloversigt; inversion margin | Gap. Do not invent the $L_s$ formula until a slide or problem states it |
| Week 9 inverters | Six-step line voltage | T8 | $V_"LL,1,rms" = \sqrt{6}\, V_"DC" / \pi$ | Three-phase VSI, six-step | Yes, as its own recipe |
| Week 9 | Linear SPWM bus and $m_f$ | T9 | $V_"DC" = V_"LL,1,rms" / (0.612 m_a)$ | Sinusoidal PWM | No |
| Week 9 | Common-mode steps and leakage | T10 | Average the three pole voltages | Common-mode voltage and leakage | Yes |
| Week 9 | Sine-filter $f_c$ | T11 | $10 f_1 < f_c < f_s/10$, then $L_f$ and $C_f$ | Output LC filter | No |
| Week 9 | $2\omega$ DC-bus capacitor | T12 | $C_"bus"$ from $P$, $f_1$, and peak-to-peak ripple | Single-phase $2\omega$ bus capacitor | Yes |
| Week 9 | AC voltage controller, $R$ and $R$-$L$ | T13 | RMS formula; if $\alpha \le \phi$, full voltage | AC-AC voltage controller | No |
| Week 10 modeling part 1 | Averaged state matrices and DC point | T14 | $A$, $B$, then $X = -A^{-1}BU$ | Averaged matrices | No (first step of the $G_{vd}$ recipe) |
| Week 10 | $G_{vd}$ buck, boost, buck-boost | T15 | Closed form, or the resolvent row | Buck / Boost / Buck-boost $G_{vd}$ | No |
| Week 10 | RHP zero and bandwidth cap | T16 | $f_c$ below $f_{z,\mathrm{RHP}}/3$ | Boost $G_{vd}$ and the RHP zero | No |
| Weeks 1–4 slides | Non-isolated CCM/DCM and QRC tank | T17 | Read the appendix table | Weeks 1–4 appendix | Intentional. Cheat sheet only |
| Week 11 modeling part 2 | Closed-loop compensators, voltage mode, current mode | — | Out of Test 2 | Not in the sheet | Excluded |

## Checks run

```text
typst compile --root . "Advanced Power Electronics/main_test2.typ" "Advanced Power Electronics/main_test2.pdf"
python scripts/check_compact.py <seven Test 2 sources>
python "Advanced Power Electronics/scripts/audit_test2_pdf.py"
```

`audit_test2_pdf.py` calls `scripts/check_compact.py` and then checks that Symboloversigt, Flyback, Forward, PSFB, DAB, THD, PFC, SPWM, RHP, CCM, and ZVS occur in the PDF. It does not require 67 pages or fixed bookmark pages.
