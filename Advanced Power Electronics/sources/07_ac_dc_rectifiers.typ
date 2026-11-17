#import "../../templates/formula-sheet/lib.typ": recipe, traps

= AC-DC rectifiers, ensretter, power factor, PFC

== Power definitions, DPF, DF, THD, effektfaktor

Sinusoidal $v$ and $i$ displaced by $phi_1$:

$
  P = V_s I_s cos phi_1, quad
  Q = V_s I_s sin phi_1, quad
  S = V_s I_s = sqrt(P^2 + Q^2)
$

$V_s$ and $I_s$ are RMS. Positive $phi_1$ is lagging current. With a sinusoidal voltage and a distorted current, only the fundamental current produces average power:

$ P = V_s I_(s 1) cos phi_1 $

$
  I_s = sqrt(I_(s 1)^2 + sum_(h = 2)^oo I_(s,h)^2), quad
  "DF" = I_(s 1) / I_s, quad
  "DPF" = cos phi_1
$

$
  "THD" = sqrt(I_s^2 - I_(s 1)^2) / I_(s 1) = sqrt(1 / "DF"^2 - 1), quad
  "DF" = 1 / sqrt(1 + "THD"^2)
$

$ "PF" = P / S = "DF" dot.c "DPF" = cos phi_1 / sqrt(1 + "THD"^2) $

A capacitor in parallel with a lagging load draws $Q_C = - V_s^2 omega C$ and does not change $P$. It only cuts the fundamental displacement. It does not remove harmonic distortion.

=== Form factor and ripple factor

$
  "FF" = V_"rms" / V_"dc", quad
  "RF" = sqrt("FF"^2 - 1)
$

$"FF" = 1$ is flat DC. For a resistive load the rectification ratio is $1 / "FF"^2$.

A single-phase bridge with a large DC inductor draws a $plus.minus I_d$ square current. Then $I_s = I_d$, $I_(s 1) = (2 sqrt(2) / pi) I_d$, $"DF" = 2 sqrt(2) / pi approx 0.900$, and $"THD" = sqrt(pi^2 / 8 - 1) approx 0.483$. Odd-harmonic RMS values are $I_(s,h) = (2 sqrt(2) / (h pi)) I_d$ for odd $h$, and even harmonics are absent. With $alpha = 0$, $"PF" = "DF"$.

== Single-phase rectifiers, half-wave, full-wave, $alpha$

Supply $v_s = V_m sin(omega t)$, $V_m = sqrt(2) V_s$. Firing delay from the zero crossing is $t_alpha = alpha / omega$.

#table(
  columns: (3.4cm, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*Case*],
    table.cell(fill: luma(228))[*$V_"dc"$*],
    table.cell(fill: luma(228))[*Notes*],
  ),
  [Half-wave diode, $R$],
  [$V_m / pi$],
  [$V_"rms" = V_m / 2$, $"FF" approx 1.57$, $"RF" approx 1.21$, PIV $= V_m$],
  [Half-wave SCR, $R$],
  [$V_m (1 + cos alpha) / (2 pi)$],
  [Conducts $alpha$ to $pi$],
  [Full-wave diode bridge, $R$],
  [$2 V_m / pi$],
  [$V_"rms" = V_m / sqrt(2)$, $"FF" approx 1.11$, $"RF" approx 0.48$, PIV $= V_m$],
  [Full-wave SCR, $R$],
  [$V_m (1 + cos alpha) / pi$],
  [$V_"rms" = (V_m / sqrt(2)) sqrt(1 - alpha / pi + sin(2 alpha) / (2 pi))$],
  [Full-wave SCR, continuous $L$],
  [$(2 V_m / pi) cos alpha$],
  [$phi_1 = alpha$, $"DF" = 2 sqrt(2) / pi$, $"PF" approx 0.900 cos alpha$],
)

Center-tap full-wave PIV is $2 V_m$. Bridge PIV is $V_m$.

With $R$-$L$ and a single diode, current continues past $pi$ until the extinction angle $beta$, where

$ sin(beta - phi_L) + sin phi_L dot.c e^(- beta / tan phi_L) = 0, quad tan phi_L = omega L / R $

The negative voltage between $pi$ and $beta$ reduces $V_"dc"$. $Z = sqrt(R^2 + (omega L)^2)$.

=== Line-commutated inversion, $alpha > 90 degree$

For continuous-current full-wave control, $V_"dc" = (2 V_m / pi) cos alpha$. The sign of $cos alpha$ sets the power direction. Current $I_d$ stays positive.

$0 <= alpha < 90 degree$ is rectifier operation. $alpha = 90 degree$ gives $V_"dc" = 0$. $90 degree < alpha < 180 degree$ makes $V_"dc"$ negative, so average power leaves the DC source and enters the AC line.

Inversion needs a DC source $E$ large enough that $I_d = (E - abs(V_"dc")) / R > 0$, a large $L_d$, and a commutation margin

$ alpha_"max" = 180 degree - gamma - mu $

Firing later than $alpha_"max"$ misses the turn-off window. The thyristor then stays in conduction and the DC side is shorted at the next half-cycle.

== Three-phase rectifiers, 3-pulse, 6-pulse

