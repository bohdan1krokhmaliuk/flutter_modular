# Testing Strategy — Miniclient Flutter Monorepo
### A Flutter Developer's Guide

---

## 1. The Three Test Types and When to Use Each

The single most important rule in this project is this: **the type of test you write is determined by what the package contains — UI or logic — not by personal preference.**

```
Package contains UI + logic?   →  BDD widget test
Package contains logic only?   →  Unit test
Package contains UI only?      →  Golden test
```

### BDD Widget Tests — `feature/` packages

Use BDD tests for every package under `feature/`. Features always contain both a BLoC (logic) and a widget tree (UI), and the whole point of a feature test is to verify that they work correctly together — that when the BLoC emits a state, the right UI appears, and when the user taps something, the right BLoC event fires.

A BDD test boots the real DI container, renders the real feature widget, and drives it through user interactions. It only mocks things at the feature's boundary — the network, the Navigator, the Configurator.

### Unit Tests — `utility/` and repository/domain code

Use unit tests for packages that are pure logic with no UI. In this project that means `utility/prelude` (the `Result<S,F>` type), repositories inside features (`SandboxRepository`, `CharactersRepository`, `QuestionsRepository`), and any domain extension logic (like `QuestionarrieStateX`).

Unit tests call functions directly. No `WidgetTester`. No `pumpWidget`. Just input → expected output.

### Golden Tests — `core/design_system`

Use golden tests for the design system package, which is a UI-only library. There is no logic to test here — just visual correctness. A golden test renders a widget, takes a screenshot, and compares it to a saved reference image. If someone changes `PlatformCard` padding and the golden doesn't match, CI fails.

---

## 2. What is a BDD Test in Flutter / Dart?

BDD stands for **Behaviour Driven Development**. The idea is to write tests that describe user behaviour in plain language before writing any implementation. The key tool here is the `bdd_widget_test` package.

`bdd_widget_test` uses `.feature` files written in **Gherkin syntax** — a structured plain-English format:

```gherkin
Feature: Sandbox home screen

  Scenario: All features shown when both are available
    Given the sandbox page is opened
    And both features are available
    When I wait
    Then I see 'Check out our new rick and morty list!' text
    And I see 'Pass your knowledge quiz!' text
```

Each line (`Given`, `When`, `Then`, `And`) maps to a **step function** in Dart. The `bdd_widget_test` code generator reads the `.feature` file and generates a `_test.dart` file that calls those step functions in order. You never write the test runner manually — you write the `.feature` file and the step implementations.

To run generation:
```bash
# Inside package (we typically work inside each package, rather than in monorepo)
dart run build_runner build
```

The generated file ends in `_test.dart` and is committed alongside the `.feature` file. You commit both.

---

## 3. What are BDD Steps?

A step is just a Dart function. Its signature must match what appears in the `.feature` file. Convention in this project is:

```dart
/// Usage: Given the sandbox page is opened
Future<void> sandboxPageIsOpened(WidgetTester tester) async {
  // ...
}
```

The `/// Usage:` comment is the Gherkin line that maps to this function. `WidgetTester` is always the first parameter — `bdd_widget_test` injects it automatically.

Steps can take parameters from the Gherkin line. The `bdd_widget_test` parser extracts values from curly-brace placeholders:

```gherkin
When I tap {'Start quiz'} text
Then I see exactly {5} Card widgets
```

```dart
/// Usage: When I tap {text} text
Future<void> iTapText(WidgetTester tester, String text) async {
  await tester.tap(find.text(text));
  await tester.pumpAndSettle();
}

/// Usage: Then I see exactly {count} {type} widgets
Future<void> iSeeExactlyWidgets(WidgetTester tester, int count, Type type) async {
  expect(find.byType(type, skipOffstage: false), findsNWidgets(count));
}
```

### Which steps should be global vs. feature-specific?

**Global steps live in `qa/bdd_steps`.** A step is global when it is completely domain-agnostic — it works the same way regardless of which feature is being tested. Examples already in the project:

- `iSeeText`, `iTapText`, `iDontSeeText` — always the same implementation
- `iWait`, `iScrollToBottom`, `iDismissThePage` — pure widget interaction
- `iSeeWidget`, `iTapWidget`, `iSeeIcon` — type-based finders
- `theBeIsMockedWithScenario` — network layer setup (same mechanism for all features)
- `pageClosesWithResult` — verifies what a feature page returns when it pops

