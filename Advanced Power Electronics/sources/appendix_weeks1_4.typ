= Weeks 1–4 appendix, CCM, DCM, QRC

$K = 2 L / (R T_s) = 2 L f_s / R$. Volt-second balance gives CCM $M(D)$. Charge balance gives the current ratios. DCM when $K < K_"crit"$. $R_"crit" = 2 L f_s / K_"crit"$, and a larger $R$ is DCM.

== CCM conversion, ripple, device voltage

#table(
  columns: (2.5cm, 2.4cm, 1fr, 1fr, 2.6cm),
  align: (left + horizon, left + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Topology*],
    table.cell(fill: luma(228))[*$M = V_o / V_"in"$*],
    table.cell(fill: luma(228))[*$Delta i_L$*],
    table.cell(fill: luma(228))[*$Delta V_o$*],
    table.cell(fill: luma(228))[*Switch and diode*],
  ),
  [Buck],
  [$D$],
  [$(V_"in" - V_o) D T_s / L$],
  [$V_o (1 - D) T_s^2 / (8 L C)$],
  [$V_"in"$. $I_L = I_o$],
  [Boost],
  [$1 / (1 - D)$],
  [$V_"in" D T_s / L$],
  [$I_o D T_s / C$],
  [$V_o$. $I_L = I_o / (1 - D)$],
  [Buck-boost],
  [$D / (1 - D)$, inverted],
  [$V_"in" D T_s / L$],
  [$I_o D T_s / C$],
  [$V_"in" + abs(V_o)$. $I_L = I_o / (1 - D)$],
  [Cuk],
  [$D / (1 - D)$, inverted],
  [$V_"in" D T_s / L_1$ and $abs(V_o) (1 - D) T_s / L_2$],
  [$abs(V_o) (1 - D) T_s^2 / (8 L_2 C_2)$. $Delta V_(C 1) = I_o D T_s / C_1$],
  [$V_"in" + abs(V_o)$. $V_(C 1) = V_"in" + abs(V_o)$],
)

DC plus triangular ripple: $I_"rms"^2 = I^2 + (Delta i)^2 / 12$. A device that carries that pulse for a fraction $D$ has an extra $sqrt(D)$. Buck output ripple is also $V_o (1 - D) pi^2 / 2 (f_c / f_s)^2$ with $f_c = 1 / (2 pi sqrt(L C))$.

Lossless power: $V_"in" I_"in" = V_o I_o$ using voltage magnitudes. $D = 1$ is not a usable boost or Cuk point.

== DCM boundary and gain

#table(
  columns: (2.5cm, 1fr, 1fr, 3.2cm),
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Topology*],
    table.cell(fill: luma(228))[*$K_"crit"$*],
    table.cell(fill: luma(228))[*DCM $M$*],
    table.cell(fill: luma(228))[*$delta$*],
  ),
  [Buck],
  [$1 - D$],
  [$2 / (1 + sqrt(1 + 4 K / D^2))$],
  [$(V_"in" - V_o) D / V_o$],
  [Boost],
  [$D (1 - D)^2$. Max $4 / 27$ at $D = 1 / 3$],
  [$(1 + sqrt(1 + 4 D^2 / K)) / 2$],
  [$V_"in" D / (V_o - V_"in")$],
  [Buck-boost],
  [$(1 - D)^2$],
  [$D / sqrt(K)$],
  [$sqrt(K)$],
  [Cuk],
  [$(1 - D)^2$ with $L = L_1 parallel L_2$],
  [$D / sqrt(K)$],
  [$sqrt(K)$],
)

$K > 4 / 27$ keeps a boost in CCM at every $D$. Boost DCM voltage runs away as $R arrow.r oo$. Triangle RMS: $Delta i_L sqrt(d_"cond" / 3)$. DCM output ripple uses $Delta V_o = delta T_s (Delta i_L - I_o)^2 / (2 C Delta i_L)$. Blocking voltages match the CCM column.

== ZCS and ZVS quasi-resonant

$
  Z_0 = sqrt(L_r / C_r), quad
  omega_r = 1 / sqrt(L_r C_r), quad
  f_0 = omega_r / (2 pi)
$

$
  alpha_r = arcsin(- Phi), quad
  g = (f_s / (2 pi f_0)) (Phi / 2 + alpha_r + (1 - cos alpha_r) / Phi)
$

Full-wave ZCS: $g approx f_s / f_0$ for $0 < Phi < 1$. Half-wave keeps a load-dependent $g$. Control is by $f_s$, not by a PWM duty.

#table(
  columns: (2.6cm, 1fr, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Topology*],
    table.cell(fill: luma(228))[*ZCS $M$*],
    table.cell(fill: luma(228))[*ZVS $M$*],
    table.cell(fill: luma(228))[*$Phi$, and $Phi <= 1$*],
  ),
  [Buck],
  [$g$],
  [$1 - g$],
  [ZCS: $Z_0 I_o / V_"in"$. ZVS: $V_"in" / (Z_0 I_o)$],
  [Boost],
  [$1 / (1 - g)$],
  [$1 / g$],
  [ZCS: $Z_0 I_"in" / V_o$. ZVS: $V_o / (Z_0 I_"in")$],
  [Buck-boost],
  [$g / (1 - g)$],
  [$(1 - g) / g$],
  [ZCS: $Z_0 (I_"in" + I_o) / (V_"in" + V_o)$. ZVS: reciprocal],
)

ZCS needs the resonant current swing to clear the DC current (light enough load, $Z_0 <= V / I$). ZVS needs the opposite (heavy enough load, $Z_0 >= V / I$). ZCS still dumps $1/2 C_j V_"sw"^2 f_s$ at turn-on. ZVS absorbs $C_j$ into the resonant capacitor: $C_(r, "ext") = C_r - C_j$. Full-wave ZVS is not used. Half-wave ZVS clamps $v_"sw"$ at zero with the anti-parallel diode.

Boundary design, full-wave approximation. ZCS buck: $Z_0 = V_"in" / I_o$, $f_0 = f_s / M$, $L_r = Z_0 / omega_r$, $C_r = 1 / (omega_r Z_0)$. ZVS buck: $Z_0 = V_"in" / I_o$, $f_0 = f_s / (1 - M)$, then subtract $C_j$.

State lengths in units of $1 / omega_r$: linear or charging $Phi$, resonant $alpha_r$, recovery $(1 - cos alpha_r) / Phi$, then the rest of $T_s$.
