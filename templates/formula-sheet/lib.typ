// Shared formula-sheet theme (spec §3): A4, ~1.35 cm margins, ~10 pt body, positive spacing.

#let sheet-margin = 1.35cm
#let sheet-body-size = 10pt
#let table-inset = (x: 6pt, y: 5pt)
#let table-gutter = 4pt

#let formula-sheet(doc) = {
  set page(paper: "a4", margin: sheet-margin)
  set text(size: sheet-body-size, fill: black)
  set par(leading: 0.7em, spacing: 0.65em, justify: false)

  show heading: set text(fill: black)
  show heading.where(level: 1): it => {
    set text(size: 1.35em, weight: "bold")
    block(above: 1.1em, below: 0.55em)[#it]
  }
  show heading.where(level: 2): it => {
    set text(size: 1.15em, weight: "bold")
    block(above: 0.95em, below: 0.45em)[#it]
  }
  show heading.where(level: 3): it => {
    set text(size: 1.05em, weight: "bold")
    block(above: 0.8em, below: 0.35em)[#it]
  }

  show math.equation: set block(above: 0.55em, below: 0.55em)

  set table(
    stroke: 0.5pt + black,
    inset: table-inset,
    gutter: table-gutter,
    fill: (_, y) => if calc.odd(y) { none } else { luma(252) },
  )

  doc
}

/// Three-column Symbol | Meaning | Unit (positive inset/gutter).
#let symbol-table(..cells) = table(
  columns: (auto, 1fr, auto),
  align: (center + horizon, left + horizon, center + horizon),
  table.header(
    table.cell(fill: luma(228))[*Symbol*],
    table.cell(fill: luma(228))[*Meaning*],
    table.cell(fill: luma(228))[*Unit*],
  ),
  ..cells,
)

/// Boxed exam recipe: title, use-when, numbered steps, optional fast-checks.
#let recipe(
  title: "",
  use-when: none,
  steps: (),
  fast-checks: none,
) = block(
  fill: luma(246),
  stroke: 0.75pt + black,
  inset: 10pt,
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  breakable: false,
)[
  *Exam recipe:* #title

  #if use-when != none [
    #v(0.35em)
    _Use when:_ #use-when
  ]

  #if steps.len() > 0 [
    #v(0.4em)
    #enum(
      tight: false,
      spacing: 0.55em,
      ..steps,
    )
  ]

  #if fast-checks != none [
    #v(0.4em)
    _Fast checks:_ #fast-checks
  ]
]

/// Left-bar trap block for common mistakes.
#let traps(..items) = block(
  fill: luma(250),
  stroke: (left: 2.5pt + black),
  inset: (left: 10pt, rest: 8pt),
  width: 100%,
  above: 0.6em,
  below: 0.6em,
  breakable: false,
)[
  *Common traps*
  #v(0.25em)
  #list(
    tight: false,
    spacing: 0.45em,
    ..items,
  )
]