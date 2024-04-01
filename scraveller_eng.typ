#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx

#set page(
  width:29.7cm,
  height:21cm,
  margin: (left: 1cm, right: 1cm, top:1cm, bottom: 1cm),
  numbering: none,
)

#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)

#set block(
  width:100%,
)

#set text(lang: "en", size: 11pt)
#set text(font: "Arsenal")

#set par(
  justify: false,
  leading: 0.55em,
  
)

#columns(3, gutter: 20mm, [
#block[
  #set align(right)
  #set text(size:14pt, style: "italic",hyphenate: false)
  #v(2pt)
Mayday, mayday… \
This is free trader Meowulf, we are under attack… \
Main drive is gone, turret one is destroyed… \
We are losing pressure fast… \
Mayday, mayday… \
̀]

#block(  
  inset: (top:24pt, bottom: 16pt),
  width: 100%,
  text(size: 45pt, fill: rgb("#800000"), weight: 700, style: "italic",tracking: -3pt, [
    #set align(right)
    SCRAVELLER!
  ])  
)

#image("sun_spaceship_left.svg", width: 100%)
#v(24pt)

#let th(body) = {
  set text(fill: rgb("#800000"), font: "Black Wolf",  size:14pt, weight: 700)
  [ #body ] 
}

#let st(body) = {
  box(fill:rgb("#FFFF00"), [
    #set text(fill: black, style: "italic", weight: 700)
    #body 
  ])

}

#block[
#set align(right)
#set text(size:14pt, style: "italic",hyphenate: false)

A SCRAPCAT HACK for space misfits \ inspired by the world's most famous \ Sci-Fi RPG.
]


#let scraveller-logo={block[
#colbreak()
#set align(center)
#image("sun_spaceship_right.svg", width: 100%)
]
}

#v(1fr)

#block(
  stroke: 1pt +  rgb("#800000"),
  inset: 4pt,
  [
    #set text(size:8pt)
    This is a *Scrapcat* Hack. *Scrapcat* can be found here: `https://luca-negri.itch.io/scrapcat` . Published under *CC BY 4.0 Deed
    Attribution 4.0 International* -- `https://creativecommons.org/licenses/by/4.0/`
  ]
)

#scraveller-logo

#th[INTRO] You are a #st[SPACE SCRAPCAT], a lean and mean bastard plying the #st[SPACE LANES] to #st[SWINDLE NOBLES], assault #st[CORP SHIPS] and #st[EXPLORE UNIVERSE]  accompanied by a band of other like-minded gentlesentients. 

#th[CHARGEN] Choose a #st[NAME]. Roll #st[2+1d6] for your #st[SIZE]. These are your HPs and how many object you can carry. Then #st[ROLL 1d10] for a #st[CAREER] term: 

#tablex(
  auto-vlines: false,
  columns: (1fr,4fr,1fr,4fr,1fr,4fr),
  [1],[Medic],
  [2],[Scout],
  [3],[Scientist],
  [4],[Tech],
  [5],[Merchant],
  [6],[Smuggler],
  [7],[Pirate],
  [8],[Merc],
  [9],[Pilot],
  colspanx(1)[#text(size:1.2em)[*0*]],colspanx(5)[#text(size:1.2em)[#st[DEAD] in the line of duty, sorry.]],
)

If you're not dead, note down the resulting career and add  a +1 to it. #st[REPEAT this] for #st[1d4 more times]. If you #st[die] during this phase,
#st[SCRAP] your character and generate a new one. Instead of continuing, you might also choose to #st[MUSTER OUT]. 

#th[CHARGEN (soft)] If you don't feel like dying during character creation, choose 1 career at +2 or 2 careers at +1 and that's it.

#th[SURVIVED / MUSTERED OUT?] If you #st[SURVIVE], choose #st[ONE] (#st[TWO] if you did 5 tours of duty) object from this list: #st[Contact] -- #st[Money] -- #st[Medium Weapon] -- #st[Gadget] -- #st[Hideout]. Describe your stuff. Every object can be used #st[up to three times], then, according to the object, it must be reloaded / repaired / you can't use it anymore. 
Everyone #st[ROLL 1d20]. Lowest scoring character is saddled by the starship mortgage and has skipped the latest #st[1d10] payments, making someone *very angry*.

#scraveller-logo

#th[DOING STUFF] #st[Roll 2d6], and add most relevant career's level and +1 for a single relevant object you own. #st[2 means DISASTER], #st[9+ means SUCCESS], #st[16+ means SCRAP TIME]. When you enter the SCRAP TIME, you score a *critical success*: you become one with the universe, or receive illumination or kick serious ass, you know the drill, for 1d6 rounds. 

#th[FIGHT \& CONFLICTS] Treat them like an action. If you succeed, you hit. If you fail, #st[they score 1-4 hits] according to the weapon. #st[If your HPs reach between 0 and -SIZE], #st[you're dying] and if you don't get first aid within 1d6 rounds you're dead. #st[If your HPs go] #st[lower than -SIZE], you're definitely #st[DEAD]. Roll another character, mate. 

#th[THE UNIVERSE] Least-skilled player describes an #st[HELLISH PLANET] to escape from and avoid at all costs, highest skilled player describes a #st[PARADISE PLANET] where to retire or have the greatest time of your life and the player with the ship and unpaid mortgage gets to #st[describe the creditors] they are definitely #st[fleeing from]. The players then decide #st[THE SHIP'S NAME], in a collective fashion. 

#v(1fr)

#block[
    #set align(center)
    #set par(leading: 6pt)
    #set text(font:"Black Wolf", size:18pt, fill: rgb("#800000"))
    NOW \ JUMP INTO  THE FREAKIN'  HYPERSPACE, \ FOR F\*\*K'S SAKE!
]    
#v(24pt)


