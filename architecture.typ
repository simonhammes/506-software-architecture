#set heading(numbering: (..n) => {
  // Disable numbering for h3+
  if n.pos().len() < 3 {
    numbering("1.1", ..n)
  }
})

#block(inset: 1in)[
  #line(start: (0%, 5%), end: (8.5in, 5%), stroke: (thickness: 2pt))

  #align(horizon + left)[
    #text(size: 30pt, [Scotland Yard])

    #text(size: 24pt, [506 Software Architecture])

    Summer Term 2024

    Simon Hammes

    simon.hammes\@hs-worms.de
  ]
]

#align(bottom + center)[
  #image("./images/logo.svg", height: 15%)
]

#pagebreak()

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

- Product Developers
  - Main responsibilities: product/feature development and expansion strategy
- Developers
- DevOps Engineers
  - Main responsibilities: automation and deployment
- End Users (Players)

// TODO: Add concerns/rationale?

#pagebreak()

= Architectural Significant Requirements / Drivers

== Design Purpose

#table(
  columns: (auto, auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Category*], [*Description*]),
  [DP1],
  [Purpose],
  [Mobile application (iOS + Android) to be launched in Q3 2025 including supporting backend services (greenfield project)],
  [DP2],
  [Goal],
  [Publish the app in the respective app stores in Germany, Austria and Switzerland and monetize the app using a subscription business model],
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

There are no additional concerns.

#pagebreak()

= Architectural Documentation: Views

== End Users

#linebreak()

#figure(
  image("./images/views/use-cases.excalidraw.png", width: 80%),
  // TODO: Caption
  caption: [Use Case Diagram],
)

#pagebreak()

== Analysts and Designers

#linebreak()

#figure(
  image("./images/views/activity-diagram-matchmaking.excalidraw.png", width: 80%),
  caption: [Activity Diagram Depicting the Matchmaking Process],
)

// TODO: Add another diagram re: gameplay/messages/timers/...

#pagebreak()

== DevOps Engineers

// TODO: Deployment diagram (custom or UML)? VMs, Private networks/subnets, load balancer, firewall
#linebreak()

// TODO: Modify services, add load balancer, add key, add labels to edges/arrows, name services
// TODO: Check slides re: custom diagrams

#figure(
  image("./images/views/deployment.excalidraw.png", width: 100%),
  // TODO
  caption: [Deployment/Physical View],
)

== Developers
// TODO: Component/Package diagram?
// Sequence/Activity diagram for matchmaking process?

#pagebreak()

= Attribute-Driven Design: Iterations

== Iteration 1: Service-Based Architecture

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR1 - Service-Based Architecture*],
  [*Status*], [Accepted],
  [*Context*], [Main architectural pattern for proposed greenfield system],
  [*Considered Drivers*], [FR1, FR3, FR5, QA2-1],
  [*ADD Iteration*], [1],
  [*Decision*],
  [
    A service-based architecture is chosen as the main architectural pattern.

    As a starting point, three services are instantiated:
    - _MatchmakingService_: handles matchmaking process
    - _RealTimeCommunicationService_: handles location updates and chat messages
    - _AnalyticsService_: provides statistics and usage patterns for product development purposes

    These services all access the same database. An API proxy is used to route
    requests to the correct backend service. It also allows for handling common
    tasks which would otherwise need to be implemented in every service (e.g.
    authentication, rate limiting or caching).

    *Rationale:*
    - A service-based architecture provides great flexibility
    - Services can be added or split up
    - Good compromise between modularity and complexity
  ],
  [*Considered\ Alternatives*],
  [
    - Layered architecture: ruled out due to lower initial modifiability and lower scalability
    - Microservice architecture: ruled out due to higher deployment and maintenance complexity
  ],
  [*Consequences*],
  [
    - Database transactions which cross service boundaries need to be coordinated, which adds complexity compared to a monolithic architecture
  ],
)

#align(center)[
  #figure(
    image("./images/iteration-1/service-based-architecture.excalidraw.png", width: 80%),
    caption: [Service-Based Architecture],
  )
]

#pagebreak()

== Iteration 2: Client-Server Pattern

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

