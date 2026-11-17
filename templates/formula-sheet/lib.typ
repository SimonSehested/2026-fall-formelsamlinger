// Shared formula-sheet theme: A4, continuous chapters, header+footer chrome.

#let sheet-margin = (x: 1.35cm, top: 1.55cm, bottom: 1.55cm)
#let sheet-body-size = 10pt
#let table-inset = (x: 6pt, y: 5pt)
#let table-gutter = 4pt

#let current-chapter() = context {
  let heads = query(heading.where(level: 1).before(here()))
  if heads.len() == 0 {
    []
  } else {
    heads.last().body
  }
}

#let sheet-chrome() = context {
  set text(size: 8pt, fill: luma(40))
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    align: (left + horizon, right + horizon),
    [#current-chapter()],
    [#counter(page).display()],
  )
}

#let formula-sheet(doc) = {
  set page(
    paper: "a4",
    margin: sheet-margin,
    header: sheet-chrome(),
    footer: sheet-chrome(),
    header-ascent: 35%,
    footer-descent: 35%,
  )
  set text(size: sheet-body-size, fill: black)
  set par(leading: 0.7em, spacing: 0.65em, justify: false)

  // Continuous flow: never force a page break before level-1 headings.
  show heading.where(level: 1): it => {
    set text(size: 1.35em, weight: "bold")
    block(breakable: false, above: 0.95em, below: 0.45em)[#it]
  }
  show heading.where(level: 2): it => {
    set text(size: 1.15em, weight: "bold")
    block(above: 0.85em, below: 0.4em)[#it]
  }
  show heading.where(level: 3): it => {
    set text(size: 1.05em, weight: "bold")
    block(above: 0.7em, below: 0.3em)[#it]
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

/// Dense Symbol | Meaning | Unit for Symboloversigt (still legible in print).
#let symbol-table(..cells) = {
  set text(size: 8pt)
  set par(leading: 0.42em)
  table(
    columns: (auto, 1fr, auto),
    align: (left + horizon, left + horizon, left + horizon),
    inset: (x: 3.5pt, y: 2.2pt),
    gutter: 0pt,
    stroke: (x: none, y: 0.35pt + luma(185)),
    fill: (_, y) => if calc.rem(y, 2) == 0 { luma(248) } else { none },
    table.header(
      table.cell(fill: luma(220))[*Symbol*],
      table.cell(fill: luma(220))[*Meaning*],
      table.cell(fill: luma(220))[*Unit*],
    ),
    ..cells,
  )
}

/// Topic lookup tables keep the roomier default `table` settings from `formula-sheet`.
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
