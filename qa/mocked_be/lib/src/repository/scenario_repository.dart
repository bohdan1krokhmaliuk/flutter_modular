import 'package:injectable/injectable.dart';
import 'package:mocked_be/src/core/scenario.dart';
import 'package:mocked_be/src/scenarios/scenarios.dart';
import 'package:preferences/preferences.dart';

const _activeScenarioKey = '_active_mocked_scenario';

@injectable
class ScenarioRepository {
  const ScenarioRepository(this._preferences);

  final Preferences _preferences;

  List<ScenarioEntry> get scenarios => scenarioEntries;

  Future<void> setActiveScenario(Scenario scenario) =>
      _preferences.setString(_activeScenarioKey, scenario.name);

  Future<void> clearActiveScenario() => _preferences.remove(_activeScenarioKey);

  Scenario? getActiveScenario({String? fallback}) {
    final name = _preferences.getString(_activeScenarioKey) ?? fallback;

    if (name == null) {
      return null;
    }

    return _findByName(scenarios, name);
  }

  Scenario? _findByName(List<ScenarioEntry> entries, String name) {
    for (final entry in entries) {
      final scenario = switch (entry) {
        Scenario(name: String entryName) => name == entryName ? entry : null,
        ScenarioGroup() => _findByName(entry.entries, name),
        _ => null,
      };
      if (scenario != null) {
        return scenario;
      }
    }
    return null;
  }
}
