import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I scroll to bottom
Future<void> iScrollToBottom(WidgetTester tester) async {
  await tester.dragFrom(Offset(250, 300), const Offset(0, -10000));
  await iWait(tester);
}
