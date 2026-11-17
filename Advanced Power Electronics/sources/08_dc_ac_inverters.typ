#import "../../templates/formula-sheet/lib.typ": recipe, traps

= DC-AC inverters, vekselretter, SPWM, AC-AC

== Single-phase voltage-source inverters

Half-bridge: split DC bus, pole taken from the leg to the capacitor midpoint. Leg voltage is $plus.minus V_"DC" / 2$. Local average with upper-switch duty $d$ is $(2 d - 1) V_"DC" / 2$. Dead time keeps the two devices from shorting the bus.

Square-wave half-bridge, 50% at $f_1$:

$
  hat(V)_(o 1) = 2 V_"DC" / pi, quad
  V_(o 1, "rms") = sqrt(2) V_"DC" / pi, quad
  V_(o, "rms") = V_"DC" / 2
$

Full-bridge output is $v_(a b) = v_(a o) - v_(b o)$, levels $+ V_"DC"$, 0, $- V_"DC"$. Square-wave diagonal switching uses only the two rails:

$
  hat(V)_(o 1) = 4 V_"DC" / pi, quad
  V_(o 1, "rms") = 2 sqrt(2) V_"DC" / pi, quad
  V_(o, "rms") = V_"DC"
$

Both two-level square waves have $"THD"_v = sqrt(pi^2 / 8 - 1) approx 0.483$. Each switch blocks $V_"DC"$. Inductive current uses the anti-parallel diode when the commanded voltage and the current have opposite signs.

== Three-phase VSI, six-step, 180°

Each device conducts 180°. Transitions are 60° apart, and three devices are on at once. Pole voltages versus the DC midpoint are $plus.minus V_"DC" / 2$.

$ v_"no" = (v_(a o) + v_(b o) + v_(c o)) / 3, quad v_("an") = v_(a o) - v_"no" $

Line-to-line waveforms are quasi-square: $120 degree$ at $plus.minus V_"DC"$ and $60 degree$ at zero. Triplen harmonics cancel between phases.

$
  hat(V)_("LL" 1) = 2 sqrt(3) V_"DC" / pi, quad
  V_("LL" 1, "rms") = sqrt(6) V_"DC" / pi approx 0.780 V_"DC"
$

$
  hat(V)_(a n 1) = 2 V_"DC" / pi, quad
  "THD"_(v, "LL") = sqrt(pi^2 / 9 - 1) approx 0.311
$

Phase voltage in six-step takes the steps $plus.minus V_"DC" / 3$ and $plus.minus 2 V_"DC" / 3$.

== Sinusoidal PWM, $m_a$, $m_f$

Compare a sine reference with a triangular carrier.

$
  m_a = hat(V)_"control" / hat(V)_"tri", quad
  m_f = f_s / f_1
$

Use $m_f >= 20$, an odd integer, so even harmonics cancel. On a three-phase bridge use an odd multiple of 3 ($21, 27, 33, ...$) so carrier triplens are common and drop out of the line-to-line voltage.

Linear range is $m_a <= 1$. Above that, the duty saturates, low-order harmonics appear, and voltage no longer scales with $m_a$. The six-step limit is the square-wave line-to-line RMS above, about 27% above the linear SPWM ceiling $0.612 V_"DC"$.

#table(
  columns: (3.6cm, 1fr, 1fr),
  align: (left + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(fill: luma(228))[*SPWM, $m_a <= 1$*],
    table.cell(fill: luma(228))[*Fundamental peak*],
    table.cell(fill: luma(228))[*Where the first sidebands sit*],
  ),
  [Half-bridge],
  [$m_a V_"DC" / 2$],
  [$m_f plus.minus 2$, $m_f plus.minus 4$],
  [Full-bridge, bipolar],
  [$m_a V_"DC"$],
  [around $f_s$. Step is $2 V_"DC"$],
  [Full-bridge, unipolar],
  [$m_a V_"DC"$],
  [around $2 f_s$. The $f_s$ carrier cancels. Step is $V_"DC"$],
  [3φ line-to-line],
  [RMS $sqrt(3) / (2 sqrt(2)) m_a V_"DC" approx 0.612 m_a V_"DC"$],
  [$m_f plus.minus 2$, $m_f plus.minus 4$. Triplens cancel in $v_"LL"$],
)

Full-bridge RMS in the linear range is $m_a V_"DC" / sqrt(2)$. Required DC link for a three-phase RMS line voltage:

$ V_"DC" = V_("LL" 1, "rms") / (0.612 m_a) $

which is at least $1.633 V_("LL" 1, "rms")$ at $m_a = 1$.

A one-sixth third-harmonic addition on the references raises the linear line-to-line ceiling to $V_"DC" / sqrt(2) approx 0.707 V_"DC"$, about 15% more bus utilization. The triplen does not appear in $v_"LL"$.

== Common-mode voltage and leakage

$ v_"CM" = (v_(a o) + v_(b o) + v_(c o)) / 3 $

Active states sit at $plus.minus V_"DC" / 6$. The two zero states sit at $plus.minus V_"DC" / 2$. That step drives

