# Architecture Overview

This app is built as a collection of independent building blocks — exactly like LEGO bricks. Each feature (e.g. Rick & Morty characters list, Quiz) is a completely self-contained brick. The main app simply plugs them together.

**The three layers, simply:**
- **Application** — the instruction manual that tells the LEGO bricks how to connect. It knows about everything but contains no product logic itself.
- **Feature** — the actual product pieces. The Rick & Morty list is one brick. The Quiz is another. They don't know about each other.
- **Utility / Core** — the raw materials: the plastic, the pegs, the standard connectors. Shared tools that every brick can use, but that know nothing about any specific brick.

**Why this matters:**
- A new feature can be built and tested in isolation, without touching existing code.
- Features can be turned on/off remotely without a new app release (via feature flags in `app/configuration`).
- Different teams/developers can own different features with no conflicts — the architecture enforces this physically through package boundaries.
- As the app grows to dozens of features, Business Areas group related features into domains (e.g. "Banking", "Insurance") keeping the codebase navigable at scale.

### Architectural Pattern

The project implements a **"Lego-like" Modular Architecture** within a Pub Workspaces manged monorepo. The design transforms what could be a monolith into a collection of small, independent packages organised into a strict layer hierarchy. This is not classical Clean Architecture — it is closer to a **vertical slice / feature-sliced** model where each feature owns its full stack (API → Repository → UseCase → BLoC → UI), but all shared infrastructure is pushed down into Utility/Core layers.

---

### Layer Definitions 

#### Application Layer
The **"glue"** that initializes and connects everything. It is the entry point of the system. While the Feature layer contains the *logic* and the Utility layer contains the *tools*, the Application layer provides the **context** and **integration** required to run the application on a specific platform.

Responsibilities:
- **DI Setup:** Registers and provides concrete implementations for all services and repositories used across features (collects all `DIInitializer`s from every module)
- **Feature Composition:** Combines multiple independent Feature packages to form the final user experience
- **Global Configuration:** Handles app-wide settings — environment variables (Dev/Prod), localisation, theme
- **Navigation Orchestration:** Acts as the central hub for routing; moves a user from one isolated feature to another by implementing feature `Navigator` abstractions
- **App Lifecycle Management:** Manages startup, background/foreground transitions, and global error handling
- **Main Entry:** Contains `main.dart` where `runApp()` is called

What the Application layer assembles from below:
- `Utility DI initializers` — service locator registrations from each utility package 
- `Feature navigator abstractions` — implemented in the Navigator module
- `Feature page entrypoints` — registered as AutoRoute page targets
- `Feature configuration abstractions` (optional) — implemented in the Configurator module

---

#### Feature Layer
The layer **most used by developers** in every project. Its purpose: main product development.

Key rules:
1. A feature is an **encapsulated package** — all changes happen inside it
2. A feature can import anything from the Utility/Core layer
3. A feature **exports a limited set of files**: always at least one `Entrypoint` (page or widget), optionally a `Navigator` abstraction, optionally a `Configurator` abstraction
4. Feature tests test **only encapsulated functionality** — all imported utilities must be mocked. BDD tests are preferred because they test whole functionality with least effort and are closest to UX testing
5. Features **must NOT import other features** as a general rule. The rare exception: when a feature needs a widget that exposes some part of another feature's business logic (e.g. a dashboard showing account balance, transactions, and employees as three separate widgets from three different features). Such cross-feature widgets **must be wrapped in a `TestFacade`** to make them invisible in the scope of tests. (Example: Feature home has 3 tabs - each tab is another feature)

**Internal feature structure**:

```
Feature
├── Configurator abstraction     ─── exported to Application
├── Navigator abstraction        ─── exported to Application
├── Entrypoint                   ─── exported to Application
│   (initializes DI, internal localisation, etc.)
│
└── [Encapsulated — never imported from outside]
    ├── Repositories             ← imports data sources (API client/DB) from Utility
    ├── Use Cases                ← business logic, feeds BLoCs
    ├── Page Bloc                ← drives Page widget
    ├── Widget Bloc              ← drives sub-widgets (optional)
    ├── Page                     ← uses Entrypoint for flow navigation
    │                              uses prebuilt widgets from design system
    ├── Widget                   ← driven by Widget Bloc
    └── Tests                   ← test only encapsulated functionality;
                                   all imports must be mocked
```

