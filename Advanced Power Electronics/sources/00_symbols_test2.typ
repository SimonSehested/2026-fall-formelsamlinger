#import "../../templates/formula-sheet/lib.typ": symbol-table

= Symboloversigt and notation (Test 2)

Symbols below are the ones used in the Test 2 sheet. The same letter changes meaning by section.

== Physical constants and stored energy

#symbol-table(
  [$mu_0$], [Vacuum permeability, $4 pi times 10^(-7)$], [$"H/m"$],
  [$E_L$], [Energy in an inductor, $1/2 L I^2$], [$"J"$],
  [$E_C$], [Energy in a capacitor, $1/2 C V^2$], [$"J"$],
  [$P$], [Average power. Also $E f_s$ when energy $E$ moves once per cycle], [$"W"$],
)

== Circuit quantities, isolation, duty

#symbol-table(
  [$V_"in", V_s, V_g$], [DC source voltage], [$"V"$],
  [$V_o$], [Average output voltage. Signed in the inverting buck-boost model], [$"V"$],
  [$I_"in"$], [Average input current], [$"A"$],
  [$I_o$], [Average load current, $V_o/R$ when $V_o$ is the load magnitude], [$"A"$],
  [$Q$], [Reactive power, or SSA quality factor (see modeling table)], [$"var"$ or 1],
  [$S$], [Apparent power], [$"VA"$],
  [$T_s$], [Switching period, $1/f_s$], [$"s"$],
  [$f_s$], [Switching frequency. In SPWM this is the carrier], [$"Hz"$],
  [$D$], [Duty ratio $t_"on"/T_s$. In PSFB, $D = theta/pi$], [1],
  [$D'$], [Complementary duty, $1 - D$], [1],
  [$t_"on", t_"off"$], [Switch on-time and off-time], [$"s"$],
  [$L, C, R$], [Filter inductor, capacitor, load resistance], [$"H", "F", Omega$],
  [$eta$], [Efficiency, $P_o/P_"in"$], [1],
  [$L_m$], [Magnetizing inductance, primary], [$"H"$],
  [$L_k$], [Leakage inductance. Secondary-referred in the forward overlap formula; primary-referred in DAB], [$"H"$],
  [$L_"lk"$], [Primary leakage inductance in PSFB], [$"H"$],
  [$N_1, N_2, N_3$], [Primary, secondary, and tertiary (reset) turns], [1],
  [$n$], [Turns ratio $N_2/N_1$. Harmonic index $n$ is separate], [1],
  [$D_R$], [Forward reset duty, $(N_3/N_1) D$], [1],
  [$D_"max"$], [Largest forward duty that still resets the core], [1],
  [$D_"eff"$], [Duty after leakage overlap, $D - Delta D$], [1],
  [$Delta D$], [Duty lost to leakage commutation], [1],
  [$t_"ov"$], [Secondary diode overlap time], [$"s"$],
  [$Delta V_o$], [Average voltage lost to overlap, or a ripple amplitude when so labelled], [$"V"$],
  [$K$], [Conduction parameter $2 L/(R T_s)$. Flyback uses $L_m$], [1],
  [$K_"crit"$], [Value of $K$ on the CCM/DCM boundary], [1],
  [$delta$], [DCM diode-conduction duty fraction], [1],
  [$phi$], [DAB phase shift. Also load angle $arctan(omega L/R)$ and, as $phi_1$, fundamental displacement], [$"rad"$],
  [$theta$], [PSFB phase shift between legs, $0$ to $pi$], [$"rad"$],
  [$D_phi$], [DAB shift ratio $phi/pi$, in $[-0.5, 0.5]$], [1],
  [$d$], [DAB voltage ratio $n V_2/V_1$. Elsewhere, instantaneous duty $d(t)$], [1],
  [$C_"oss", C_j$], [MOSFET output capacitance. $C_j$ is the same device capacitance in QRC], [$"F"$],
)

== AC-DC rectifiers and power factor (Week 8)

#symbol-table(
  [$V_m$], [Peak AC voltage. $V_(m,"ph")$ phase, $V_(m,"LL")$ line-to-line], [$"V"$],
  [$V_"dc"$], [Average rectified voltage], [$"V"$],
  [$V_"rms"$], [RMS of the named voltage], [$"V"$],
  [$I_s, I_(s 1), I_(s n)$], [Total RMS line current, fundamental RMS, $n$-th harmonic RMS], [$"A"$],
  [$I_d$], [Flat DC-side current with a large smoothing inductor], [$"A"$],
  [$alpha$], [Thyristor firing delay from the natural commutation point. Also the QRC resonant angle], [$"rad"$],
  [$t_alpha$], [Firing delay time, $alpha/omega$], [$"s"$],
  [$beta$], [Extinction angle, $R$-$L$ rectifier or AC controller], [$"rad"$],
  [$gamma$], [Thyristor turn-off margin], [$"rad"$],
  [$mu$], [Commutation overlap angle from AC-side inductance], [$"rad"$],
  [$phi_1$], [Phase of the fundamental current relative to voltage], [$"rad"$],
  [$"DPF"$], [Displacement power factor, $cos phi_1$], [1],
  [$"DF"$], [Distortion factor, $I_(s 1)/I_s$], [1],
  [$"THD"$], [Total harmonic distortion of the named waveform], [1],
  [$"PF"$], [Power factor $P/S$], [1],
  [$"FF", "RF"$], [Form factor $V_"rms"/V_"dc"$, ripple factor $sqrt("FF"^2 - 1)$], [1],
  [$L_"pfc"$], [Boost PFC inductor], [$"H"$],
  [$C_o$], [PFC bulk capacitor], [$"F"$],
  [$r$], [Peak-to-peak ripple as a fraction of the peak current], [1],
  [$t_"hold"$], [Hold-up time during an AC dropout], [$"s"$],
  [$omega, f_"line"$], [AC angular frequency and line frequency (50 Hz or 60 Hz)], [$"rad/s", "Hz"$],
)

