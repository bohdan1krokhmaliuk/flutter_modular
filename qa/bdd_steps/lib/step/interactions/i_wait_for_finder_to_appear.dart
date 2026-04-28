import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for finder to appear
Future<void> iWaitForFinderToAppear(WidgetTester tester, Finder finder) async {
  int attempts = 100;
  while (attempts > 0 && finder.evaluate().isEmpty) {
    await tester.pump(const Duration(milliseconds: 50));
    attempts -= 1;
  }

  if (attempts == 0) {
    throw Exception('Widget not found');
  }
}
