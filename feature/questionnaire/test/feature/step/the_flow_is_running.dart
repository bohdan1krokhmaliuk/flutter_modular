import 'package:bdd_steps/initalization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_entrypoint.dart';

import '../../utils/scenarios.dart';

/// Usage: the flow is running
Future<void> theFlowIsRunning(
  WidgetTester tester, {
  Scenario? scenario,
  bool hasQuestionsError = false,
}) async => testInit(
  tester,
  QuestionnaireEntrypoint.new,
  scenario: scenario ?? successScenario,
);
