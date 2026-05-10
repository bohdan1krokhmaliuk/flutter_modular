import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait for {3} seconds
Future<void> iWaitForSeconds(WidgetTester tester, int seconds) async {
  await tester.pump(Duration(seconds: seconds));
}