#scraveller-logo

#let th(body) = {
  set text(fill: rgb("#800000"), font: "Black Wolf",  size:12pt, weight: 700)
  [ #body ] 
}
#set text(lang: "en", size: 9pt)

#v(1fr)


#grid(
  columns: (1fr, 1fr),
  gutter: 5mm,
  [ #image("pics/insettone01.jpeg",width: 100%) ],
  [ #image("pics/scientist01.jpeg",width: 100%) ],
  [ #image("pics/scout02.jpeg",width: 100%) ],
  [ #image("pics/spacescout.jpeg",width: 100%) ], 
)



#v(1fr)

#th[Species]. Humans started spreading in the 'verse more than three millennia ago, and soon met other starfaring species. With some of them contact was peaceful and uneventful; with some others, it led to conflicts. Moreover, humans themselves tinkered with their own DNA and soon generated their own related but different species: related enough to be interfertile (with some help), distinct enough to resemble something... other. These are the most notable ones.

#colbreak()

#th[Baseline Humans] Direct, unprocessed descendants of the _homo sapiens_ stock. Granted, centuries of slightly different gravities, suns, day lenghts and radiation level forced different evolution paths that are being studies in a lot of universities, but from a biological standpoint of view baseline humans are still considered a species in itself. Politically most of baseline humans swear allegiance to the *Terran Hegemony* (a powerful but extremely conservative polity), but at least 20% of them set out to remote colonies outside the main polities in the local arm. 

#th[Genenginereed Humans] Some planets, while deemed promising for colonization, were too extreme for baseline humans; thus, new species where created to exploit such worlds. Most notable are: *Soberians*, created for extremely dry climates; *Isanesleses*, engineered for hi-G planets; *Vetebeses*, created for very hot (50-70°C) worlds and *Ceertians*, adapted for 0 gee environments. These epecies were considered little more than second-class citizen by Terran rulers of yore, so they ended up revolting against them and set up a very loose confederation, named the *N-Human Empire.*, which is mired in internal quarrelings but also harbors some of the most expansionist polities of the Known Universe. 

#th[Edonenites] Reptilian humanoids hailing mostly from the *Edonen Compact*, a tight-controlled union of 30-odd solar systems bordering the RK-4423 sector. Known as durable, physically adaptable, swift in their moves and quite stubborn in their thoughts. While the Compact itself is very strict in its tradition and customs, a sizable lot of Edonenites chafe under this invisible fist, and leave the Compact at their earliest opportunity, even if this means social death at home. Thus, most Edonenites are likely to have a rebellious streak fueling their actions.

#th[Getevites] Bear-like folks hailing from *Getev*, a world near the Rasalhague Archeological Zone. They recently discovered how to crack lightspeed barrier, just to discover they were  hopelessly outnumbered by older interstellar polities. To make up for their scarce population, they began a vast program of espionage disguised as commercial endeavors bent to acquire the highest tech at the lowest price. Don't be fooled by their dumb stare, since they are, on the average, one of the most intelligent and analytical species out there. Their wares are quite delicate and refined, though. 

#th[Raatbies] *Raat'b* is a Super Earth-type planet currently part of the N-Human empire, and it is the home of Raatbies, amphibious smallish (1.4m) humanoids whose biological prowess is matched by no other species in the Known Universe. Being Raat'b an overpopulated world, and being Raatbies endowed by a burning curiosity, they spread into their known space at an alarming velocity, quickly filling a lot of scientific and scouting position in most multispecies polities. However, while adaptable, they tend to shun hot and dry world: being there even protected by a proper suit, hurts and slows them on a deep psychological level. 

#th[Tiariceites] The *Tiaritz Federation* is the oldest known civilization in this sector. They visited Earth during the last ice age (still have pictures and movies). They are very jealous of their volume of space and while lacking innovation their tech is still so fearsome that no sane being considers travelling in their space without proper authorization. They can be met mostly in the Rasalhague Archeological Sector, which they control. They resemble an awful lot baseline humans... if you don't mind their extra pair of arms.  They are quite contemptful of younger starfaring races, and consider dealing with them a necessary but unpleasant evil. However, their inner calm and vast technical knowledge makes them prized member of any shipcrew. 

#th[Terdiaresi] Cat-Folks from the dry worlds of the *Terdiar Alliance* combine the cunning, the sensuality and the ferocity of felines with the frame of a huge and fit human. (220cm and 140kg of muscles on average). After their First Encounter, both species spent the first four centuries embroiled in a series of wars. There's been peace ever since, but a veil of mistrusts is still part and parcel of any human-terdiarese relation. Thus, few terdiaresi can be seen in human space; most of them are _freelances_, working as independents for anyone willing to pay. On a rare case, however, humans and terdiaresi can form a Bond that no force in the universe can break. Woe betide to the one that harms the human of a Bonded terdiarese...

#th[Xevexian] These huge bipedal eight-armed insectoids covered by tough, chitinous carapaces are widespread on a sizable number of lot of humid, jungle-like worlds. Their origin is unknown, and what baffles the boffins of most races is that they exhibit both an uniform culture and little genetic differences despite lacking FTL capabilities and being spread on very far-away worlds. For these reasons, a lot of conspiracies have cropped up about a gigantic hive-mind biding its time to rule the universe using the Xevexian (which translates as "The People") as cannon fodder. Prized jack-of-all-trades, quick to learn about anything they set to, they seem to get along quite well with other races, unless they are called out as "ugly": in this case, things can get deadly very quickly...


])
