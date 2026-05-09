import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocked_be/core.dart';
import 'package:mocked_be/mocked_be.dart';
import 'package:mocktail/mocktail.dart';

/// Example: Given the BE is mocked with {scenarioName} scenario
Future<void> theBeIsMockedWithScenario(
  WidgetTester tester,
  Scenario? scenario,
) async {
  final mock = diContainer<ScenarioRepository>();
  when(
    () => mock.getActiveScenario(fallback: any(named: 'fallback')),
  ).thenReturn(scenario);
}
