#import "../../templates/formula-sheet/lib.typ": symbol-table

= Symboloversigt (Test 2)

Each symbol has one meaning in this sheet. Course-only uniqueness (not shared with other courses). *Sider* lists every page with a `#sym-here` mark for that id — not freehand numbers.

== Constants and energy

#symbol-table(
  "mu_0!", [$mu_0$], [Vacuum permeability $4 pi times 10^(-7)$], [$"H/m"$],
  "E_L!", [$E_L$], [Inductor energy $1/2 L I^2$], [$"J"$],
  "E_C!", [$E_C$], [Capacitor energy $1/2 C V^2$], [$"J"$],
)

== Circuit, isolation, PWM

#symbol-table(
  "V_in", [$V_"in"$], [DC input / source], [$"V"$],
  "V_o", [$V_o$], [Average load voltage (signed if inverting)], [$"V"$],
  "V_1", [$V_1, V_2$], [DAB / bridge port DC voltages], [$"V"$],
  "I_in", [$I_"in"$], [Average input current], [$"A"$],
  "I_o", [$I_o$], [Average load current], [$"A"$],
  "P", [$P$], [Average active power], [$"W"$],
  "Q", [$Q$], [Reactive power], [$"var"$],
  "S", [$S$], [Apparent power], [$"VA"$],
  "T_s", [$T_s$], [Switching period $1/f_s$], [$"s"$],
  "f_s", [$f_s$], [Switching / carrier frequency], [$"Hz"$],
  "D", [$D$], [Duty $t_"on"/T_s$; PSFB uses $D = theta / pi$], [1],
  "D'", [$D'$], [$1 - D$], [1],
  "d(t)", [$d(t)$], [Instantaneous duty $D + hat(d)$], [1],
  "L", [$L, C, R$], [Filter $L$, $C$, load $R$], [$"H", "F", Omega$],
  "eta", [$eta$], [Efficiency $P_o / P_"in"$], [1],
  "L_m", [$L_m$], [Magnetizing inductance (primary)], [$"H"$],
  "L_(k,s)", [$L_(k,s)$], [Secondary-referred leakage (forward overlap)], [$"H"$],
  "L_k", [$L_k$], [Primary-referred series leakage (DAB)], [$"H"$],
  "L_lk", [$L_"lk"$], [Primary leakage (PSFB duty loss)], [$"H"$],
  "N_1", [$N_1, N_2, N_3$], [Primary, secondary, tertiary turns], [1],
  "n", [$n$], [Turns ratio $N_2 / N_1$], [1],
  "D_R", [$D_R$], [Forward reset duty $(N_3 / N_1) D$], [1],
  "D_max", [$D_"max"$], [Max forward duty that still resets], [1],
  "D_eff", [$D_"eff"$], [Duty after overlap $D - Delta D$], [1],
  "Delta D", [$Delta D$], [Duty lost to commutation], [1],
  "t_ov", [$t_"ov"$], [Secondary diode overlap time], [$"s"$],
  "Delta V_o,ov", [$Delta V_(o,"ov")$], [Average voltage drop from overlap], [$"V"$],
  "Delta V_o,pp", [$Delta V_(o,"pp")$], [Peak-to-peak output / bus ripple], [$"V"$],
  "K", [$K$], [DCM parameter $2 L / (R T_s)$; flyback uses $L_m$], [1],
  "K_crit", [$K_"crit"$], [CCM/DCM boundary $K$], [1],
  "delta", [$delta$], [DCM diode conduction fraction], [1],
  "phi", [$phi$], [DAB phase shift], [$"rad"$],
  "theta", [$theta$], [PSFB leg phase shift], [$"rad"$],
  "D_phi", [$D_phi$], [DAB ratio $phi / pi in [-0.5, 0.5]$], [1],
  "d_v", [$d_v$], [DAB voltage ratio $n V_2 / V_1$], [1],
  "C_oss", [$C_"oss"$], [MOSFET output capacitance], [$"F"$],
)

== Rectifiers and PFC

#symbol-table(
  "V_m", [$V_m$], [Peak AC; $V_(m,"ph")$ phase, $V_(m,"LL")$ line-to-line], [$"V"$],
  "V_dc", [$V_"dc"$], [Average rectified DC], [$"V"$],
  "V_rms", [$V_"rms"$], [RMS of the named voltage], [$"V"$],
  "V_s", [$V_s$], [AC supply RMS], [$"V"$],
  "I_s", [$I_s$], [Line current RMS], [$"A"$],
  "I_s1", [$I_(s 1)$], [Fundamental line-current RMS], [$"A"$],
  "I_s,h", [$I_(s,h)$], [RMS of harmonic order $h$], [$"A"$],
  "I_d", [$I_d$], [Smoothed DC-side current], [$"A"$],
  "alpha", [$alpha$], [Thyristor firing delay from natural commutation], [$"rad"$],
  "t_alpha", [$t_alpha$], [Firing delay $alpha / omega$], [$"s"$],
  "beta", [$beta$], [Extinction angle], [$"rad"$],
  "gamma", [$gamma$], [Thyristor turn-off margin], [$"rad"$],
  "mu", [$mu$], [Commutation overlap from AC inductance], [$"rad"$],
  "phi_1", [$phi_1$], [Fundamental current phase vs voltage], [$"rad"$],
  "phi_L", [$phi_L$], [Load angle $arctan(omega L / R)$], [$"rad"$],
  "DPF", [$"DPF"$], [Displacement PF $cos phi_1$], [1],
  "DF", [$"DF"$], [Distortion factor $I_(s 1) / I_s$], [1],
  "THD", [$"THD"$], [Total harmonic distortion], [1],
  "PF", [$"PF"$], [Power factor $P / S$], [1],
  "FF", [$"FF"$], [Form factor $V_"rms" / V_"dc"$], [1],
  "RF", [$"RF"$], [Ripple factor $sqrt("FF"^2 - 1)$], [1],
  "L_pfc", [$L_"pfc"$], [Boost PFC inductor], [$"H"$],
  "C_o", [$C_o$], [PFC bulk capacitor], [$"F"$],
  "r", [$r$], [Ripple fraction of peak current], [1],
  "t_hold", [$t_"hold"$], [Hold-up time], [$"s"$],
  "omega", [$omega$], [AC / line angular frequency], [$"rad/s"$],
  "f_line", [$f_"line"$], [Line frequency 50/60 Hz], [$"Hz"$],
  "h", [$h$], [Harmonic order (odd $h$ on square-wave current)], [1],
)

