#let basic_template(
  
  doc
  ) = {
  // Page setup
  set page(
    height: 11in,
    width: 8.5in,
    margin: (inside: 0.75in, outside: 1in, top: 0.75in, bottom: 1in),
    columns: 2,
    numbering: "1",  
  )
  set columns(gutter: 0.5in)  // 0.5 in gap between columns

  set par(justify: true, spacing: 0.5em, leading: 0.5em, first-line-indent: (amount: 0.25in, all: true), linebreaks: "optimized")  // tight paragraph spacing with densely spaced lines

  // Font setup
  set text(
    font: "League Spartan",
    size: 10pt,
    weight: 300
  )
  show emph: set text(font: "Jost", weight: 300)
  set strong(delta: 200)

  // Heading setup
  show heading.where(level: 1): it => [
    #place(top+center, float: true, scope: "parent")[
      #text(size: 16pt, weight: 500)[#upper(it)]
      ]
  ]

  show heading.where(level: 2): it => [  // ALL CAPS section heads with wide spacing
    #block(below: 1em, above: 1em)[ #text(size:10pt, weight: 500)[ #upper(strong(it.body)) ]]
  ]

  show heading.where(level: 3): it => [  // Sometimes Holmes uses bold but not allcaps headings.
    #block(below: 1em, above: 1em)[ #text(size:10pt, weight: 500)[ #strong(it.body)]]
  ]

  show heading.where(level: 4): it => [  // Sometimes Holmes uses bold but not allcaps headings.
    #block(below: 1em, above: 1em)[ #text(size:10pt, weight: "regular")[ #emph(it.body)]]
  ]

  // show heading.where(level: 3): it => box()[  // Bold inline sub-sections are seemingly only used for spells and monsters
  //   #set par(first-line-indent: (amount: 0.25in, all: false))
  //   #text(size:8pt, weight: "regular")[#strong(it.body) ---]
  // ]

  show heading.where(level: 5): it => [  // Inline and italicized sub-subsections
    #text(size:10pt, weight: "regular")[#emph(it.body) ---]
  ]

  // Table setup
  set table(
    stroke: none,
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
      strong(it)
    }else{it}
  }
  show table: it => {align(center)[#it]}

  // many tables get headings as captions
  show figure.where(kind: table): it => {
    if it.placement == auto and it.scope == "parent" {
      place(auto, float: true, scope: "parent")[
        #heading(level: 2, it.caption.body)
        #it.body
      ]
    } else if it.placement == auto {
      place(auto, float: true, scope: "column")[
        #heading(level: 2, it.caption.body)
        #it.body
      ]
    } else [
      #heading(level: 2, it.caption.body)
      #it.body
    ]
    
  }
  // Display document
  doc
}


// Function to print B/X style spell descriptions
#let basic_spell(spellname, level, spell_range, duration, desc) = block(above: 1em, below: 1em)[
  // #set par(first-line-indent: .em)
  #block()[#strong(spellname) --- Level: #level; Range: #spell_range; Duration: #duration]
  #desc

]