The encapsulated zone is everything that should **never be imported directly** from outside the feature.

---

#### Utility Layer (L1 - Core)
Sits between Utility and Feature. Houses **business rules, global entities, and UI templates** that are not unique to a single feature. Unlike the Utility L0 layer (purely technical), this layer **"knows about your business"** (e.g. it may know what a `Transaction` or a `User` is).

Core examples: App-wide business logic and models, Common locales, Permissions, API client*, Auth, Design system*, Others.

> Design system and API client can be either Utility or Core depending on context:
> - API client has custom objects/logic related to this project's backend only → **Core**
> - Design system relies on the project's brand/design strategy → **Core**
> - Either is purely generic / project-agnostic → **Utility**

In this project: `domain`, `api_client`, `api_client_interceptors`, `design_system`, `presenter`, `localizations`.

---

#### Utility Layer (L0)
Low-level, highly reusable packages that provide the "tools" for the rest of the app.


Rules:
- A Utility package **must never** depend on a Feature or the Application layer
- **Zero Feature Knowledge** — if it knows about a feature, it doesn't belong here
- **High Reusability** — if more than one feature needs it, it should be in Utility
- **Extreme Stability** — the entire app depends on this layer; changes here ripple everywhere

Utility examples: UI kit / design system, API client, Database, 3rd party wrappers, Result, Analytics, Linter, Others.

---

#### Business Area (advanced / scaled structure)
For larger projects, a **Business Area** grouping layer between Application and Features can be introduced.

Business Areas act as logical containers that group related Features together based on a specific business domain (e.g. Banking, Insurance, User Management). This prevents the project from becoming a flat list of hundreds of disorganised feature packages.

Structure of a Business Area:
- **Features** — a set of features belonging to this domain
- **Core (local, optional)** — shared functionality *inside* the business area only. Typically one package exposing common use cases. Not exported outside the area.
- **Service / shared (optional)** — domain logic or features shared *to other Business Areas*. Should be minimal — bare minimum of shared content.

Rules:
- Features are physically organised into folders: e.g. `features/banking/payments`, `features/banking/accounts`
- Each Business Area typically corresponds to a **specific team** (e.g. "The Wealth Team" owns the "Investment" Business Area)
- Even within a Business Area, features still avoid direct dependencies — cross-feature navigation still goes through the Application layer
- Allows the architecture to scale from 10 features to 100+ by categorising into manageable "neighbourhoods"

> This project is a reference implementation and does not yet use Business Areas — all features live directly under `feature/`. Business Areas would be introduced when the feature count justifies the grouping.

---

### Full Layer Map

#### Base structure (this project)

