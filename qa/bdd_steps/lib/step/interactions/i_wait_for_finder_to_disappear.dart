import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for finder to disappear
Future<void> iWaitForFinderToDisappear(
  WidgetTester tester,
  Finder finder,
) async {
  int attempts = 100;
  while (attempts > 0 && finder.evaluate().isNotEmpty) {
    await tester.pump(const Duration(milliseconds: 50));
    attempts -= 1;
  }

  if (attempts == 0) {
    throw Exception('Widget still visible after 100 frames');
  }
}