#let basic_monster(Name, Armor: [9], HD: [1], MV: [9"], Attacks: [None], Damage: [None], NA: [1], Save: [Fighter 1], ML: [7], TT: [A], AL: [Neutral], desc) = block(below: 1.5em, above: 1.5em)[
  #show grid.cell: it => {
    set text(size: 10pt) 
    set par(hanging-indent: 1em)
    it
  }
  #heading(level: 3)[#Name]

  #grid(
    columns: (1fr, 1fr),
    gutter: 4pt, inset: 0pt,
    [_Move:_ #MV], [_Alignment:_ #AL],
    [_Hit Dice:_ #HD], [_Attacks:_ #Attacks],
    [_Armor Class:_ #Armor], [_Damage:_ #Damage],
    [_Treasure Type:_ #TT], [],
  )
  #v(1em)
  // grid(
  //   columns: (1fr, 1fr, 1fr, 1fr),
  //   inset: 2pt,
  //   [Armor Class:], Armor, [No. Appearing:], NA,
  //   [Hit Dice:], HD, [Save As:], Save,
  //   [Move:], MV, [Morale:], ML,
  //   [Attacks:], Attacks, [Treasure Type:], TT, 
  //   [Damage:], Damage, [Alignment:], AL,
  // )
  #desc
]


#show: basic_template.with()

= Basic Sample

This template emulates the (superior) 1977 Basic dungeon game. It uses 10pt League Spartan as a free alternative to the original Spartan typeface. The text is set in two columns with roomy margins and tight spacing between lines and paragraphs. 

The first line of every paragraph is indented, which really helps the headings (which vary in weight and capitalization but not size) stand out. 

===== Headings
The headings in this version of the game are a bit funky, it's not totally obvious what the hierarchy is. For this template, I used the title of the table of contents to guide the level 1 heading, even though it appears nowhere else in the document. The bold, all-caps headings make sense as level 2, with bold + titlecase naturally falling into level 3. A few parts of the document use italicized headings, which I slotted into level 4. Finally, some paragraphs have an indented, inline, italicized heading, seprated from the text with an em-dash. I assigned these to level 5. 

===== Tables
Many of the tales in 1977 Basic use a all-caps heading as their caption. To mimic this, just stick your table inside a `#figure` function fill out the caption field. To make a table span two columns, you can set the figure as a two column float by adding these arguments: `placement: auto, scope: "parent"`.

== A Heading
#lorem(80)

=== Subheading
#lorem(35)

#figure(
  table(
    columns: 2,
    align: (center, left),
    table.header([Score], [Reaction]),
    [2], [Immediate hostility!],
    [3-5], [Negative reaction], 
    [6-8], [Uncertain, negotiate then roll again],
    [9-11], [Acquiesces, affable],
    [12], [Eager to assist]
  ),
  caption: [Reaction Table]
)

=== Another Subheading
#lorem(45)

==== Level 4 Subheading
#lorem(25)

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header([Cleric Level], [Skeleton], [Zombie], [Ghoul], [Wight], [Wraith], [Mummy], [Spectre], [Vampyre]),
    [1], [7], [9], [11], table.cell(colspan: 5)[#repeat(".")],
    [2], [T], [7], [9], [11], table.cell(colspan: 4)[#repeat(".")],
    [3], [T], [T], [7], [9], [11], table.cell(colspan: 3)[#repeat(".")],
  ),
  caption: [Clerics vs. Undead Table],
  placement: auto,
  scope: "parent"
)

// #table(
//   columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
//   align: (left, center, center, center, center, center, center, center, center),
//   [Undead], [Acol.], [Adept], [VP], [Vicar], [Curate], [Bishop], [Lama], [Patr.],
//   [Skeleton], [7], [T], [T], [D], [D], [D], [D], [D],
//   [Zombie], [9], [7], [T], [T], [D], [D], [D], [D],
//   [Ghoul], [11], [9], [7], [T], [T], [D], [D], [D],
//   [Wight], [-], [11], [9], [7], [T], [T], [D], [D],
//   [Wraith], [-], [-], [11], [9], [7], [T], [T], [D],
//   [Mummy], [-], [-], [-], [11], [9], [7], [T], [T],
//   [Spectre], [-], [-], [-], [-], [11], [9], [7], [T],
//   [Vampire], [-], [-], [-], [-], [-], [11], [9], [7]
// )

== Spells

#basic_spell("Hypatia's Hirsute Hex", [2], [50'], [6 Turns])[
  Causes a targeted person, object, or creature (horse-sized or smaller) to grow a thick pelt of luxurious hair. 
]

// #basic_spell( "Web", [2], "10 feet", "48 Turns")[
//   Creates masses of sticky strands which are difficult to sever but subject to flame
// ]

== Monsters from S to S

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

// #lorem(200)


