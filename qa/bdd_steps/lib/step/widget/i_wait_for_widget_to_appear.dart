import 'package:bdd_steps/step/interactions/i_wait_for_finder_to_appear.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for widget {SizedBox} to appear
Future<void> iWaitForWidgetToAppear(WidgetTester tester, Type widget) async {
  await iWaitForFinderToAppear(tester, find.byType(widget));
}