$alpha$ is measured from the natural diode commutation instant, not from the phase zero crossing. Each device in these bridges conducts $120 degree$.

$
  V_"dc" = (3 sqrt(3) V_(m, "ph")) / (2 pi) cos alpha
  quad "3-pulse", quad
  "PIV" = sqrt(3) V_(m, "ph")
$

Ripple frequency is $3 f_"line"$. $"FF" approx 1.017$ and $"RF" approx 0.183$ for the uncontrolled waveform. The uncontrolled average is about $0.827 V_(m, "ph")$ or $1.17 V_("ph", "rms")$.

$
  V_"dc" = (3 V_(m, "LL")) / pi cos alpha = (3 sqrt(2) / pi) V_("LL", "rms") cos alpha
$

about $1.35 V_("LL", "rms") cos alpha$ for the 6-pulse bridge. PIV is $V_(m, "LL")$. Ripple frequency is $6 f_"line"$. $"RF" approx 0.042$ uncontrolled.

With flat $I_d$, each 6-pulse device carries average $I_d / 3$ and RMS $I_d / sqrt(3)$. Line current RMS is $sqrt(2 / 3) I_d$, fundamental RMS is $(sqrt(6) / pi) I_d$, so $"DF" = 3 / pi approx 0.955$ and $"THD" approx 0.311$. Inversion is the same $cos alpha$ sign change as in single phase, with the same margin $alpha_"max" = 180 degree - gamma - mu$.

== Boost PFC, $L_"pfc"$, $C_o$

A diode bridge plus a boost makes the line current track $v_"ac"$. Then $phi_1 approx 0$, THD is small, and PF is near 1. The current loop is fast. The voltage loop stays below $2 f_"line"$ so it does not try to remove the double-line ripple.

The boost can shape current only while $V_o$ exceeds the AC peak:

$ V_o > sqrt(2) V_"in" $

with $V_"in"$ the RMS line voltage. Universal 85–265 V RMS therefore uses a bus near 380–400 V.

Worst high-frequency ripple is at the crest of the sine, $abs(v_"ac") = sqrt(2) V_"in"$:

$
  L_"pfc" >= (sqrt(2) V_"in" (V_o - sqrt(2) V_"in")) / (f_s Delta I_L V_o)
$

If the spec is a fraction $r = Delta I_L / hat(I)_"in"$ and $hat(I)_"in" = sqrt(2) P_o / (eta V_"in")$:

$
  L_"pfc" >= (eta V_"in"^2 (V_o - sqrt(2) V_"in")) / (f_s r P_o V_o)
$

Double-line power $P_o cos(2 omega_"line" t)$ lands on $C_o$. With peak-to-peak bus ripple $Delta V_(o,"pp")$:

$
  C_o >= P_o / (2 pi f_"line" V_o Delta V_(o,"pp"))
$

Hold-up from $V_o$ down to $V_(o, "min")$ for a time $t_"hold"$:

$ C_o >= (2 P_o t_"hold") / (V_o^2 - V_(o, "min")^2) $

Use the larger capacitor.

#recipe(
  title: "PF from a harmonic list",
  use-when: [RMS harmonics and $phi_1$ are given],
  steps: (
    [$I_s = sqrt(I_(s 1)^2 + I_(s 3)^2 + I_(s 5)^2 + dots.c)$. Skip a DC term unless the waveform has one.],
    [$"DF" = I_(s 1) / I_s$ and $"THD" = sqrt(1/"DF"^2 - 1)$.],
    [$"DPF" = cos phi_1$. $"PF" = "DF" times "DPF"$.],
    [Active power is $V_s I_(s 1) cos phi_1$ when the voltage is sinusoidal.],
  ),
  fast-checks: [$"DF" = 1$ means no harmonics. $"PF" = "DPF"$ in that case. $"THD" = 1$ with $"DPF" = 1$ gives $"PF" = 1/sqrt(2)$.],
)

#recipe(
  title: "Boost PFC inductor and bulk capacitor",
  use-when: [CCM boost PFC, ripple or hold-up spec],
  steps: (
    [Set $V_o$ above $sqrt(2)$ times the highest RMS line.],
    [Size $L_"pfc"$ from $Delta I_L$ or from $r$ and $P_o$. Both formulas match when $Delta I_L = r hat(I)_"in"$.],
    [Size $C_o$ from $Delta V_(o, "pp")$ and again from $t_"hold"$. Keep the larger value.],
    [Put the voltage-loop crossover below $2 f_"line"$.],
  ),
  fast-checks: [$L_"pfc"$ grows if $f_s$ or the allowed ripple falls. $C_o$ grows if $P_o$ rises or the allowed sag falls.],
)

#traps(
  [SCR formula for a resistive load used on a continuous-current inductive load. The inductive result is $(2 V_m / pi) cos alpha$, not $V_m (1 + cos alpha) / pi$.],
  [Firing angle on a three-phase bridge measured from the voltage zero instead of the natural commutation point.],
  [Inversion with $alpha$ past $180 degree - gamma - mu$.],
  [PFC bus at or below the AC peak. The boost then loses current control near the crest.],
  [Treating $"PF"$ as $cos phi_1$ when the current has harmonics. That cosine is only $"DPF"$.],
)
