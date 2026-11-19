// Converter atlas: Wikimedia Commons schematics (not hand-drawn).
#let commons = "../assets/commons/"

#let topo(title, file, note: none) = block(
  width: 100%,
  breakable: false,
  inset: (x: 4pt, y: 5pt),
  stroke: 0.45pt + luma(150),
)[
  #text(size: 9pt, weight: "bold")[#title]
  #if note != none [
    #text(size: 7.5pt)[ — #note]
  ]
  #v(0.2em)
  #align(center)[
    #image(commons + file, width: 95%)
  ]
]

#let todo(title, hint) = block(
  width: 100%,
  breakable: false,
  inset: 8pt,
  stroke: (paint: luma(120), dash: "dashed"),
)[
  #text(size: 9pt, weight: "bold")[#title]
  #v(0.25em)
  #text(size: 8pt)[TODO: find Commons schematic — #hint]
]

= Converter atlas, topologi-tegninger, tegn converteren

Printed schematics from Wikimedia Commons (`assets/commons/SOURCES.md`). Flip here when the exam asks you to draw a topology. Do not invent CeTZ drawings.

#columns(2, gutter: 0.55cm)[

#topo([Buck], "buck.svg")
#topo([Boost], "boost.svg")
#topo([Buck-boost], "buckboost.svg")
#topo([Cuk], "cuk.svg")
#topo([Flyback], "flyback.svg")
#topo([Forward, tertiary reset], "forward.svg", note: [Commons labels the reset winding $N_2$ and the secondary $N_3$])
#topo([Two-transistor forward], "two_transistor_forward.png")
#todo([PSFB], [no usable Commons schematic for a phase-shifted full bridge])
#todo([DAB], [no usable Commons schematic for a dual active bridge])
#topo([1φ diode bridge], "diode_bridge.svg")
#topo([3φ bridge, 6-pulse], "rect_3ph.svg")
#topo([Boost PFC], "boost_pfc.png")
#topo([1φ half-bridge VSI], "half_bridge_vsi.jpg")
#topo([1φ full-bridge VSI], "full_bridge_vsi.png")
#topo([3φ VSI], "vsi_3ph.png")
#topo([AC voltage controller], "ac_voltage_controller.png")

]
