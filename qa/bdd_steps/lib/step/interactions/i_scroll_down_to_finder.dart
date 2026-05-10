import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I scroll down to {finder} finder
Future<void> iScrollDownToFinder(WidgetTester tester, Finder finder) async {
  final scrollable = find.byType(Scrollable);
  var attempts = 100;
  while (attempts > 0 && finder.evaluate().isEmpty) {
    await tester.drag(scrollable, const Offset(0, -50));
    await tester.pump(const Duration(milliseconds: 50));
    attempts -= 1;
  }

  if (finder.evaluate().isNotEmpty) {
    await Scrollable.ensureVisible(tester.element(finder));
    await iWait(tester);
  }
}