**Feature-specific steps live in the feature's own `test/steps/` folder.** A step is feature-specific when it knows about a concrete class or interface that only exists in that feature. Examples:

- `sandboxPageIsOpened` — knows about `SandboxEntrypoint`, `SandboxDIInitializer`, `MockSandboxNavigator`
- `bothFeaturesAreAvailable` — knows about `MockSandboxConfigurator`
- `openRickAndMortyWasCalled` — knows about `SandboxNavigator`

The rule of thumb: if you would need to import a `feature/xxx` package to write the step, it belongs in that feature's test folder. If the step only imports Flutter or `qa/bdd_steps` internals, it belongs globally.

---

## 4. How `testInit` Works — the BDD Bootstrap Function

Every BDD test in this project starts with `testInit`. Never call `tester.pumpWidget` directly. Here is what `testInit` does, step by step:

```dart
Future<void> testInit<T>(
  WidgetTester tester,
  Widget Function() builder, {
  DIInitializer? initializer,  // feature-specific DI (your mocks)
  FutureOr<void> Function()? postDi,
  FutureOr<void> Function()? tearDown,
  ValueSetter<T?>? onComplete,  // called when the feature page pops with a result
  bool waitForSettle = true,
  Scenario? scenario,  // which mock BE scenario to activate
}) async {
  // 1. Reset and rebuild the DI container
  await initializeDIContainer(
    DIInitializer.combined([?initializer, testAppInitializer]),
  );

  // 2. Set the active mock BE scenario (if any)
  await theBeIsMockedWithScenario(tester, scenario);

  // 3. Run any post-DI setup
  await postDi?.call();

  // 4. Pump the TestApp wrapping your feature widget
  await tester.pumpWidget(
    TestApp<T>(builder: builder, onComplete: ...),
  );

  // 5. Wait for all animations and async operations to settle
  if (waitForSettle) await iWait(tester);
}
```

The `testAppInitializer` (always combined with your initializer) registers mocks for `Monitoring`, `Preferences`, `NavigatorMonitoringObserver`, `ScenarioRepository`, `ApiClient`, and `Interceptors`. This means those are already mocked for you — you only need to add your feature-specific mocks on top.

`TestApp<T>` wraps your widget in a `MaterialApp` with the test locale (`en_US`), a `GlobalKey<NavigatorState>`, and the common localization delegate. It also pushes your widget onto a navigator so that `flow.complete()` / `Navigator.pop()` work correctly and the return value is captured by `onComplete`.

---

## 5. How BE Mocking Works — the Full Picture

This is the most important thing to understand before writing any feature test that touches the network.

### The problem

Features use Dio + Retrofit to make HTTP calls. In tests you cannot hit a real server — it would be slow, flaky, and untestable. But you also cannot just mock the repository class with mocktail, because then you'd be testing a fake BLoC talking to a fake repository: you'd test nothing real.

The correct approach is to **let the real Retrofit API, the real repository, and the real BLoC run — and only intercept at the Dio level**, returning fake JSON responses. This way the full stack is exercised.

### How `MockedBeInterceptor` works

`MockedBeInterceptor` is a Dio interceptor registered by `InterceptorsDIInitializer` whenever `Platform.environment.containsKey('FLUTTER_TEST')` is true (i.e., always in tests).

When a request is made, the interceptor:
1. Asks `ScenarioRepository.getActiveScenario()` for the currently active scenario
2. Iterates through that scenario's `RequestHandler` list
3. Each `RequestHandler` has a `RequestMatcher` — a function that returns `true` if this handler should handle this request
4. The first matching handler's `RequestAction` is called and returns either `success(jsonString)` or `failure(ResponseError)`
5. The interceptor resolves or rejects the Dio request accordingly — the rest of the stack (Retrofit deserialisation, repository `Result.fromAsync`, BLoC `result.fold`) runs normally

