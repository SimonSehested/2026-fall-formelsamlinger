#import "lib.typ": formula-sheet, symbol-table, recipe, traps
#show: formula-sheet

= Smoke test — formula sheet template

== Symboloversigt (sample)

#symbol-table(
  [$U_"in"$], [Input voltage], [$"V"$],
  [$U_"out"$], [Output voltage], [$"V"$],
  [$D$], [Duty cycle], [—],
)

=== Buck CCM, duty cycle, $D$

$
  D = U_"out" / U_"in"
$

Steady-state buck in CCM: output voltage equals duty times input voltage when drops are neglected.

#recipe(
  title: "Buck duty from volt-second balance",
  use-when: [CCM buck; $U_"in"$, $U_"out"$ given; resistive drop small.],
  steps: (
    [Write inductor volt-second balance over one switching period.],
    [Set average inductor voltage to zero.],
    [Solve for $D$ and check $0 < D < 1$.],
  ),
  fast-checks: [$U_"out" <= U_"in"$ for step-down; ripple small vs average $U_"out"$.],
)

#traps(
  [Using complementary duty in a dual (boost) topology by mistake.],
  [Peak vs average input voltage in the balance equation.],
)