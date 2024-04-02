#set text(size: 10pt, font: "Chivo")
#set page(paper:"a4",margin: 1cm, flipped: true)
#show heading.where(level: 1) : it => [
  #text(
  font: "Tomorrow",
  weight: 800,
  size: 16pt,
  it.body
  )
  #v(6pt) 
]   




#let character(ch) = block(inset:3mm, stroke: 1pt + gray, height: 100%)[
#set align(left)

= #ch.name
 

#grid(
  columns: (5fr,3fr),
  gutter:2mm,
  [
    #rect(
      width: 100%,
      height: 30mm,
      stroke: 1pt + gray
    )
  ],
  [
    *#ch.currentProfession* \
    *#ch.species*
  ]
)


#v(6pt)

#grid(
  columns: (1fr,1fr),
  gutter: 5mm,
  [
  === Stats

  - Age: *#ch.age*
  - Size: *#ch.size*

  === Possession: 

  #for (perk, value) in ch.perks {
    [
      - #perk : #value
    ]
    
  } 
  ],
  [
    === Skills: 

    #for (skill, value) in ch.skills {
      [ 
        - #skill : #value
      ]
    }
  ]
  )

  #v(1fr)

  *Hits:* #let n = 0
  #while n < ch.size {
    h(2mm)
    box(square(stroke: 1pt+ black, width: 12pt))
    n = n+1
  }

  #block(width: 100%, height: 15pt, inset: 5pt, stroke: 1pt + gray)[Condition:]
  #block(width: 100%, height: 15pt, inset: 5pt, stroke: 1pt + gray)[Condition:]
  #block(width: 100%, height: 15pt, inset: 5pt, stroke: 1pt + gray)[Condition:]
  #block(width: 100%, height: 5cm, inset: 5pt, stroke: 1pt + gray)[Infos:]
]



#let png(players) = {
   for player in players {
    character(player)
  }
}
   
#columns(3, gutter:2cm)[
  #png(json("output.json"))
]