```
┌─────────────────────────────────────────────────────────────────┐
│  APPLICATION LAYER  (app/)                                      │
│  "Glue — entry point, composes everything"                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────┐   │
│  │  miniclient  │  │  navigation  │  │  configuration       │   │
│  │  (runApp,    │  │  (AutoRoute, │  │  (Configurator       │   │
│  │   DI boot)   │  │   Navigator  │  │   implementations,   │   │
│  │              │  │   impls)     │  │   feature flags)     │   │
│  └──────┬───────┘  └──────┬───────┘  └──────────┬───────────┘   │
└─────────┼─────────────────┼─────────────────────┼───────────────┘
          ↓ composes        ↓ routes to           ↓ gates
┌─────────────────────────────────────────────────────────────────┐
│  FEATURE LAYER  (feature/)                                      │
│  "Product — self-contained business modules"                    │
│  ┌──────────────────┐  ┌──────────────┐  ┌───────────────────┐  │
│  │  sandbox         │  │  rick_and_   │  │  questionnaire    │  │
│  │  (home / demo)   │  │  morty_chars │  │  (flow-based quiz)│  │
│  └──────────────────┘  └──────────────┘  └───────────────────┘  │
│                                                                 │
│  Each feature exports only:                                     │
│    XxxEntrypoint | XxxNavigator | XxxConfigurator               │
│  Everything else (BLoC, Repo, UseCases, Page) is encapsulated   │
└─────────────────────────────┬───────────────────────────────────┘
                              ↓ imports
┌─────────────────────────────────────────────────────────────────┐
│  UTILITY LAYER 1  (core/)                                       │
│  "Knows about the business — shared entities, not feature-spec."│
│  ┌────────────┐ ┌──────────────────┐ ┌──────────────────────┐   │
│  │  domain    │ │  api_client      │ │  design_system       │   │
│  │  (shared   │ │  + interceptors  │ │  (PlatformX widgets, │   │
│  │  entities, │ │  (Dio+Retrofit,  │ │   spacing tokens)    │   │
│  │  errors)   │ │   auth, mock,log)│ │                      │   │
│  └────────────┘ └──────────────────┘ └──────────────────────┘   │
│  ┌──────────────────┐  ┌──────────────────────────────────────┐ │
│  │  presenter       │  │  localizations                       │ │
│  │  (toast/overlay/ │  │  (i69n, common translations,         │ │
│  │   confetti)      │  │   BuildContext extensions)           │ │
│  └──────────────────┘  └──────────────────────────────────────┘ │
└─────────────────────────────┬───────────────────────────────────┘
                              ↓ imports
┌─────────────────────────────────────────────────────────────────┐
│  UTILITY LAYER 0 (utility/)                                     │
│  "Purely technical — zero feature knowledge / 3rd party wrap"   │
│                                                                 │
│  ┌──────────┐ ┌───────────┐ ┌───────────┐ ┌────────────────┐    │
│  │  prelude │ │ monitoring│ │preferences│ │    analysis    │    │
│  │ (Result) │ │(analytics)│ │(SharedPrf)│ │  (lint rules)  │    │
│  └──────────┘ └───────────┘ └───────────┘ └────────────────┘    │
│  ┌──────┐ ┌────────────┐ ┌──────────────┐ ┌────────────────┐    │
│  │  di  │ │ entrypoint │ │ flow_builder │ │ state_mgmt     │    │
│  └──────┘ └────────────┘ └──────────────┘ └────────────────┘    │
└─────────────────────────────┬───────────────────────────────────┘
                              ↓ (test infrastructure only)
┌─────────────────────────────────────────────────────────────────┐
│  QA  (qa/)                                                      │
│  ┌──────────────┐  ┌────────────────────────────────────────┐   │
│  │  bdd_steps   │  │  mocked_be                             │   │
│  │  (BDD steps) │  │  (scenario-based HTTP mock)            │   │
│  └──────────────┘  └────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

#### Advanced structure with Business Areas (for scaled projects)

```
APPLICATION
     ↓
BUSINESS AREA (e.g. features/banking/)
  ├── payments
  ├── accounts
  ├── transactions
  ├── core            (local — shared within BA only, not exported)
  └── service/shared  (minimal — exported to other BAs)
     ↓
UTILITY L1
     ↓
UTILITY L0
```

### Dependency Rule

```
Application → Feature → Utility L1  → Utility L0

Downward imports (any level):  ALLOWED
Upward imports (any level):  FORBIDDEN
Cross-feature imports:       FORBIDDEN (use Application navigator instead)
Utility → Feature:           FORBIDDEN
```

---

### Testing Strategy

| Layer | Test type | Rationale |
|---|---|---|
| Feature | **BDD tests** | Tests whole feature functionality with least effort; closest to UX testing |
| Utility (logic / use cases) | **Regular unit tests** | Pure logic, no UI |
| Utility (UI kit / design system) | **Golden tests** | Visual regression testing |

Rules for feature tests:
- Test only the encapsulated functionality of the feature itself
- All imported utilities must be mocked
- All api calls should be handled with scenario
- Cross-feature entrypoint widgets must be wrapped in `TestFacade` (invisible to the feature's own tests)

