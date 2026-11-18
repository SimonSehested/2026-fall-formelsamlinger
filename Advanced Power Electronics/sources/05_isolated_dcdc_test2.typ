#import "../../templates/formula-sheet/lib.typ": recipe, traps, sym-here

= Isolated DC/DC, flyback, forward, PSFB, DAB

$n = N_2 / N_1$ in every gain below. Lossless volt-second balance fixes CCM ratios. Leakage does not change the ideal ratio until an overlap interval is included.

== Flyback, CCM and DCM, $K$

=== Flyback CCM, continuous magnetizing current

#sym-here("V_in", "V_o", "n", "D", "D'", "T_s", "L_m", "I_in", "I_o", "L")

$
  V_"in" D T_s = (V_o / n) (1 - D) T_s
  quad arrow.r.double quad
  V_o / V_"in" = (n D) / (1 - D)
$

Energy sits in $L_m$ while the switch is on and moves to the output while it is off. The CCM gain does not depend on $R$.

$
  Delta I_p = (V_"in" D T_s) / L_m, quad
  Delta I_s = Delta I_p / n, quad
  I_"in" = (n D) / (1 - D) I_o
$

$
  V_"sw" = V_"in" + V_o / n = V_"in" / (1 - D), quad
  V_D = n V_"in" + V_o = V_o / D
$

$ Delta V_o / V_o = (D T_s) / (R C) $

Output ripple follows the buck-boost pattern: it depends on $D$, $R$, and $C$, not on an $8 L C$ term.

=== Flyback DCM, $K$, boundary

#sym-here("K", "K_crit", "L_m", "L", "T_s", "D", "n", "V_o", "V_in", "P", "I_in")

$
  K = (2 L_m) / (R T_s), quad
  K_"crit" = ((1 - D) / n)^2
$

CCM when $K > K_"crit"$. DCM when $K < K_"crit"$. On the boundary the two gains match.

$
  V_o / V_"in" = D / sqrt(K), quad
  P_"in" = (V_"in"^2 D^2 T_s) / (2 L_m)
$

This DCM gain has no extra factor $n$, because $K$ is built from primary $L_m$ and the load $R$. After $V_o$ is known, $I_"in" = P_o / V_"in"$ with $P_o = V_o^2 / R$. The CCM current ratio does not apply. Primary peak equals the whole ramp, $hat(i)_p = V_"in" D T_s / L_m$.

#recipe(
  title: "Flyback CCM or DCM",
  use-when: [given $f_s$, $L_m$, $R$, $D$, $n$, and usually $V_"in"$],
  steps: (
    [Compute $K = 2 L_m / (R T_s)$ and $K_"crit" = ((1 - D) / n)^2$.],
    [If $K > K_"crit"$, $V_o = n D V_"in" / (1 - D)$ and $I_"in" = n D I_o / (1 - D)$.],
    [If $K < K_"crit"$, $V_o = V_"in" D / sqrt(K)$, then $I_"in" = V_o^2 / (R V_"in")$.],
    [Ripple in CCM: $Delta V_o / V_o = D T_s / (R C)$. Peak magnetizing ramp: $V_"in" D T_s / L_m$.],
  ),
  fast-checks: [$n = 2$, $D = 0.5$, CCM gives $V_o = 2 V_"in"$. Smaller $L_m$ or larger $R$ moves the converter into DCM.],
)

#traps(
  [Inserting $n$ into the DCM gain $D / sqrt(K)$.],
  [Using $I_"in" = n D I_o / (1 - D)$ after the current has become discontinuous.],
  [Using the buck $8 L C$ ripple on a flyback.],
)

== Forward converter, tertiary reset, two-transistor

=== Three-winding forward, $N_3$, $D_"max"$

#sym-here("N_1", "V_in", "V_o", "D", "D_R", "D_max", "K", "L", "T_s")

The output stage is a buck fed by $(N_2 / N_1) V_"in"$ during the on interval. Magnetizing current returns through $N_3$ and $D_3$ after turn-off.

$
  D_R = (N_3 / N_1) D, quad
  D_R <= 1 - D, quad
  D_"max" = 1 / (1 + N_3 / N_1)
