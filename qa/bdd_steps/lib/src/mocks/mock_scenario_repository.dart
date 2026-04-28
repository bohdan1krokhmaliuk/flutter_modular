import 'package:mocked_be/core.dart';
import 'package:mocked_be/mocked_be.dart';
import 'package:mocktail/mocktail.dart';

class MockScenarioRepository extends Mock implements ScenarioRepository {}

ScenarioRepository setupScenarioRepository() {
  registerFallbackValue(Scenario('', []));
  final mock = MockScenarioRepository();
  when(mock.clearActiveScenario).thenAnswer((_) => Future.value());
  when(() => mock.setActiveScenario(any())).thenAnswer((_) => Future.value());
  when(mock.getActiveScenario).thenReturn(null);
  return mock;
}
