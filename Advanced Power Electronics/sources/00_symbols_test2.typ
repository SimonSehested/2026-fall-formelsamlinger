#import "../../templates/formula-sheet/lib.typ": symbol-table

= Symboloversigt (Test 2)

Each symbol has one meaning in this sheet. Course-only uniqueness (not shared with other courses).

== Constants and energy

#symbol-table(
  [$mu_0$], [Vacuum permeability $4 pi times 10^(-7)$], [$"H/m"$],
  [$E_L$], [Inductor energy $1/2 L I^2$], [$"J"$],
  [$E_C$], [Capacitor energy $1/2 C V^2$], [$"J"$],
)

== Circuit, isolation, PWM

#symbol-table(
  [$V_"in"$], [DC input / source], [$"V"$],
  [$V_o$], [Average load voltage (signed if inverting)], [$"V"$],
  [$V_1, V_2$], [DAB / bridge port DC voltages], [$"V"$],
  [$I_"in"$], [Average input current], [$"A"$],
  [$I_o$], [Average load current], [$"A"$],
  [$P$], [Average active power], [$"W"$],
  [$Q$], [Reactive power], [$"var"$],
  [$S$], [Apparent power], [$"VA"$],
  [$T_s$], [Switching period $1/f_s$], [$"s"$],
  [$f_s$], [Switching / carrier frequency], [$"Hz"$],
  [$D$], [Duty $t_"on"/T_s$; PSFB uses $D = theta / pi$], [1],
  [$D'$], [$1 - D$], [1],
  [$d(t)$], [Instantaneous duty $D + hat(d)$], [1],
  [$L, C, R$], [Filter $L$, $C$, load $R$], [$"H", "F", Omega$],
  [$eta$], [Efficiency $P_o / P_"in"$], [1],
  [$L_m$], [Magnetizing inductance (primary)], [$"H"$],
  [$L_(k,s)$], [Secondary-referred leakage (forward overlap)], [$"H"$],
  [$L_k$], [Primary-referred series leakage (DAB)], [$"H"$],
  [$L_"lk"$], [Primary leakage (PSFB duty loss)], [$"H"$],
  [$N_1, N_2, N_3$], [Primary, secondary, tertiary turns], [1],
  [$n$], [Turns ratio $N_2 / N_1$], [1],
  [$D_R$], [Forward reset duty $(N_3 / N_1) D$], [1],
  [$D_"max"$], [Max forward duty that still resets], [1],
  [$D_"eff"$], [Duty after overlap $D - Delta D$], [1],
  [$Delta D$], [Duty lost to commutation], [1],
  [$t_"ov"$], [Secondary diode overlap time], [$"s"$],
  [$Delta V_(o,"ov")$], [Average voltage drop from overlap], [$"V"$],
  [$Delta V_(o,"pp")$], [Peak-to-peak output / bus ripple], [$"V"$],
  [$K$], [DCM parameter $2 L / (R T_s)$; flyback uses $L_m$], [1],
  [$K_"crit"$], [CCM/DCM boundary $K$], [1],
  [$delta$], [DCM diode conduction fraction], [1],
  [$phi$], [DAB phase shift], [$"rad"$],
  [$theta$], [PSFB leg phase shift], [$"rad"$],
  [$D_phi$], [DAB ratio $phi / pi in [-0.5, 0.5]$], [1],
  [$d_v$], [DAB voltage ratio $n V_2 / V_1$], [1],
  [$C_"oss"$], [MOSFET output capacitance], [$"F"$],
)

== Rectifiers and PFC

#symbol-table(
  [$V_m$], [Peak AC; $V_(m,"ph")$ phase, $V_(m,"LL")$ line-to-line], [$"V"$],
  [$V_"dc"$], [Average rectified DC], [$"V"$],
  [$V_"rms"$], [RMS of the named voltage], [$"V"$],
  [$V_s$], [AC supply RMS], [$"V"$],
  [$I_s$], [Line current RMS], [$"A"$],
  [$I_(s 1)$], [Fundamental line-current RMS], [$"A"$],
  [$I_(s,h)$], [RMS of harmonic order $h$], [$"A"$],
  [$I_d$], [Smoothed DC-side current], [$"A"$],
  [$alpha$], [Thyristor firing delay from natural commutation], [$"rad"$],
  [$t_alpha$], [Firing delay $alpha / omega$], [$"s"$],
  [$beta$], [Extinction angle], [$"rad"$],
  [$gamma$], [Thyristor turn-off margin], [$"rad"$],
  [$mu$], [Commutation overlap from AC inductance], [$"rad"$],
  [$phi_1$], [Fundamental current phase vs voltage], [$"rad"$],
  [$phi_L$], [Load angle $arctan(omega L / R)$], [$"rad"$],
  [$"DPF"$], [Displacement PF $cos phi_1$], [1],
  [$"DF"$], [Distortion factor $I_(s 1) / I_s$], [1],
  [$"THD"$], [Total harmonic distortion], [1],
  [$"PF"$], [Power factor $P / S$], [1],
  [$"FF"$], [Form factor $V_"rms" / V_"dc"$], [1],
  [$"RF"$], [Ripple factor $sqrt("FF"^2 - 1)$], [1],
  [$L_"pfc"$], [Boost PFC inductor], [$"H"$],
  [$C_o$], [PFC bulk capacitor], [$"F"$],
  [$r$], [Ripple fraction of peak current], [1],
  [$t_"hold"$], [Hold-up time], [$"s"$],
  [$omega$], [AC / line angular frequency], [$"rad/s"$],
  [$f_"line"$], [Line frequency 50/60 Hz], [$"Hz"$],
  [$h$], [Harmonic order (odd $h$ on square-wave current)], [1],
)

