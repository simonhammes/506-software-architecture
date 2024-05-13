#set heading(numbering: "1.1")

#page(margin: (left: 2in))[
  #line(start: (0%, 5%), end: (8.5in, 5%), stroke: (thickness: 2pt))

  #align(horizon + left)[
    #text(size: 24pt, [506 Software Architecture])

    Summer Term 2024

    Simon Hammes

    simon.hammes\@hs-worms.de
  ]
]

#outline(indent: auto)

#pagebreak()

= Introduction
This document contains the software architecture for a real-life software
inspired by Scotland Yard, which is a board game where players work together as
detectives to track down the elusive criminal, Mr. X, in London. Mr. X moves
secretly around the city using different modes of transportation while the
detectives try to deduce his whereabouts. The detectives must strategically plan
their moves to corner Mr. X and make an arrest before he escapes. Mr. X reveals
his location periodically, adding suspense and challenge to the game. The game
combines deduction, strategy, and teamwork as players race against time to
capture Mr. X.

= Architectural Significant Requirements / Drivers

== Design Purpose

// TODO
// Subscription model?
// X users before the end of 2025?

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [*ID*], [*Category*], [*Description*],
  ),
  [DP1],
  [Purpose],
  [Mobile game to be launched in Q3 2025],
  [DP2],
  [Goals],
  [],
  [DP3],
  [Schedule],
  [
    Public Beta in Berlin in Q2 2025 \
    Launch in Germany, Austria and Switzerland in Q3 2025
  ],
)

== Quality Attributes

== Primary Functionality

== Architectural Concerns

== Constraints

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Description*]),
  [CON1],
  [Relevant data protection laws (GDPR for countries in the EU, nFADP for Switzerland)],
  [CON2],
  [Budget: 750,000€],
  [CON3],
  [Team of 5 including 3 developers],
  [CON4],
  [Deadlines: Public Beta in Q2 2025, Launch in Q3 2025],
  [CON5],
  [
    Tech Stack \
    - Mobile app using Flutter (cross-platform) \
    - Backend written in Go \
    - No on-premise infrastructure
  ]
)

#pagebreak()

= Attribute-Driven Design

#pagebreak()

= Architectural Documentation