== Iteration 3: Encryption

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR3 - Encryption*],
  [*Status*], [Accepted],
  [*Context*],
  [
    Since the system handles sensitive data (e.g. location data or chat messages), all user data must be encrypted
    during communication and storage.
  ],
  [*Considered Drivers*], [QA1-1],
  [*ADD Iteration*], [3],
  [*Decision*],
  [
    All user data is encrypted during communication and storage.

    Data confidentiality _during communication_ is guaranteed by using secure protocols (HTTPS for short-running and WSS
    #footnote[WebSocket Secure, i.e. WebSocket over TLS] for long-running/real-time operations). These protocols are
    widely used and include additional security measures such as _message integrity verification_ using checksums to
    ensure data integrity.

    Data _at rest_ in the shared database is encrypted at the storage layer, which makes encryption transparent to the
    application (i.e. the database).

    // Additional tactic: Delete location data/chat messages after 30 days to limit potential data breaches?

    *Rationale:*
    // TODO
  ],
  [*Considered\ Alternatives*],
  [
    - Encrypting the whole database would further improve security, but at the same time impose severe performance
      degradation, rendering it infeasible
  ],
  [*Consequences*],
  [
    - Performance is negatively affected by introducing these security measures.
    - Certificates and private keys used for encryption must be kept secret
    - Data _in use_ (i.e. in the database's RAM) is not encrypted
      - This shortcoming will need to be addressed in further iterations
  ],
)

// TODO: Diagram: Information flow (HTTPS/WSS)

#pagebreak()

== Iteration 4: Limiting Access and Exposure

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR4 - Limiting Access and Exposure*],
  [*Status*], [Accepted],
  [*Context*],
  [
    Since data _in use_ (i.e. in the database's RAM) is currently not
    encrypted, preventing unauthorized access to the database server is
    critical.
  ],
  [*Considered Drivers*], [QA1-1],
  [*ADD Iteration*], [4],
  [*Decisions*],
  [
    1. Access to the database server is limited by using an internal firewall.
       Only explicitly granted backend services are allowed to access the
       database.

    2. Exposure to the backend services is limited by forcing all traffic
       through the API proxy, which acts as a single access point. This
       enables the implementation of centralized access control checks.

    *Rationale:*

    Both tactics reduce the attack surface. The API proxy is the only publicly
    accessible component. All the other components do not need to be publicly
    accessible.
  ],
  [*Consequences*],
  [
    - Firewall and private networks must be configured
    - Maintenance/deployment access must still be guaranteed
  ],
)

#align(center + horizon)[
  #figure(
    image("./images/iteration-4/limit-access.excalidraw.png"),
    caption: [Internal Firewall + API Proxy as a single access point],
  )
]

#pagebreak()

== Iteration 5: Retry + Circuit Breaker

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR5 - Retry + Circuit Breaker*],
  [*Status*], [Accepted],
  [*Context*],
  [
    Network errors are a concern since the likelihood of reduced connectivity (e.g. underground) is high.
    The mobile app should handle these in a graceful manner, ensuring no crashes and adequate latency.
  ],
  [*Considered Drivers*], [QA3-3],
  [*ADD Iteration*], [5],
  [*Decisions*],
  [
    1. A _retry tactic_ is used to automatically try to reconnect to the backend services handling long-running
       connections (e.g. _RealTimeCommunicationService_) in case the connection is interrupted.
    2. An exponential backoff strategy limits network load by using exponentially increasing waiting times between attempts.
    3. Outgoing messages are buffered on the client and sent upon reconnection.
    4. A maximum time limit (which can be configured when starting a match) acts as a _circuit breaker_,
       causing a player to be removed from the match once the time without any connectivity reaches this time limit.

    *Rationale:*
    // TODO
  ],
  // TODO: Considered Alternatives?
  [*Consequences*],
  [
    // TODO
  ],
)

#align(center + horizon)[
  #figure(
    image("./images/iteration-5/retry.excalidraw.png", height: 35%),
    caption: [Retry tactic with exponentially increasing waiting times],
  )
]

#pagebreak()

== Iteration 6: Redundancy + Load Balancer

#table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  [*ID - Title*], [*DR6 - Redundancy + Load Balancer*],
  [*Status*], [Accepted],
  [*Context*],
  [
    Latency between players sending and receiving location updates or chat messages should be less than 2 seconds
    (excluding network errors due to limited connectivity). The current architecture does not guarantee this if there
    are many concurrent matches.
  ],
  [*Considered Drivers*], [QA3-1, QA4-1],
  [*ADD Iteration*], [6],
  [*Decisions*],
  [
    1. A second replica of the _RealTimeCommunicationService_ is deployed.
    2. A load balancer is deployed to balance the load between both instances.

    *Rationale:*
    - Load balancer increases availability and reduces latency
      - Is most probably not a bottleneck since a load balancer can typically handle tens of thousands of connections
    - More replicas of the _RealTimeCommunicationService_ can be deployed if necessary
  ],
  [*Considered\ Alternatives*],
  [
    - Increasing the physical resources of the machine running _RealTimeCommunicationService_: reliance on vertical
      scalability is undesirable (since it is inherently limited); would not increase availability
    - Using an event bus to forward messages from one instance to the other instead of relying on dynamic routing
      (see *Consequences* for more details)
      - Ruled out due to adding lots of complexity and another single point of failure (the event bus itself)
      - @iteration-6-event-bus shows a possible solution using this approach
  ],
  [*Consequences*],
  [
    The _MatchmakingService_ needs to route all players in a specific match to the same instance of the
    _RealTimeCommunicationService_. It does this by providing the clients with a _routing key_, which they send along
    when initiating the connection to the _RealTimeCommunicationService_. The load balancer uses this routing key to
    route the connection to the _correct_ instance of the _RealTimeCommunicationService_.
  ],
)

#pagebreak()

=== Chosen Approach

#align(center)[
  #figure(
    image("./images/iteration-6/load-balancer.excalidraw.png"),
    caption: [A load balancer distributes traffic between the _RealTimeCommunicationService_ instances],
  )
]

#linebreak()

=== Alternative Approach (Discarded)

#align(center)[
  #figure(
    image("./images/iteration-6/event-bus.excalidraw.png", height: 50%),
    caption: [Using an event bus to forward messages between instances],
  ) <iteration-6-event-bus>
]
