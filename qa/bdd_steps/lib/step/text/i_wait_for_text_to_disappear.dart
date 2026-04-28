import 'package:bdd_steps/step/interactions/i_wait_for_finder_to_disappear.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for {'lorem'} text to disappear
Future<void> iWaitForTextToDisappear(WidgetTester tester, String text) async {
  await iWaitForFinderToDisappear(tester, find.text(text));
}
