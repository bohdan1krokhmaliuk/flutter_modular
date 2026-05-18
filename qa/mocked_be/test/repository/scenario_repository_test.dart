import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/src/core/scenario.dart';
import 'package:mocked_be/src/repository/scenario_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences/preferences.dart';

class _MockPreferences extends Mock implements Preferences {}

const _activeScenarioKey = '_active_mocked_scenario';

// A named scenario sitting directly inside a ScenarioGroup, exercising
// the recursive _findByName path.
const _flatScenario = Scenario('flat_scenario', []);
const _nestedScenario = Scenario('nested_scenario', []);
const _testScenarios = [
  _flatScenario,
  ScenarioGroup('group', [_nestedScenario]),
];

/// Thin subclass that substitutes the hard-coded scenarioEntries.
class _TestScenarioRepository extends ScenarioRepository {
  const _TestScenarioRepository(Preferences preferences) : super(preferences);

  @override
  List<ScenarioEntry> get scenarios => _testScenarios;
}

void main() {
  late _MockPreferences prefs;
  late ScenarioRepository repo;

  setUp(() {
    prefs = _MockPreferences();
    repo = _TestScenarioRepository(prefs);
  });

  group('getActiveScenario', () {
    test('returns null when no key is stored and no fallback given', () {
      when(() => prefs.getString(_activeScenarioKey)).thenReturn(null);

      check(repo.getActiveScenario()).isNull();
    });

    test('returns null when stored name matches no scenario', () {
      when(() => prefs.getString(_activeScenarioKey)).thenReturn('unknown');

      check(repo.getActiveScenario()).isNull();
    });

    test('finds a flat Scenario by stored name', () {
      when(
        () => prefs.getString(_activeScenarioKey),
      ).thenReturn('flat_scenario');

      check(repo.getActiveScenario()).isNotNull().equals(_flatScenario);
    });

    test('finds a Scenario nested inside a ScenarioGroup', () {
      when(
        () => prefs.getString(_activeScenarioKey),
      ).thenReturn('nested_scenario');

      check(repo.getActiveScenario()).isNotNull().equals(_nestedScenario);
    });

    test('uses fallback name when no key is stored', () {
      when(() => prefs.getString(_activeScenarioKey)).thenReturn(null);

      check(
        repo.getActiveScenario(fallback: 'flat_scenario'),
      ).isNotNull().equals(_flatScenario);
    });

    test('stored key takes priority over fallback', () {
      when(
        () => prefs.getString(_activeScenarioKey),
      ).thenReturn('nested_scenario');

      check(
        repo.getActiveScenario(fallback: 'flat_scenario'),
      ).isNotNull().equals(_nestedScenario);
    });
  });

  group('setActiveScenario', () {
    test('stores the scenario name in preferences', () async {
      when(
        () => prefs.setString(_activeScenarioKey, 'flat_scenario'),
      ).thenAnswer((_) async => true);

      await repo.setActiveScenario(_flatScenario);

      verify(
        () => prefs.setString(_activeScenarioKey, 'flat_scenario'),
      ).called(1);
    });
  });

  group('clearActiveScenario', () {
    test('removes the active scenario key from preferences', () async {
      when(
        () => prefs.remove(_activeScenarioKey),
      ).thenAnswer((_) async => true);

      await repo.clearActiveScenario();

      verify(() => prefs.remove(_activeScenarioKey)).called(1);
    });
  });
}
