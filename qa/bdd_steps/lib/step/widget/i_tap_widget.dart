import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I tap {'some'} widget
Future<void> iTapWidget(
  WidgetTester tester,
  Type widget, {
  int index = -1,
}) async {
  final finder = index != -1
      ? find.byType(widget).at(index)
      : find.byType(widget);
  await tester.tap(finder);
  await iWait(tester);
}
