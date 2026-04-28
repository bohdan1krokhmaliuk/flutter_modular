import 'package:flutter_test/flutter_test.dart';

/// Usage: I see text containing {'lorem part'}
Future<void> iSeeTextContaining(WidgetTester tester, String text) async {
  expect(find.textContaining(text), findsOneWidget);
}
