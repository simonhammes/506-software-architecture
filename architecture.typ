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

= Stakeholders

// Based on 4+1 architectural view model

- Analysts
- Developers
- DevOps Engineers
- End Users

// TODO: Add concerns/rationale?

#pagebreak()

= Architectural Significant Requirements / Drivers

== Design Purpose

// TODO
// Subscription model?
// X users before the end of 2025?

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Category*], [*Description*]),
  [DP1],
  [Purpose],
  [Mobile application (iOS + Android) to be launched in Q3 2025 (greenfield project)],
  [DP2],
  [Goal],
  [Publish app in the respective app stores in Germany, Austria and Switzerland],
  [DP3],
  [Schedule],
  [
    Public Beta in Berlin in Q2 2025 \
    Launch in Germany, Austria and Switzerland in Q3 2025
  ],
)

== Primary Functionality

#table(
  columns: (auto, auto, 1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Category*], [*Description*], [*Priority [1-10]*]),
  [FR1],
  [Matchmaking],
  [Players can create game sessions and invite other players or join existing sessions],
  [#highlight(fill: rgb("#EF9A9A"))[10]],
  [FR2],
  [Matchmaking],
  [The system is able to bring players together based on their geographical location, even if the players haven't known each other before],
  [#highlight(fill: yellow)[7]],
  [FR3],
  [Gameplay],
  [Players can exchange location updates and chat messages in real-time],
  [#highlight(fill: rgb("#EF9A9A"))[10]],
  [FR4],
  [Gameplay],
  [Players can access their own and their teammates' location history for a post-game analysis],
  [#highlight(fill: rgb("#61d800"))[3]],
  [FR5],
  [Marketing/\ Analytics],
  [The system provides detailed statistics and usage patterns],
  [#highlight(fill: yellow)[6]],
)

#pagebreak()

== Quality Attributes

// TODO: Check QAS wording

#table(
  columns: 5,
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Quality\ Attribute*], [*Scenario*], [*Associated\ Driver*], [*Priority*]),
  [QA1-1],
  [Security],
  [All user data is encrypted during communication and storage, especially since the system handles sensitive data
  (e.g. location data or chat messages).],
  [FR2, FR3,\ FR4],
  [#highlight(fill: rgb("#EF9A9A"))[(M, H)]],
  [QA2-1],
  [Modifiability],
  [A developer can add a new country in less than three working days.],
  [],
  [#highlight(fill: rgb("#EF9A9A"))[(H, H)]],
  [QA3-1],
  [Availability],
  [The backend should be able to handle 10000 requests per second in normal operation mode with a rate of successful responses of 99.9%.],
  [],
  [(H, L)],
  [QA3-2],
  [Availability],
  [The mobile app should crash during less than 0.1% of games.],
  [],
  [(M, L)],
  [QA3-3],
  [Availability],
  // TODO
  // TODO: Response measure?
  [The mobile app should handle network errors gracefully (especially relevant while underground).],
  [FR3],
  [#highlight(fill: rgb("#EF9A9A"))[(M, H)]],
  [QA4-1],
  [Performance],
  [The latency between players sending and receiving location updates or chat messages in normal mode (excluding limited connectivity underground) is less than 2 seconds.],
  [FR3],
  [#highlight(fill: rgb("#EF9A9A"))[(H, M)]],
  [QA5-1],
  [Usability],
  [The mobile app automatically sends location updates in the configured time interval without user involvement.],
  [FR3],
  [(H, L)],
  [QA5-2],
  [Usability],
  [Users are able to send text messages using no more than 2 clicks from the app's home screen (excluding typing the actual message).],
  [],
  [(H, L)],
)

#pagebreak()

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

== Architectural Concerns

// TODO

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Description*]),
)

#pagebreak()

= Attribute-Driven Design

#pagebreak()

= Architectural Documentation