== DC-AC inverters, SPWM, AC-AC (Week 9)

#symbol-table(
  [$m_a$], [Amplitude modulation ratio, $hat(V)_"control"/hat(V)_"tri"$], [1],
  [$m_f$], [Frequency modulation ratio, $f_s/f_1$], [1],
  [$f_1$], [Fundamental output frequency], [$"Hz"$],
  [$hat(V)_"tri", hat(V)_"control"$], [Peaks of the carrier and the sine reference], [$"V"$],
  [$V_"DC"$], [Inverter DC-link voltage], [$"V"$],
  [$V_(o 1), V_("LL" 1)$], [Fundamental peak, phase or line-to-line as labelled], [$"V"$],
  [$v_"no"$], [Load neutral to DC midpoint], [$"V"$],
  [$v_"CM"$], [Common-mode voltage, $(v_(a o) + v_(b o) + v_(c o))/3$], [$"V"$],
  [$i_"leak"$], [Common-mode ground current], [$"A"$],
  [$C_"parasitic"$], [Capacitance from the circuit to earth], [$"F"$],
  [$L_f, C_f$], [Inverter output filter], [$"H", "F"$],
  [$f_c$], [LC cutoff. In modeling, $f_c$ is also the loop crossover], [$"Hz"$],
  [$C_"bus"$], [Single-phase DC-bus capacitor for $2 omega$ power], [$"F"$],
  [$Delta V_("cap", "pp")$], [Peak-to-peak $2 omega$ ripple on $C_"bus"$], [$"V"$],
  [$V_(o, "rms")$], [AC-controller RMS output], [$"V"$],
)

== State-space averaging (Week 10)

#symbol-table(
  [$x, u$], [State vector $[i_L, v_C]^T$ and input $v_g$], [mixed],
  [$d(t)$], [Instantaneous duty, $D + hat(d)$], [1],
  [$X, U, D$], [DC operating point. $A X + B U = 0$], [mixed],
  [$hat(x), hat(u), hat(d)$], [Small-signal perturbations], [mixed],
  [$A_1, B_1$], [State and input matrices, switch on], [$"1/s"$, mixed],
  [$A_2, B_2$], [State and input matrices, switch off], [$"1/s"$, mixed],
  [$A, B$], [Duty-weighted averages of the on and off matrices], [mixed],
  [$F$], [Duty-perturbation vector $(A_1 - A_2) X + (B_1 - B_2) U$], [mixed],
  [$s$], [Laplace variable], [$"rad/s"$],
  [$I$], [Identity matrix. $I$ is also a current when subscripted], [1],
  [$G_(v d)$], [$hat(v)_o/hat(d)$ at fixed input], [$"V"$],
  [$G_(v g)$], [$hat(v)_o/hat(v)_g$ at fixed duty], [1],
  [$G_(i d)$], [$hat(i)_L/hat(d)$], [$"A"$],
  [$omega_0$], [Resonant or filter natural frequency, as labelled], [$"rad/s"$],
  [$Q, zeta$], [Quality factor and damping ratio, $zeta = 1/(2 Q)$], [1],
  [$G_(v d 0)$], [DC gain $G_(v d)(0)$], [$"V"$],
  [$omega_(z, "RHP")$], [Right-half-plane zero], [$"rad/s"$],
  [$f_(z, "RHP")$], [$omega_(z, "RHP")/(2 pi)$], [$"Hz"$],
  [$r_C$], [Capacitor ESR], [$Omega$],
  [$omega_(z, "ESR")$], [ESR zero, $1/(r_C C)$], [$"rad/s"$],
)

== Quasi-resonant converters (Weeks 3–4 appendix)

#symbol-table(
  [$L_r, C_r$], [Resonant inductor and capacitor], [$"H", "F"$],
  [$Z_0$], [Tank impedance $sqrt(L_r/C_r)$], [$Omega$],
  [$omega_0, f_0$], [Tank frequency $1/sqrt(L_r C_r)$ and $omega_0/(2 pi)$], [$"rad/s", "Hz"$],
  [$Phi$], [Normalized load. ZCS uses current over $V/Z_0$; ZVS uses the reciprocal], [1],
  [$g$], [QRC gain function that replaces PWM $D$], [1],
  [$alpha$], [Resonant interval, $arcsin(-Phi)$, when this symbol is not a firing angle], [$"rad"$],
  [$R_n$], [Normalized load $R/Z_0$], [1],
)

== Overloaded letters

$n$ is $N_2/N_1$ on a transformer and the harmonic number in $I_(s n)$. $phi$ is a DAB/PSFB angle, a load angle, or $phi_1$. $alpha$ is a firing angle or a resonant angle. $Q$ is reactive power or the quality factor. $d$ is a DAB voltage ratio or a time-varying duty. $f_c$ is an LC cutoff or a loop crossover. $omega_0$ is a resonant tank or a converter natural frequency. $L_k$ is secondary-referred in the forward overlap formulas and primary-referred in the DAB power formula.
