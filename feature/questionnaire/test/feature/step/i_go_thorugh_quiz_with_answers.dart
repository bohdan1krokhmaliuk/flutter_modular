import 'package:bdd_steps/step/text/i_tap_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I go thorugh quiz with <correct> answers
Future<void> iGoThorughQuizWithAnswers(
  WidgetTester tester, {
  required bool correct,
}) async {
  await iTapText(tester, 'Start quiz');
  await iTapText(tester, correct ? '4' : '13');
  await iTapText(tester, 'Next');
  await iTapText(tester, correct ? 'Correct answer' : 'Invalid answer');
  await iTapText(tester, 'Submit');
}
