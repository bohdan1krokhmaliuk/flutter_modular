import 'package:bdd_steps/initalization.dart';
import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox/src/entrypoint/sandbox_entrypoint.dart';

import '../../utils/mocks.dart';
import '../../utils/scenarios.dart';

/// Usage: the sandbox is running
Future<void> theSandboxIsRunning(
  WidgetTester tester, {
  bool? passedQuestionnaire,
  bool isQuestionnaireAvailable = true,
  bool isRickAndMortyAvailable = true,
}) async => testInit(
  tester,
  SandboxEntrypoint.new,
  scenario: alwaysFailureScenario,
  initializer: DIInitializer((_getIt, _) {
    return _getIt
      ..registerSingleton(
        buildConfigurator(
          isQuestionnaireAvailable: isQuestionnaireAvailable,
          isRickAndMortyAvailable: isRickAndMortyAvailable,
        ),
      )
      ..registerSingleton(
        buildNavigator(passedQuestionnaire: passedQuestionnaire),
      );
  }),
);
