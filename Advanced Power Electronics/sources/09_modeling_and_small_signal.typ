#import "../../templates/formula-sheet/lib.typ": recipe, traps

= Small-signal model, state-space averaging, SSA, RHP zero

States are $x = [i_L, v_C]^T$ and the input is $u = v_g$. Capital letters are the DC point. Hats are small perturbations. $d(t) = D + hat(d)$.

== Averaged matrices

On interval: $dot(x) = A_1 x + B_1 u$. Off interval: $dot(x) = A_2 x + B_2 u$.

$
  A = D A_1 + (1 - D) A_2, quad
  B = D B_1 + (1 - D) B_2
$

$
  A X + B U = 0, quad
  X = - A^(-1) B U
$

$
  F = (A_1 - A_2) X + (B_1 - B_2) U
$

$
  (s I - A) hat(x)(s) = B hat(u)(s) + F hat(d)(s)
$

With $v_o$ equal to the capacitor voltage,

$
  G_(v d)(s) = hat(v)_o / hat(d) = mat(0, 1) (s I - A)^(-1) F
  quad "at" hat(v)_g = 0
$

$G_(v g) = hat(v)_o / hat(v)_g$ at fixed duty. $G_(i d) = hat(i)_L / hat(d)$.

Shared second-order shape when a single zero is present:

$
  G_(v d)(s) = G_(v d 0) (1 - s / omega_z) / (1 + s / (Q omega_0) + (s / omega_0)^2)
$

$zeta = 1 / (2 Q)$. The buck has no finite $omega_z$ in the ideal model.

== Buck $G_(v d)$

$
  A_1 = A_2 = mat(0, -1 / L; 1 / C, -1 / (R C)), quad
  B_1 = mat(1 / L; 0), quad
  B_2 = mat(0; 0), quad
  F = mat(V_"in" / L; 0)
$

$
  G_(v d)(s) = V_"in" / (L C s^2 + (L / R) s + 1)
$

$
  G_(v d 0) = V_"in", quad
  omega_0 = 1 / sqrt(L C), quad
  Q = R sqrt(C / L)
$

No right-half-plane zero. Capacitor ESR adds a left-half-plane zero $omega_(z, "ESR") = 1 / (r_C C)$. Phase starts at 0° and tends to $-180 degree$ from the complex poles.

== Boost $G_(v d)$ and the RHP zero

$
  A_1 = mat(0, 0; 0, -1 / (R C)), quad
  A_2 = mat(0, -1 / L; 1 / C, -1 / (R C))
$

$
  B_1 = B_2 = mat(1 / L; 0), quad
  F = mat(V_o / L; - I_L / C)
$

$
  G_(v d)(s) = V_o / (1 - D) dot.c (1 - s L / ((1 - D)^2 R)) / (1 + (L s) / ((1 - D)^2 R) + (L C s^2) / (1 - D)^2)
$

$
  omega_0 = (1 - D) / sqrt(L C), quad
  Q = (1 - D) R sqrt(C / L), quad
  omega_(z, "RHP") = (1 - D)^2 R / L
$

The zero lies in the right half-plane. Above it the magnitude slope still rises by 20 dB/decade, and the phase falls by another 90°. Together with the two poles the high-frequency phase approaches $-270 degree$. Keep the loop crossover below about one third to one fifth of $f_(z, "RHP") = omega_(z, "RHP") / (2 pi)$. A compensator pole in the right half-plane does not cancel this zero. The closed loop stays unstable under any small mismatch.

The zero moves down as $D$ increases or as $L$ increases, and it moves up as $R$ increases (lighter load).

== Buck-boost $G_(v d)$

$V_o$ in this model is the signed output of the inverting converter.

$
  A_1 = mat(0, 0; 0, -1 / (R C)), quad
  A_2 = mat(0, 1 / L; -1 / C, -1 / (R C))
$

$
  B_1 = mat(1 / L; 0), quad
  B_2 = mat(0; 0), quad
  F = mat((V_"in" - V_o) / L; I_L / C)
$

$
  G_(v d)(s) = V_o / (D (1 - D)) dot.c (1 - s (D L) / ((1 - D)^2 R)) / (1 + (L s) / ((1 - D)^2 R) + (L C s^2) / (1 - D)^2)
$

$
  omega_0 = (1 - D) / sqrt(L C), quad
  Q = (1 - D) R sqrt(C / L), quad
  omega_(z, "RHP") = (1 - D)^2 R / (D L)
$

Same bandwidth limit as the boost. The extra $D$ in the denominator of $omega_(z, "RHP")$ pulls the zero down as $D$ rises.

#recipe(
  title: [Read $G_(v d)$ from the averaged model],
  use-when: [on and off matrices are known, or the topology is buck, boost, or buck-boost],
  steps: (
    [Form $A$, $B$, and the DC point $X = - A^(-1) B U$.],
    [Form $F = (A_1 - A_2) X + (B_1 - B_2) U$.],
    [$G_(v d)$ is the capacitor-voltage row of $(s I - A)^(-1) F$.],
    [For boost or buck-boost, mark $omega_(z, "RHP")$ and set $f_c$ below $f_(z, "RHP") / 3$.],
  ),
  fast-checks: [Buck $G_(v d)(0) = V_"in"$. Boost $G_(v d)(0) = V_o / (1 - D)$. A zero with a minus sign in $(1 - s / omega_z)$ and $omega_z > 0$ is an RHP zero.],
)

#traps(
  [Buck ripple or buck compensator limits copied onto a boost. The boost zero is in the right half-plane.],
  [Cancelling $omega_(z, "RHP")$ with an RHP pole in the compensator.],
  [Placing $f_c$ near $f_(z, "RHP")$. The extra $-90 degree$ uses up the phase margin.],
  [Buck-boost $V_o$ taken as a positive magnitude inside $F$ when the matrix set above uses the signed output.],
)
