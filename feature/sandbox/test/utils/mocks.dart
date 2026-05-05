import 'package:mocktail/mocktail.dart';
import 'package:sandbox/src/configurator/sandbox_configurator.dart';
import 'package:sandbox/src/navigator/sandbox_navigator.dart';

class SandboxConfiguratorMock extends Mock implements SandboxConfigurator {}

class SandboxNavigatorMock extends Mock implements SandboxNavigator {}

SandboxConfigurator buildConfigurator({
  bool isRickAndMortyAvailable = true,
  bool isQuestionnaireAvailable = true,
}) {
  final mock = SandboxConfiguratorMock();

  when(
    mock.isQuestionnaireAvailable,
  ).thenAnswer((_) async => isQuestionnaireAvailable);
  when(
    mock.isRickAndMortyAvailable,
  ).thenAnswer((_) async => isRickAndMortyAvailable);

  return mock;
}

SandboxNavigator buildNavigator({bool? passedQuestionnaire}) {
  final mock = SandboxNavigatorMock();

  when(mock.openRickAndMorty).thenAnswer((_) async => null);
  when(mock.openQuestionnaire).thenAnswer((_) async => passedQuestionnaire);

  return mock;
}
