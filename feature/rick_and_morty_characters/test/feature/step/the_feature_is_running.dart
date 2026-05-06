import 'package:bdd_steps/initalization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';
import 'package:rick_and_morty_characters/src/entrypoint/characters_entrypoint.dart';

import '../../utils/scenarios.dart';

/// Usage: the feature is running
Future<void> theFeatureIsRunning(
  WidgetTester tester, {
  Scenario? scenario,
}) async => testInit(
  tester,
  CharactersEntrypoint.new,
  scenario: scenario ?? successScenario,
);