```
Test                    Dio                  MockedBeInterceptor
 │                       │                           │
 │  testInit(scenario:   │                           │
 │    _questionnaire)    │                           │
 │──────────────────────►│                           │
 │                       │  onRequest intercepted    │
 │  WellcomeBloc         │──────────────────────────►│
 │  calls _repository    │                           │ matches GET /questions
 │  .load()              │                           │──── sendSuccess(json)
 │                       │◄──────────────────────────│
 │                       │  resolves with JSON       │
 │  Retrofit parses JSON │                           │
 │  Result<List<Q>, F>   │                           │
 │  BLoC emits state     │                           │
 │  Widget rebuilds      │                           │
```

### How scenarios are defined

A `Scenario` is a list of `RequestHandler`s. Each handler is a pair of:
- A `RequestMatcher` — built from combinators like `hasMethod('GET')`, `hasPath('/questions')`, `hasQueryParams({'page': '1'})`
- A `RequestAction` — either `sendSuccess(jsonString)`, `sendError(statusCode)`, or a custom lambda

From the actual code in `qa/mocked_be/lib/src/scenarios/scenarios/questionnaire.dart`:
(this is global scenario, but in test scenarios are defined same way)

```dart
final _questionnaire = Scenario('questionnaire', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/questions')]),
    sendSuccess('{"results": [...]}'),
  ),
  RequestHandler(
    multiMatcherAnd([hasMethod('POST'), hasPath('/questions')]),
    (request) async {
      final answerIds = request.queryParams?['answers'] ?? '';
      // custom logic to return correct/incorrect based on submitted answers
      return success('{"isCorrect": true}');
    },
  ),
]);
```

### How to add a new global scenario 

1. Add a new `part` file in `qa/mocked_be/lib/src/scenarios/scenarios/`
2. Define a `Scenario` const with a unique name string and list of `RequestHandler`s
3. Add it to the `scenarioEntries` list in `scenarios.dart`

```dart
// qa/mocked_be/lib/src/scenarios/scenarios/characters.dart
part of '../scenarios.dart';

final _charactersPage1 = Scenario('characters_page_1', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/character'), hasQueryParams({'page': '1'})]),
    sendSuccess('{"info": {...}, "results": [...]}'),
  ),
]);

final _charactersError = Scenario('characters_error', [
  RequestHandler(
    multiMatcherAnd([hasMethod('GET'), hasPath('/character')]),
    sendError(500),
  ),
]);
```

```dart
// scenarios.dart
List<ScenarioEntry> scenarioEntries = [
  ScenarioGroup('Debug mock scenarios', [_questionnaire]),
  ScenarioGroup('Characters', [_charactersPage1, _charactersError]), // ← add here
];
```

### How to use a scenario in a test

1. Under feature `test` `folder create utils/scenarios.dart`
2. Define a `Scenario` and list of `RequestHandler`s
3. Add it to the feature `Given` step (Pass it to `testInit`) or define scenario change with  `the BE is mocked with {scenarioName} scenario` step

Pass it to `testInit`:

```dart
await testInit(
  tester,
  () => const CharactersEntrypoint(),
  initializer: const RickAndMortyCharactersDIInitializer(),
  scenario: _charactersPage1,  // ← the Scenario object from mocked_be
);
```

`testInit` calls `theBeIsMockedWithScenario` which calls `mockScenarioRepository.getActiveScenario()` to return that scenario. The interceptor then picks it up on every Dio request made during the test.

### Changing scenarios mid-test

When testing pagination (load more), you need page 1 to succeed and page 2 to be triggered by a user scroll. You can change the active scenario between interactions:

```dart
// Load page 1
await testInit(tester, () => const CharactersEntrypoint(),
  initializer: const RickAndMortyCharactersDIInitializer(),
  scenario: _charactersPage1,
);
await iSeeMultipleWidgets(tester, Card);

// Change scenario before triggering load more
await theBeIsMockedWithScenario(tester, _charactersPage2);
await iScrollToBottom(tester);
await iWait(tester);
// now page 2 characters also visible
```

### Using `sendMultiple` for sequential responses

When the same endpoint is hit multiple times in one test and you want different responses each time:

```dart
RequestHandler(
  multiMatcherAnd([hasMethod('GET'), hasPath('/character')]),
  sendMultiple([
    sendSuccess(page1Json),   // first call returns page 1
    sendError(500),           // second call returns error
  ]),
),
```

---

