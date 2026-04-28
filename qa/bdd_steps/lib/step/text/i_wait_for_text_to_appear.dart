import 'package:bdd_steps/step/interactions/i_wait_for_finder_to_appear.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for {'lorem'} text to appear
Future<void> iWaitForTextToAppear(WidgetTester tester, String text) async {
  await iWaitForFinderToAppear(tester, find.text(text));
}