$

$
  V_o / V_"in" = (N_2 / N_1) D, quad
  v_(T, "off") = V_"in" (1 + N_1 / N_3)
$

$D_"max" = 0.5$ only when $N_3 = N_1$. The gain formula is valid for $D <= D_"max"$.

Secondary diode blockings: $V_(D 1) = (N_2 / N_1) V_"in"$ and $V_(D 2) = (N_2 / N_1) V_"in" (1 + N_1 / N_3)$.

$
  V_o / V_"in" = (N_2 / N_1) / (1 + sqrt(1 + 4 K / D^2)), quad
  K = 2 L / (R T_s)
$

$K$ uses the output inductor. This is the course DCM gain from the Week 5 notes.

=== Two-transistor forward

#sym-here("N_1", "V_in", "V_o", "D")

Both transistors switch together. Reset diodes clamp the magnetizing energy back to $V_"in"$. Each transistor blocks $V_"in"$, and $D < 0.5$. The CCM gain is still $(N_2 / N_1) D$. There is no tertiary winding.

#recipe(
  title: "Forward reset and device voltage",
  use-when: [three-winding forward; choose $N_3$ or check a given duty],
  steps: (
    [$D = (V_o / V_"in") (N_1 / N_2)$ from the CCM gain.],
    [$D_R = (N_3 / N_1) D$ and require $D_R <= 1 - D$.],
    [$D_"max" = N_1 / (N_1 + N_3)$. Reject the design if the required $D$ exceeds $D_"max"$.],
    [Rate the switch at $V_"in" (1 + N_1 / N_3)$.],
  ),
  fast-checks: [$N_1 = N_3$ gives $D_"max" = 0.5$ and $v_(T, "off") = 2 V_"in"$.],
)

== Commutation overlap, $t_"ov"$, $Delta D$

#sym-here("t_ov", "Delta D", "L_(k,s)", "I_o", "N_1", "V_in", "T_s", "Delta V_o,ov", "f_s", "D", "D_eff", "V_o", "n")

Leakage $L_(k,s)$ on the secondary keeps both rectifier diodes in conduction while $i$ in $L_(k,s)$ ramps from 0 to $I_o$. During that overlap the LC-filter input is 0 V, so those volt-seconds never reach the output.

$
  t_"ov" = (I_o L_(k,s)) / ((N_2 / N_1) V_"in"), quad
  Delta D = t_"ov" / T_s
$

$
  Delta V_(o,"ov") = f_s L_(k,s) I_o
  quad "single-ended", quad
  Delta V_(o,"ov") = 2 f_s L_(k,s) I_o
  quad "full-bridge or center-tap"
$

$
  V_o = (N_2 / N_1) V_"in" (D - t_"ov" / T_s) = (N_2 / N_1) D_"eff" V_"in"
$

The drop grows with $f_s$ and $I_o$. The same effect is an equivalent output resistance $f_s L_(k,s)$ on a single-ended forward. If leakage is given on the primary, $L_(k,s) = (N_2 / N_1)^2 L_(k, 1)$.

#recipe(
  title: "Overlap time and voltage drop",
  use-when: [forward or bridge rectifier with a stated leakage and a flat $I_o$],
  steps: (
    [Refer $L_(k,s)$ to the secondary if the datum is primary: multiply by $(N_2 / N_1)^2$.],
    [$t_"ov" = I_o L_(k,s) / (n V_"in")$ with $n = N_2 / N_1$.],
    [Single-ended: $Delta V_(o,"ov") = f_s L_(k,s) I_o$. Two commutations per cycle: double that drop.],
    [$V_o = n V_"in" (D - t_"ov" / T_s)$.],
  ),
  fast-checks: [$t_"ov"$ scales with $I_o$ and $L_(k,s)$, and it shrinks if $V_"in"$ or $n$ rises.],
)

== Phase-shifted full bridge, PSFB, $theta$

#sym-here("theta", "D", "n", "V_in", "V_o", "Delta D", "f_s", "L_lk", "I_o", "D_eff", "C_oss", "L")

All four primary devices run near 50% duty with dead time. The shift $theta$ between the legs sets the pulse width of $v_"AB"$.