$ i_"leak" approx C_"parasitic" (d v_"CM") / (d t) $

through PV-to-frame or winding-to-frame capacitance.

== Output LC filter, $f_c$

$
  f_c = 1 / (2 pi sqrt(L_f C_f)), quad
  10 f_1 < f_c < f_s / 10
$

The lower bound keeps fundamental drop and phase shift small. The upper bound puts the carrier a decade down the $-40$ dB/decade slope.

Current-ripple sizing, $r$ about 0.10 to 0.25 of peak fundamental current:

$
  L_f >= V_"DC" / (8 f_s Delta I_L)
  quad "1φ unipolar", quad
  L_f >= V_"DC" / (6 f_s Delta I_L)
  quad "3φ"
$

Capacitor reactive power at or below 5% of rated $S$:

$ C_f <= (0.05 S_"rated") / (2 pi f_1 V_("LL", "rms")^2) $

Check the pair against the $f_c$ window after both limits.

== Single-phase $2 omega$ bus capacitor

Unity-power-factor AC power is $P_"dc" (1 - cos(2 omega_1 t))$. The DC source is constant, so $C_"bus"$ takes the double-frequency term.

$
  Delta V_("cap", "pp") = P_"dc" / (2 pi f_1 C_"bus" V_"bus"), quad
  C_"bus" >= P_"dc" / (2 pi f_1 V_"bus" Delta V_("cap", "pp"))
$

== AC-AC voltage controller, RMS

Anti-parallel thyristors, supply $sqrt(2) V_s sin(omega t)$, delay $alpha$ and $pi + alpha$. Resistive load:

$
  V_(o, "rms") = V_s sqrt(1 - alpha / pi + sin(2 alpha) / (2 pi))
$

$
  P = V_(o, "rms")^2 / R, quad
  "PF" = V_(o, "rms") / V_s
$

$alpha = 0$ gives the full supply. $alpha = pi / 2$ gives $V_s / sqrt(2)$. $alpha = pi$ gives zero. $"PF"$ falls as soon as $alpha > 0$ because the current is chopped, even on a pure resistor.

On $R$-$L$, $phi_L = arctan(omega L / R)$. Control exists only for $alpha > phi_L$. If $alpha <= phi_L$ the current is still flowing at the next gate pulse, both devices stay in continuous conduction, and $V_(o, "rms") = V_s$.

#recipe(
  title: "DC link from SPWM line voltage",
  use-when: [three-phase VSI, linear SPWM, required $V_("LL", "rms")$],
  steps: (
    [Stay at $m_a <= 1$ unless the problem allows overmodulation.],
    [$V_"DC" = V_("LL" 1, "rms") / (0.612 m_a)$.],
    [If the bridge is square-wave instead, $V_("LL" 1, "rms") = sqrt(6) V_"DC" / pi$.],
    [Pick odd triple $m_f >= 21$ when harmonics in $v_"LL"$ matter.],
  ),
  fast-checks: [$m_a = 1$ needs $V_"DC" >= 1.633 V_("LL", "rms")$. Half-bridge peak is half of a full-bridge peak for the same $V_"DC"$.],
)

#recipe(
  title: "LC cutoff placement",
  use-when: [inverter sine filter, known $f_1$ and $f_s$],
  steps: (
    [Pick $f_c$ with $10 f_1 < f_c < f_s / 10$.],
    [Size $L_f$ from the allowed $Delta I_L$ (unipolar $V_"DC" / (8 f_s Delta I_L)$, three-phase $V_"DC" / (6 f_s Delta I_L)$).],
    [Size $C_f$ so fundamental reactive power stays within $0.05 S$.],
    [Recompute $f_c = 1 / (2 pi sqrt(L_f C_f))$ and move $L_f$ or $C_f$ if the window is missed.],
  ),
  fast-checks: [Unipolar sidebands start near $2 f_s$, bipolar near $f_s$.],
)

#recipe(
  title: "AC-controller RMS and the RL boundary",
  use-when: [series thyristor pair, fixed frequency, $alpha$ given],
  steps: (
    [Resistive: $V_(o, "rms") = V_s sqrt(1 - alpha / pi + sin(2 alpha) / (2 pi))$, then $P = V_(o, "rms")^2 / R$.],
    [$"PF" = V_(o, "rms") / V_s$ on that resistor.],
    [If the load is $R$-$L$, compute $phi_L = arctan(omega L / R)$.],
    [If $alpha <= phi_L$, report full voltage and no phase control.],
  ),
  fast-checks: [$alpha = 0$ returns $V_s$. $alpha = pi / 2$ on a resistor returns $V_s / sqrt(2)$.],
)

#traps(
  [Linear SPWM formulas with $m_a > 1$.],
  [Even $m_f$, or a three-phase $m_f$ that is not a multiple of 3. Even harmonics or carrier lines then remain in $v_"LL"$.],
  [Half-bridge peak written as $m_a V_"DC"$ (that is the full-bridge).],
  [AC-controller $alpha$ below the load angle treated as a partial-voltage point.],
  [Filter $f_c$ placed near $f_1$ or near $f_s$.],
)
