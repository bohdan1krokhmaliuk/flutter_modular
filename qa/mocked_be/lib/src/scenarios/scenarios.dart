import 'package:mocked_be/src/core/request_handler.dart';
import 'package:mocked_be/src/core/request_matcher.dart';
import 'package:mocked_be/src/core/scenario.dart';
import 'package:prelude/prelude.dart';

part 'scenarios/questionnaire.dart';

/// Here we can add BE predefined mock scenarions for fake BE app preview
List<ScenarioEntry> scenarioEntries = [
  ScenarioGroup('Debug mock scenarios', [_questionnaire]),
];
