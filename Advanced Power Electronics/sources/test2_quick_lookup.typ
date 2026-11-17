= Test 2 quick lookup

Read the gain column first. The limit column is the condition for that gain.

== Isolated DC/DC

#table(
  columns: (2.7cm, 1fr, 5.4cm),
  align: (left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Topology*],
    table.cell(fill: luma(228))[*Gain*],
    table.cell(fill: luma(228))[*Limit*],
  ),
  [Flyback CCM],
  [$V_o / V_"in" = (n D) / (1 - D)$],
  [$V_"sw" = V_"in" / (1 - D)$. DCM if $K < ((1 - D) / n)^2$.],
  [Flyback DCM],
  [$V_o / V_"in" = D / sqrt(K)$, $K = 2 L_m / (R T_s)$],
  [$n$ is not a factor in this gain. $I_"in" = P_o / V_"in"$.],
  [Forward, tertiary reset],
  [$V_o / V_"in" = (N_2 / N_1) D$],
  [$D_"max" = 1 / (1 + N_3 / N_1)$. $V_"sw" = V_"in" (1 + N_1 / N_3)$.],
  [Two-transistor forward],
  [$V_o / V_"in" = (N_2 / N_1) D$],
  [$D < 0.5$. Each switch blocks $V_"in"$ only.],
  [Forward with overlap],
  [$V_o = (N_2 / N_1) (D - t_"ov" / T_s) V_"in"$],
  [$t_"ov" = I_o L_(k,s) / (n V_"in")$. Single-ended drop $f_s L_(k,s) I_o$.],
  [PSFB],
  [$V_o = n (theta / pi - Delta D) V_"in"$],
  [$Delta D = 4 f_s L_"lk" I_o / (n V_"in")$. Devices near 50% duty.],
  [DAB, SPS],
  [$P = (n V_1 V_2) / (2 pi f_s L_k) phi (1 - abs(phi) / pi)$],
  [$P_"max" = n V_1 V_2 / (8 f_s L_k)$ at $phi = pi / 2$. $phi > 0$ is port 1 to port 2.],
)

$n = N_2 / N_1$. Set $n = 1$ in the DAB formula when $V_2$ is already referred to the primary. Full-bridge or center-tap forward overlap drops $2 f_s L_(k,s) I_o$.

== AC-DC rectifiers, ensretter

#table(
  columns: (3.2cm, 1fr, 1fr, 2.6cm),
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Rectifier*],
    table.cell(fill: luma(228))[*Diode $V_"dc"$*],
    table.cell(fill: luma(228))[*SCR $V_"dc"$*],
    table.cell(fill: luma(228))[*PIV*],
  ),
  [1φ half-wave, $R$],
  [$V_m / pi$],
  [$V_m (1 + cos alpha) / (2 pi)$],
  [$V_m$],
  [1φ full-wave bridge],
  [$2 V_m / pi$],
  [$2 V_m / pi cos alpha$ if continuous $L$. $V_m / pi (1 + cos alpha)$ if $R$],
  [$V_m$ (bridge), $2 V_m$ (center-tap)],
  [3φ half-wave],
  [$3 sqrt(3) V_(m, "ph") / (2 pi)$],
  [diode value times $cos alpha$],
  [$sqrt(3) V_(m, "ph")$],
  [3φ bridge, 6-pulse],
  [$3 V_(m, "LL") / pi approx 1.35 V_("LL", "rms")$],
  [diode value times $cos alpha$],
  [$V_(m, "LL")$],
)

$"PF" = "DF" dot "DPF" = cos phi_1 / sqrt(1 + "THD"^2)$, with $"DF" = I_(s 1) / I_s$ and $"DPF" = cos phi_1$.

$"FF" = V_"rms" / V_"dc"$, $"RF" = sqrt("FF"^2 - 1)$.

Boost PFC, $V_"in"$ as line RMS: $L_"pfc" >= sqrt(2) V_"in" (V_o - sqrt(2) V_"in") / (f_s Delta I_L V_o)$ and $V_o > sqrt(2) V_"in"$. Bulk capacitor from peak-to-peak ripple: $C_o >= P_o / (2 pi f_"line" V_o Delta V_(o, "pp"))$.

== DC-AC inverters, vekselretter

#table(
  columns: (3.4cm, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Inverter*],
    table.cell(fill: luma(228))[*Square-wave fundamental*],
    table.cell(fill: luma(228))[*Linear SPWM, $m_a <= 1$*],
  ),
  [1φ half-bridge],
  [peak $2 V_"DC" / pi$],
  [peak $m_a V_"DC" / 2$],
  [1φ full-bridge],
  [peak $4 V_"DC" / pi$],
  [peak $m_a V_"DC"$. RMS $m_a V_"DC" / sqrt(2)$],
  [3φ line-to-line],
  [peak $2 sqrt(3) V_"DC" / pi$],
  [RMS $0.612 m_a V_"DC"$],
)

$m_a = hat(V)_"control" / hat(V)_"tri"$, $m_f = f_s / f_1$. Filter: $10 f_1 < f_c < f_s / 10$, $f_c = 1 / (2 pi sqrt(L_f C_f))$.

AC controller, resistive load: $V_(o, "rms") = V_s sqrt(1 - alpha / pi + sin(2 alpha) / (2 pi))$.

== Small-signal $G_(v d)$

Canonical shape, $omega_z$ absent on the buck:

$ G_(v d)(s) = G_(v d 0) (1 - s / omega_z) / (1 + s / (Q_f omega_0) + (s / omega_0)^2) $

#table(
  columns: (2.6cm, 1fr, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Converter*],
    table.cell(fill: luma(228))[*$G_(v d 0)$*],
    table.cell(fill: luma(228))[*$omega_0$, $Q_f$*],
    table.cell(fill: luma(228))[*Zero*],
  ),
  [Buck],
  [$V_"in"$],
  [$1 / sqrt(L C)$, $R sqrt(C / L)$],
  [No RHP zero. ESR zero $1 / (r_C C)$],
  [Boost],
  [$V_o / (1 - D)$],
  [$(1 - D) / sqrt(L C)$, $(1 - D) R sqrt(C / L)$],
  [RHP $(1 - D)^2 R / L$],
  [Buck-boost],
  [$V_o / (D (1 - D))$],
  [$(1 - D) / sqrt(L C)$, $(1 - D) R sqrt(C / L)$],
  [RHP $(1 - D)^2 R / (D L)$],
)

Averaged matrices: $A = D A_1 + (1 - D) A_2$, $B = D B_1 + (1 - D) B_2$, $F = (A_1 - A_2) X + (B_1 - B_2) U$.
