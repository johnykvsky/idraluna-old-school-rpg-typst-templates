#let basic_template(
  
  doc
  ) = {
  // Page setup
  import "@preview/hydra:0.6.1": hydra, anchor
  set page(
    height: 11in,
    width: 8.5in,
    margin: (inside: 0.25in, outside: 0.25in, top: 0.5in, bottom: 0.5in),
    numbering: "B1",  // page number. B is placed to mimic B/X, but you can change to "1" to just print page numbers
    header: context {set text(weight: 900); // running header
      if calc.odd(here().page()) {
        emph(hydra(1)) + h(1fr) + emph(hydra(2))
      } else {
        emph(hydra(2)) + h(1fr) + emph(hydra(1))
      }}
  )
  set par(justify: true, spacing: 2em, leading: 0.5em)  // roomy paragraph spacing with densely spaced lines

  // Font setup
  set text(
    font: "Fraunces 72pt Soft",
    size: 10pt,
    weight: 500
  )

  // Heading setup
  show heading.where(level: 1): it => [
    #align(center)[
      #text(font: "Caprasimo", size: 16pt)[#it]
    ]
  ]

  show heading.where(level: 2): it => [  // ALL CAPS section heads
    #block(below: 1em)[ #text(font: "Caprasimo", size:10pt)[ #upper(it.body) ]]
  ]

  show heading.where(level: 3): it => [  // Bold sub-sections
    #block(below: 1em)[ #text(font: "Caprasimo", size:10pt)[#it.body; ]]
  ]

  show heading.where(level: 4): it => [  // level 4 headers are all caps and inline
    #text(size:10pt, weight: 500)[#upper(it.body):]
  ]

  // Table setup
  set table(
    stroke: (_, y) => if y == 0 { (bottom: 0.8pt) },  // underline column heads
    align:left, 
    gutter: 0.5em)
  set table.cell(
    inset: 2pt,
  )
  show table.cell: it => {
    set text(size: 10pt) 
    set par(justify: false)
    if it.y==0 {
      set align(bottom)
      it
    }else{it}
  }
  show table: it => {align(center)[#it]}

  // Display document
  doc
}

// Function to print B/X style spell descriptions
#let basic_spell(spellname, range, duration, desc) = {
  grid(
    columns: (1fr, 1fr),
    inset: 2pt,
    text(font: "Caprasimo", spellname), [Range: #range],
    [], [Duration: #duration],
    grid.cell(colspan: 2, desc)
  )
}

#let basic_monster(Name, Armor: [9], HD: [1], MV: [9"], Attacks: [None], Damage: [None], NA: [1], Save: [Fighter 1], ML: [7], TT: [A], AL: [Neutral], desc) = {
  heading(level: 3)[#Name]
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 2pt,
    [Armor Class:], Armor, [No. Appearing:], NA,
    [Hit Dice:], HD, [Save As:], Save,
    [Move:], MV, [Morale:], ML,
    [Attacks:], Attacks, [Treasure Type:], TT, 
    [Damage:], Damage, [Alignment:], AL,
  )
  desc
}


#show: basic_template.with()

= Basic Sample

This template emulates the 1981 Basic dungeon game. It uses Fraunces & Caprasimo as a free alternative to the original Souvenir typeface. The majority of the text in that version is set in two columns, but sometimes introductory paragraphs appear in single-column form, as seen here.

#columns(2)[

== A Heading
#lorem(120)

=== Subheading
#lorem(35)

=== Another Subheading
#lorem(75)

==== Inline Subheading
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

#basic_spell("Hypatia's Hirsute Hex", [50'], [6 Turns])[
  Causes a targeted person, object, or creature (horse-sized or smaller) to grow a thick pelt of luxurious hair. 
]

#basic_monster(
  Armor: [4], 
  HD: [1], 
  MV: [60'], 
  Attacks: [Spear], 
  Damage: [1d6], 
  NA: [1-12 (10-120)], 
  Save: [Halfling 1], 
  ML: [4], 
  TT: [G], 
  AL: [Chaotic],
  [Scrungly Hob],
)[Funny-looking little guys, probably just a goblin? Who really knows?]

#lorem(600)
]

