# Exam Task Taxonomy — EE4007 Advanced Power Electronics (Test 2)

**Date:** 2026-11-17  
**Sheet:** Typst `main_test2.typ` (16 pages). Formulas live in the sheet. This file only names the task, the heading, and the recipe.

Scope: Weeks 5, 7, 8, 9, 10. Week 11 closed-loop compensator design is excluded. Weeks 1–4 are the appendix cheat sheet (tables, no recipes).

Quick lookup for all rows: `sources/test2_quick_lookup.typ`.

| ID | Task | Sheet heading | Recipe |
|---|---|---|---|
| T1 | Flyback CCM/DCM, $K$, $K_"crit"$, device stress, $\Delta V_o$ | Isolated DC/DC → Flyback, CCM and DCM | Flyback CCM or DCM |
| T2 | Forward tertiary reset, two-transistor clamp, $D_"max"$, $V_"sw"$ | Forward converter, tertiary reset, two-transistor | Forward reset and device voltage |
| T2b | Secondary leakage overlap $t_"ov"$, $\Delta V_o$ | Commutation overlap, $t_"ov"$, $\Delta D$ | Overlap time and voltage drop |
| T3 | PSFB $D = \theta/\pi$, $\Delta D$, $D_"eff"$, which leg loses ZVS | Phase-shifted full bridge, PSFB | none |
| T4 | DAB power, sign of $\phi$, $D_\phi$ from $P$ | Dual active bridge, DAB | DAB phase shift from power |
| T5 | 1φ/3φ diode and SCR average $V_"dc"$, PIV, inversion margin | Single-phase rectifiers; Three-phase rectifiers | none (lookup table) |
| T6 | $I_s$, DF, DPF, THD, PF | Power definitions, DPF, DF, THD | PF from a harmonic list |
| T7 | Boost PFC $L_"pfc"$, $C_o$, hold-up | Boost PFC | Boost PFC inductor and bulk capacitor |
| T8 | Three-phase six-step $V_"LL,1"$, triplens | Three-phase VSI, six-step, 180° | none (one square-wave step inside the SPWM recipe) |
| T9 | SPWM $m_a$, $m_f$, linear bus, overmodulation | Sinusoidal PWM | DC link from SPWM line voltage |
| T10 | $v_"CM"$ and leakage current | Common-mode voltage and leakage | none |
| T11 | Output LC window, $L_f$, $C_f$ | Output LC filter | LC cutoff placement |
| T12 | Single-phase $2\omega$ bus capacitor | Single-phase $2\omega$ bus capacitor | none |
| T13 | AC-AC RMS and the $R$-$L$ firing limit | AC-AC voltage controller, RMS | AC-controller RMS and the RL boundary |
| T14 | SSA matrices and $X = -A^{-1} B U$ | Averaged matrices | step 1 of the $G_{vd}$ recipe |
| T15 | $G_{vd}$, $G_{vg}$ for buck, boost, buck-boost | Buck / Boost / Buck-boost $G_{vd}$ | Read $G_{vd}$ from the averaged model |
| T16 | RHP zero and crossover cap | Boost $G_{vd}$ and the RHP zero | step 4 of the same recipe |
| T17 | Buck/boost/buck-boost/Ćuk CCM and DCM; ZCS/ZVS tank | Weeks 1–4 appendix | none (cheat sheet) |

Out of taxonomy: Week 11 voltage-mode and current-mode compensators.
