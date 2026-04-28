import 'package:bdd_steps/step/interactions/i_wait_for_finder_to_disappear.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for widget {SizedBox} to disappear
Future<void> iWaitForWidgetToDisappear(WidgetTester tester, Type widget) async {
  await iWaitForFinderToDisappear(tester, find.byType(widget));
}
