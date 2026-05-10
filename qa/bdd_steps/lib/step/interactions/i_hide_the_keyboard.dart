import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I hide the keyboard
Future<void> iHideTheKeyboard(WidgetTester tester) async {
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await iWait(tester);
}