== Inverters, SPWM, AC-AC

#symbol-table(
  "m_a", [$m_a$], [Amplitude modulation $hat(V)_"control" / hat(V)_"tri"$], [1],
  "m_f", [$m_f$], [Frequency modulation $f_s / f_1$], [1],
  "f_1", [$f_1$], [Fundamental output frequency], [$"Hz"$],
  "V_tri", [$hat(V)_"tri"$], [Carrier peak], [$"V"$],
  "V_control", [$hat(V)_"control"$], [Sine reference peak], [$"V"$],
  "V_DC", [$V_"DC"$], [Inverter DC link], [$"V"$],
  "V_o1", [$V_(o 1)$], [Fundamental output peak (phase)], [$"V"$],
  "V_LL1", [$V_("LL" 1)$], [Fundamental line-to-line peak or RMS as labelled], [$"V"$],
  "v_no", [$v_"no"$], [Neutral to DC midpoint], [$"V"$],
  "v_CM", [$v_"CM"$], [Common-mode $(v_(a o)+v_(b o)+v_(c o))/3$], [$"V"$],
  "i_leak", [$i_"leak"$], [CM ground current], [$"A"$],
  "C_parasitic", [$C_"parasitic"$], [Earth capacitance], [$"F"$],
  "L_f", [$L_f, C_f$], [Inverter LC filter], [$"H", "F"$],
  "f_c", [$f_c$], [Filter cutoff $1/(2 pi sqrt(L_f C_f))$], [$"Hz"$],
  "C_bus", [$C_"bus"$], [Single-phase $2 omega$ bus capacitor], [$"F"$],
  "V_o,rms", [$V_(o, "rms")$], [AC-controller RMS output], [$"V"$],
)

== Small-signal / SSA

#symbol-table(
  "x", [$x, u$], [State $[i_L; v_C]$ and input $v_g$], [mixed],
  "X", [$X, U, D$], [DC operating point (duty also under $D$)], [mixed],
  "hat(x)", [$hat(x), hat(u), hat(d)$], [Small-signal perturbations], [mixed],
  "A_1", [$A_1, B_1$], [On-interval matrices], [mixed],
  "A_2", [$A_2, B_2$], [Off-interval matrices], [mixed],
  "A", [$A, B$], [Duty-averaged matrices], [mixed],
  "F", [$F$], [Duty-to-state vector], [mixed],
  "s", [$s$], [Laplace variable], [$"rad/s"$],
  "I", [$bb(I)$], [Identity matrix], [1],
  "G_vd", [$G_(v d)$], [$hat(v)_o / hat(d)$], [$"V"$],
  "G_vg", [$G_(v g)$], [$hat(v)_o / hat(v)_g$], [1],
  "G_id", [$G_(i d)$], [$hat(i)_L / hat(d)$], [$"A"$],
  "G_vd0", [$G_(v d 0)$], [$G_(v d)(0)$], [$"V"$],
  "omega_0", [$omega_0$], [LC natural frequency (converter model)], [$"rad/s"$],
  "Q_f", [$Q_f$], [Filter / plant quality factor], [1],
  "zeta", [$zeta$], [Damping $1/(2 Q_f)$], [1],
  "omega_z,RHP", [$omega_(z, "RHP")$], [RHP zero], [$"rad/s"$],
  "f_z,RHP", [$f_(z, "RHP")$], [$omega_(z, "RHP") / (2 pi)$], [$"Hz"$],
  "f_co", [$f_"co"$], [Loop crossover frequency], [$"Hz"$],
  "r_C", [$r_C$], [Capacitor ESR], [$Omega$],
  "omega_z,ESR", [$omega_(z, "ESR")$], [ESR zero $1/(r_C C)$], [$"rad/s"$],
)

== QRC appendix

#symbol-table(
  "L_r", [$L_r, C_r$], [Resonant tank], [$"H", "F"$],
  "Z_0", [$Z_0$], [$sqrt(L_r / C_r)$], [$Omega$],
  "omega_r", [$omega_r$], [Tank $1/sqrt(L_r C_r)$], [$"rad/s"$],
  "f_0", [$f_0$], [$omega_r / (2 pi)$], [$"Hz"$],
  "Phi", [$Phi$], [Normalized load (ZCS current form; ZVS reciprocal)], [1],
  "g", [$g$], [QRC gain replacing PWM $D$], [1],
  "alpha_r", [$alpha_r$], [Resonant interval $arcsin(-Phi)$], [$"rad"$],
  "R_n!", [$R_n$], [$R / Z_0$], [1],
  "C_j", [$C_j$], [Device capacitance absorbed into $C_r$], [$"F"$],
)