## 6. Verifying Navigation in BDD Tests

Features never call AutoRoute directly — they call their `XxxNavigator` abstract interface. In tests, you register a `MockXxxNavigator` (mocktail mock) in DI instead of the real `XxxNavigatorImpl`.

### Setting up the mock

```dart
class MockSandboxNavigator extends Mock implements SandboxNavigator {}

MockSandboxNavigator setupSandboxNavigator() {
  final mock = MockSandboxNavigator();
  // default stubs — prevent MissingStubError if a call happens unexpectedly
  when(() => mock.openRickAndMorty()).thenAnswer((_) async {});
  when(() => mock.openQuestionnaire()).thenAnswer((_) async => null);
  return mock;
}
```

### Registering Mocks in DI 

**Order matters.** Register your mocks before the feature's `DIInitializer` so the feature's injectable-generated code finds the mock when it asks for `SandboxNavigator`:

```dart
await testInit(
  tester,
  () => const SandboxEntrypoint(),
  initializer: DIInitializer((getIt, _) => getIt
      ..registerSingleton<SandboxNavigator>(mockNavigator)
      ..registerSingleton<SandboxConfigurator>(mockConfigurator)),
);
```

### Verifying a call was made

```dart
await iTapText(tester, 'Check out our new rick and morty list!');
verify(() => mockNavigator.openRickAndMorty()).called(1);
```

### Stubbing a return value (questionnaire result)

```dart
when(() => mockNavigator.openQuestionnaire()).thenAnswer((_) async => true);

await iTapText(tester, 'Pass your knowledge quiz!');
await iWait(tester);

// SandboxBloc receives true → emits Congrats() presentation → toast shown
await iSeeText(tester, 'Good Job!');
```

---

## 7. Feature Test Folder Structure

Every feature's `test/` folder follows this layout:

```
feature/sandbox/test/
  feature/
    steps/
      sandbox_page_is_opened.dart   ← feature bootstrap step
      configurator_steps.dart       ← stubs for SandboxConfigurator
      navigator_steps.dart          ← verify steps for SandboxNavigator
    sandbox.feature                 ← the Gherkin scenarios
    sandbox_test.dart               ← generated by bdd_widget_test, do not edit
  utils/
    mocks.dart        ← Feature mocks definition and behaviour mocking
    scenarios.dart    ← Feature api scenarios mocks
      
```

The `.feature` file and the generated `_test.dart` are committed. The `steps/` and `mocks/` folders are written by you.

---

## 8. What `pageClosesWithResult` Tests

When a feature page calls `_flow.complete(value)` or `Navigator.pop(context, value)`, it returns a result to whoever opened it. In `SandboxBloc`, the questionnaire navigation returns a `bool?` — `true` for success, `false` for failure.

In tests, `TestApp<T>` captures this via the `onComplete` callback. `pageClosesWithResult` then verifies that `TestPageCompleter.call(value)` was called with the expected value:

```dart
// Scenario: questionnaire closes and returns true → Congrats toast appears in sandbox
// But if you're testing questionnaire itself in isolation:

bool? capturedResult;
await questionnaireIsOpened(
  tester,
  scenario: _questionnaireSubmitCorrect,
  onComplete: (v) => capturedResult = v,
);

// ... drive through all steps to completion ...

await pageClosesWithResult(tester, true);
// or check capturedResult directly
expect(capturedResult, true);
```

---

## 9. Quick Reference

### Choosing your test type

| Question | Answer |
|---|---|
| Is it feature or feature like utility?  | Yes → BDD |
| Is it a pure UI library (design system)? | Yes → Golden |
| Is it pure Dart logic with no Flutter? | Yes → Unit test |

### `RequestAction` helpers

| Helper | Use when |
|---|---|
| `sendSuccess(jsonString)` | API call succeeds with a JSON body |
| `sendError(statusCode)` | API call fails with an HTTP error |
| `sendError(statusCode, responseBody: '...')` | Failure with a body (custom error parsing) |
| `sendException(exception)` | Simulates a network-level exception (no HTTP response) |
| `sendMultiple([action1, action2])` | Same endpoint returns different responses on successive calls |
| `sendSuccess(json, delay: Duration(seconds: 1))` | Test loading states that need a delay |