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

/// Compact paper-scan TOC: eye-scan keywords → page number → flip.
/// Place after the title block and before Symboloversigt. Depth 2 keeps it
/// fast (chapters + sections); do not dump every `===` concept here.
#let sheet-outline(
  title: [Indholdsfortegnelse],
  depth: 2,
) = {
  set text(size: 8.5pt)
  set par(leading: 0.42em, spacing: 0.15em)
  show outline.entry.where(level: 1): set text(weight: "bold")
  block(above: 0.35em, below: 0.55em)[
    #outline(
      title: {
        set text(size: 11pt, weight: "bold")
        title
      },
      depth: depth,
      indent: n => n * 0.9em,
    )
  ]
}

/// Invisible occurrence marker. Place at every formula/section that uses the id.
/// Page lists in Symboloversigt are built only from these markers — keep them
/// exhaustive or the Sider column is wrong.
#let sym-here(..ids) = {
  for id in ids.pos() {
    [#metadata((kind: "sym-ref", id: id))<sym-ref>]
  }
}

#let _unique-sorted-pages(pages) = {
  let out = ()
  for p in pages.sorted() {
    if out.len() == 0 or out.last() != p {
      out.push(p)
    }
  }
  out
}

/// Page list for one symbol id. Shows bold red "?" when required and unmarked.
#let sym-pages(id, required: true) = context {
  let pages = _unique-sorted-pages(
    query(<sym-ref>)
      .filter(m => {
        let v = m.value
        type(v) == dictionary and v.at("kind", default: none) == "sym-ref" and v.at("id") == id
      })
      .map(m => m.location().page()),
  )
  if pages.len() == 0 {
    if required {
      text(fill: rgb("#b00000"), weight: "bold")[?]
    } else {
      [—]
    }
  } else {
    pages.map(str).join(", ")
  }
}

/// Dense Symbol | Meaning | Unit | Sider.
/// Pass rows as: `id, symbol, meaning, unit` repeated.
/// Trailing `!` on id (e.g. `"mu_0!"`) = glossary-only → "—" if unmarked, not "?".
#let symbol-table(..cells) = {
  let raw = cells.pos()
  assert(
    calc.rem(raw.len(), 4) == 0,
    message: "symbol-table expects groups of 4: id, symbol, meaning, unit",
  )
  set text(size: 8pt)
  set par(leading: 0.42em)
  let out = ()
  for i in range(0, raw.len(), step: 4) {
    let id-raw = raw.at(i)
    assert(type(id-raw) == str, message: "symbol id must be a string")
    let optional = id-raw.ends-with("!")
    let id = if optional { id-raw.slice(0, id-raw.len() - 1) } else { id-raw }
    let symbol = raw.at(i + 1)
    let meaning = raw.at(i + 2)
    let unit = raw.at(i + 3)
    out.push([#metadata((kind: "sym-decl", id: id, required: not optional))<sym-decl>#symbol])
    out.push(meaning)
    out.push(unit)
    out.push([#sym-pages(id, required: not optional)])
  }
  table(
    columns: (auto, 1fr, auto, auto),
    align: (left + horizon, left + horizon, left + horizon, left + horizon),
    inset: (x: 3.5pt, y: 2.2pt),
    gutter: 0pt,
    stroke: (x: none, y: 0.35pt + luma(185)),
    fill: (_, y) => if calc.rem(y, 2) == 0 { luma(248) } else { none },
    table.header(
      table.cell(fill: luma(220))[*Symbol*],
      table.cell(fill: luma(220))[*Meaning*],
      table.cell(fill: luma(220))[*Unit*],
      table.cell(fill: luma(220))[*Sider*],
    ),
    ..out,
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