== Inverters, SPWM, AC-AC

#symbol-table(
  [$m_a$], [Amplitude modulation $hat(V)_"control" / hat(V)_"tri"$], [1],
  [$m_f$], [Frequency modulation $f_s / f_1$], [1],
  [$f_1$], [Fundamental output frequency], [$"Hz"$],
  [$hat(V)_"tri"$], [Carrier peak], [$"V"$],
  [$hat(V)_"control"$], [Sine reference peak], [$"V"$],
  [$V_"DC"$], [Inverter DC link], [$"V"$],
  [$V_(o 1)$], [Fundamental output peak (phase)], [$"V"$],
  [$V_("LL" 1)$], [Fundamental line-to-line peak or RMS as labelled], [$"V"$],
  [$v_"no"$], [Neutral to DC midpoint], [$"V"$],
  [$v_"CM"$], [Common-mode $(v_(a o)+v_(b o)+v_(c o))/3$], [$"V"$],
  [$i_"leak"$], [CM ground current], [$"A"$],
  [$C_"parasitic"$], [Earth capacitance], [$"F"$],
  [$L_f, C_f$], [Inverter LC filter], [$"H", "F"$],
  [$f_c$], [Filter cutoff $1/(2 pi sqrt(L_f C_f))$], [$"Hz"$],
  [$C_"bus"$], [Single-phase $2 omega$ bus capacitor], [$"F"$],
  [$V_(o, "rms")$], [AC-controller RMS output], [$"V"$],
)

== Small-signal / SSA

#symbol-table(
  [$x, u$], [State $[i_L; v_C]$ and input $v_g$], [mixed],
  [$X, U, D$], [DC operating point], [mixed],
  [$hat(x), hat(u), hat(d)$], [Small-signal perturbations], [mixed],
  [$A_1, B_1$], [On-interval matrices], [mixed],
  [$A_2, B_2$], [Off-interval matrices], [mixed],
  [$A, B$], [Duty-averaged matrices], [mixed],
  [$F$], [Duty-to-state vector], [mixed],
  [$s$], [Laplace variable], [$"rad/s"$],
  [$bb(I)$], [Identity matrix], [1],
  [$G_(v d)$], [$hat(v)_o / hat(d)$], [$"V"$],
  [$G_(v g)$], [$hat(v)_o / hat(v)_g$], [1],
  [$G_(i d)$], [$hat(i)_L / hat(d)$], [$"A"$],
  [$G_(v d 0)$], [$G_(v d)(0)$], [$"V"$],
  [$omega_0$], [LC natural frequency (converter model)], [$"rad/s"$],
  [$Q_f$], [Filter / plant quality factor], [1],
  [$zeta$], [Damping $1/(2 Q_f)$], [1],
  [$omega_(z, "RHP")$], [RHP zero], [$"rad/s"$],
  [$f_(z, "RHP")$], [$omega_(z, "RHP") / (2 pi)$], [$"Hz"$],
  [$f_"co"$], [Loop crossover frequency], [$"Hz"$],
  [$r_C$], [Capacitor ESR], [$Omega$],
  [$omega_(z, "ESR")$], [ESR zero $1/(r_C C)$], [$"rad/s"$],
)

== QRC appendix

#symbol-table(
  [$L_r, C_r$], [Resonant tank], [$"H", "F"$],
  [$Z_0$], [$sqrt(L_r / C_r)$], [$Omega$],
  [$omega_r$], [Tank $1/sqrt(L_r C_r)$], [$"rad/s"$],
  [$f_0$], [$omega_r / (2 pi)$], [$"Hz"$],
  [$Phi$], [Normalized load (ZCS current form; ZVS reciprocal)], [1],
  [$g$], [QRC gain replacing PWM $D$], [1],
  [$alpha_r$], [Resonant interval $arcsin(-Phi)$], [$"rad"$],
  [$R_n$], [$R / Z_0$], [1],
  [$C_j$], [Device capacitance absorbed into $C_r$], [$"F"$],
)
