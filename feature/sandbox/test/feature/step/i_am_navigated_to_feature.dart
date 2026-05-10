import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sandbox/src/navigator/sandbox_navigator.dart';

/// Usage: I am navigated to {questionnaire: true} feature
Future<void> iAmNavigatedToFeature(
  WidgetTester tester, {
  bool questionnaire = false,
  bool rickAndMorty = false,
}) async {
  final navigator = diContainer<SandboxNavigator>();

  if (questionnaire) {
    verify(navigator.openQuestionnaire);
  }
  if (rickAndMorty) {
    verify(navigator.openRickAndMorty);
  }
}
