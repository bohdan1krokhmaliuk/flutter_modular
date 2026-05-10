import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I tap {'some'} text
Future<void> iTapText(WidgetTester tester, String text) async {
  await tester.tap(find.text(text));
  await iWait(tester);
}
