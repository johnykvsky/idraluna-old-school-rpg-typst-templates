#let two_e_core_template(
  
  doc
  ) = {
  // Page setup
  import "@preview/hydra:0.6.1": hydra, anchor
  set page(
    height: 11in,
    width: 8.5in,
    margin: (inside: 0.5in, outside: 0.5in, top: 0.5in, bottom: 0.5in),
    numbering: "1",
    header: context {set text(font: "Tinos", weight: 700); // running header
      if calc.odd(here().page()) {
        upper(emph(hydra(1))) + h(1fr) + upper(emph(hydra(2)))
      } else {
        upper(emph(hydra(2))) + h(1fr) + upper(emph(hydra(1)))
      }}
  )
  set par(justify: true, spacing: 1.5em, leading: 0.5em)

  // Font setup
  set text(
    font: "Jost",
    size: 9pt,
  )

  // Heading setup
  show heading.where(level: 1): it => [
    #box(fill: rgb(10,10, 110), width: 100%, inset: 1em)[
      #align(center)[
        #text(font: "Asul", size: 16pt, fill: white)[#upper(strong(it))]
      ]
    ]
    
  ]

  show heading.where(level: 2): it => [
    #block(below: 1em)[ #text(font: "Asul", fill: rgb(10,10, 110), size:12pt)[ #it.body ]]
  ]

  show heading.where(level: 3): it => [  
    #block(below: 1em)[ #text(font: "Asul", fill: rgb(10,10, 110), size:9pt)[#it.body]]
  ]

  show heading.where(level: 4): it => [ 
    #block(below: 1em)[ #text(font: "Jost", size:9pt)[#it.body]]
  ]

  // Table setup
  set table(
    stroke: none,
    fill: (_, y) => if calc.rem(calc.round((y - 2)/3, digits: 0), 2) == 0 and y != 0 {gray.lighten(50%)},  // comment this line out to negate table shading. Or add fill: none to specific tables.
    align:left, 
    gutter: 0pt)
  set table.cell(
    inset: 0.33em,
  )
  show table.cell: it => {
    set text(size: 9pt) 
    set par(justify: false)
    if it.y==0 {
      set align(bottom)
      strong(it)
    }else{it}
  }
  show table: it => {align(center)[#it]}

  // Display document
  doc
}

#let monster_manual_statblock(
  Name, 
  Frequency: emph([Nil]),
  NA: emph([Nil]),
  AC: emph([Nil]),
  MV: emph([Nil]),
  HD: emph([Nil]),
  PctLair: emph([Nil]),
  TT: emph([Nil]),
  Attacks: emph([Nil]),
  Damage: emph([Nil]),
  SpecialAttacks: emph([Nil]),
  SpecialDefenses: emph([Nil]),
  MR: emph([Nil]),
  INT: emph([Nil]),
  AL: emph([Nil]),
  Size: emph([Nil]),
  PSI: emph([Nil]),
  PSIatkdef: emph([Nil]),
  Image: none,
  desc
) = {upper(strong(Name))
  grid(
    columns: (1fr, 1fr),
    [
      FREQUENCY: #emph(Frequency)\
      NO. APPEARING: #emph([#NA])\
      ARMOR CLASS: #emph(AC)\
      MOVE: #emph(MV)\
      HIT DICE: #emph(HD)\
      % IN LAIR: #emph(PctLair)\
      TREASURE TYPE: emph(TT)\
      NO. OF ATTACKS: #emph(Attacks)\
      DAMAGE/ATTACK: #emph(Damage)\
      SPECIAL ATTACKS: #emph(SpecialAttacks)\
      SPECIAL DEFENSES: #emph(SpecialDefenses)\
      MAGIC RESISTANCE: #emph(MR)\
      INTELLIGENCE: #emph(INT)\
      ALIGNMENT: #emph(AL)\
      SIZE: #emph(Size)\
      PSIONIC ABILITY: #emph(PSI)\
      #h(3em) Attack/Defense Modes: #emph(PSIatkdef)
    ],
    Image,
    [\ ], [],
    grid.cell(colspan: 2, desc)
  )
}

#let spell_1e(
  Name, desc,
  School: none,
  Level: [??],
  Range: [Nil],
  Duration: [Nil],
  AoE: none,
  Components: [Nil],
  CastingTime: [Nil],
  Save: [None]
) = {
  strong(Name) + if School != none {[ (#School)]}
  grid(
    columns: (1fr, 1fr),
    gutter: 4pt,
    [Level: #emph([#Level])], [Components: #emph(Components)],
    [Range: #emph(Range)], [Casting Time: #emph(CastingTime)],
    [Duration: #emph(Duration)], [Saving Throw: #emph(Save)],
    grid.cell(colspan: 2)[Area of Effect: #AoE]
  )
  if desc != none and desc != [] {
    [Explanation/description: #desc]
  }
}

#show: two_e_core_template.with()

= 2e Core Sample

#columns(3)[


This template emulates the second edition of the advanced version of the dungeon game. It uses Asul as a free alternative to the original Friz Quadrata header typeface, and ??? as an alternative to the ?? body text. The majority of the text in that version is set in two columns, but sometimes introductory paragraphs appear in single-column form, as seen here.

== A Heading
#lorem(120)

=== Subheading
#lorem(35)

=== Another Subheading
#lorem(75)

==== Sub-subheading
#lorem(35)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
  align: (left, center, center, center, center, center, center, center, center),
  [Undead], [Acol.], [Adept], [VP], [Vicar], [Curate], [Bishop], [Lama], [Patr.],
  [Skeleton], [7], [T], [T], [D], [D], [D], [D], [D],
  [Zombie], [9], [7], [T], [T], [D], [D], [D], [D],
  [Ghoul], [11], [9], [7], [T], [T], [D], [D], [D],
  [Wight], [-], [11], [9], [7], [T], [T], [D], [D],
  [Wraith], [-], [-], [11], [9], [7], [T], [T], [D],
  [Mummy], [-], [-], [-], [11], [9], [7], [T], [T],
  [Spectre], [-], [-], [-], [-], [11], [9], [7], [T],
  [Vampire], [-], [-], [-], [-], [-], [11], [9], [7]
)

#lorem(300)

#monster_manual_statblock("Bombulating Squink", 
Frequency: [Extremely Rare],
NA: 1,
AC: [-5],
MV: [15"],
HD: [24],
INT: [???],
AL: [Chaotic],
Size: [???],
Image: [#align(center+horizon)[#text(size: 48pt)[???]]]
)[The first lesson every adventurer in the Concavity learns: Beware the Bombulating Squink!]


#spell_1e("Create Milk",
School: [Conjuration],
Range: [9"],
Level: 2,
Duration: [Instant],
Components: [V/S],
AoE: [Special]
)[The effects of this spell are pretty self-explanatory, all things considered.]

]