$
  D = theta / pi, quad
  V_o = n D V_"in" = (n theta / pi) V_"in"
$

Primary current must swing by $2 I_o / n$ in $L_"lk"$ at each polarity change, and that reversal happens twice per cycle.

$
  Delta D = (4 f_s L_"lk" I_o) / (n V_"in"), quad
  D_"eff" = D - Delta D, quad
  V_o = n D_"eff" V_"in"
$

ZVS uses leakage energy to swing $C_"oss"$ during the dead time:

$ (1 / 2) L_"lk" I_"peak"^2 > (4 / 3) C_"oss" V_"in"^2 $

The leading leg still has the reflected load current. The lagging leg commutates in the freewheel interval and loses ZVS first as $I_o$ falls.

Rectified pulses repeat at $2 f_s$. Inductor ripple peaks at $D = 0.5$:

$ Delta i_(L, "max") = (n V_"in") / (8 L f_s) $

CCM requires $I_o >= Delta i_L / 2$. Switch voltage is $V_"in"$. A center-tap secondary diode sees $2 n V_"in"$.

== Dual active bridge, DAB, phase shift $phi$

#sym-here("phi", "P", "n", "V_1", "f_s", "L_k", "D_phi", "d_v")

Two full bridges and a series $L_k$ (primary-referred). Both bridges run at 50%. Power is set by $phi$ between the two square waves. $phi > 0$ sends power from $V_1$ to $V_2$. $phi < 0$ reverses it. $phi = 0$ transfers no average power.

$
  P = (n V_1 V_2) / (2 pi f_s L_k) phi (1 - abs(phi) / pi)
  = (n V_1 V_2) / (2 f_s L_k) D_phi (1 - abs(D_phi))
$

for $abs(phi) <= pi / 2$ and $D_phi = phi / pi$.

$ P_"max" = (n V_1 V_2) / (8 f_s L_k) $ at $phi = pi / 2$.

// TODO: verify from source. Course notes place n in the numerator with n = N2/N1 and Lk on the primary.
Peak inductor current at the switching instants, $D_phi > 0$:

$
  hat(i)_L = (V_1 + (2 D_phi - 1) n V_2) / (4 f_s L_k), quad
  i_L (0) = ((2 D_phi - 1) V_1 - n V_2) / (4 f_s L_k)
$

Voltage ratio $d_v = n V_2 / V_1$. For $phi > 0$, bridge $H_1$ has ZVS for every $D_phi > 0$ when $d_v <= 1$, and needs $D_phi >= (d_v - 1) / (2 d_v)$ when $d_v > 1$. Bridge $H_2$ has ZVS for every $D_phi > 0$ when $d_v >= 1$, and needs $D_phi >= (1 - d_v) / 2$ when $d_v < 1$. Matched ports ($d_v = 1$) keep ZVS on both bridges over the whole SPS range. A mismatch loses ZVS at small $abs(phi)$.

#recipe(
  title: "DAB phase shift from power",
  use-when: [SPS DAB, requested $P$ between 0 and $P_"max"$, $phi$ in $[0, pi/2]$],
  steps: (
    [Set $k = n V_1 V_2 / (2 f_s L_k)$, so $P = k D_phi (1 - D_phi)$.],
    [Solve $D_phi = (1 - sqrt(1 - 4 P / k)) / 2$. This is the root in $[0, 0.5]$.],
    [$phi = pi D_phi$. Use the negative sign to reverse power.],
    [Check $d_v = n V_2 / V_1$ against the ZVS bounds above if soft switching is required.],
  ),
  fast-checks: [$P_"max"$ makes the discriminant zero and $D_phi = 0.5$. $P = 0$ gives $D_phi = 0$.],
)

#traps(
  [Quoting $D_"max" = 0.5$ for a tertiary forward when $N_3 eq.not N_1$.],
  [One overlap drop on a full-bridge secondary. That secondary commutates twice per cycle.],
  [PSFB duty taken from a single-device PWM command. The command is near 50%; $theta$ sets $D$.],
  [DAB power sign. Positive $phi$ is $V_1$ leading, power from port 1 to port 2.],
)
