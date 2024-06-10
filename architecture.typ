#set heading(numbering: (..n) => {
  // Disable numbering for h3+
  if n.pos().len() < 3 {
    numbering("1.1", ..n)
  }
})

#page(margin: (left: 2in))[
  #line(start: (0%, 5%), end: (8.5in, 5%), stroke: (thickness: 2pt))

  #align(horizon + left)[
    #text(size: 24pt, [506 Software Architecture])

    Summer Term 2024

    Simon Hammes

    simon.hammes\@hs-worms.de
  ]
]

#outline(depth: 2, indent: auto)

#pagebreak()

#set page(numbering: "1")
#counter(page).update(1)

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

= Architectural Documentation: Views

#pagebreak()

= Attribute-Driven Design: Iterations

== Iteration 1

//=== Step 1: Review Inputs
//- Primary Functionality and QAs are prioritized #sym.checkmark

//=== Step 2: Establish Iteration Goal
//- This is a greenfield project in a mature domain
//  - The first iteration should result in an overall system structure, e.g. by using a reference architecture 
//  - Client-Server or Event-Driven architecture?

// === Architectural Decision Record

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR1 - Service-Based Architecture*],
  [*Status*], [Accepted],
  [*Context*], [Main architectural pattern for proposed greenfield system],
  [*Considered Drivers*], [TBD],
  [*ADD Iteration*], [1],
  [*Decision*], [Decision + Rationale],
  [*Considered\ Alternatives*], [TBD],
  [*Consequences*], [TBD],
  [*Additional\ Documentation*], [TBD],
)

// TODO: Add sketch of client-server architecture in here?
// Formal documentation is created after the iterations

// TODO: Add User Interface layer
#align(center + horizon)[
  #figure(
    image("./images/iteration-1/service-based-architecture.excalidraw.png", width: 80%),
    caption: [
      // TODO
      Caption
    ],
  )
]

#pagebreak()

== Iteration 2

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR2 - Client-Server Pattern*],
  [*Status*], [Accepted],
  [*Context*],
  [
    The system should be highly modifiable and allow the developers to quickly
    add new countries and cities to the list of supported locations.
  ],
  [*Considered Drivers*], [DP1, QA2-1],
  [*ADD Iteration*], [2],
  [*Decision*],
  [
    The Client-Server pattern is employed in order to enhance the modifiability of the system.

    *Rationale:*
    - Mobile app and backend services can evolve independently
      - New locations can be added without modifying existing client apps (-> QA2-1)
    - Clients do not need to keep track of other clients
  ],
  [*Considered\ Alternatives*],
  [
    - Peer-to-Peer architecture: ruled out due to secure communication being much harder to achieve
  ],
  [*Consequences*],
  [
    - Communication over the network is neither secure nor reliable
      - Both of these shortcomings will need to be addressed in further iterations
  ],
)

#align(center + horizon)[
  #figure(
    image("./images/iteration-2/client-server-pattern.excalidraw.png", height: 40%),
    caption: [Client-Server Pattern],
  )
]

#pagebreak()

== Iteration 3

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  // TODO: Title
  [*ID - Title*], [*DR3 - IPS (?)*],
  [*Status*], [Accepted],
  [*Context*], [
    // TODO
  ],
  // TODO
  [*Considered Drivers*], [],
  [*ADD Iteration*], [3],
  [*Decision*],
  [
    // TODO
    Since the encryption of all user data is critical,
    a number of patterns and tactics are applied to achieve
    this quality attribute (or increase the ...?).
    These include:
    - Verifying message integrity
    - Identifying and authenticating actors
    - Restricting access to components/systems (e.g. database) which do not need to be publicly accessible
    - Encrypting data during communication and storage

    // TODO: Only "Encrypt Data" since it is the only tactic driven by the QA(S)? Maybe in combination with "Separate Entities"? Separate database to store location data and chat messages in a separate database without personal user data (names, addresses, ...)?

    // Additional tactic: Delete location data/chat messages after 30 days to limit potential data breaches?

    *Rationale:*
    // TODO
  ],
  [*Considered\ Alternatives*],
  [
    // TODO
  ],
  [*Consequences*],
  [
    - Performance is negatively affected by introducing these security measures.
    - Certificates must be kept secret
    // TODO
  ],
  [*Additional\ Documentation*], [TBD],
)

// TODO: Diagram: Information flow (HTTPS/WSS)
