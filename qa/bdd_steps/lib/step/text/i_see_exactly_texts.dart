import 'package:flutter_test/flutter_test.dart';

/// Usage: I see exactly {5} texts {'lorem'}
Future<void> iSeeExactlyTexts(
  WidgetTester tester,
  int count,
  String text,
) async {
  expect(find.text(text), findsNWidgets(count));
}
