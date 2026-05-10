import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see input field {enabled: false, index: 3}
Future<void> iSeeInputField(
  WidgetTester tester, {
  bool enabled = true,
  int index = 0,
}) async {
  final finder = find.byType(TextField).at(index);
  expect((tester.firstWidget(finder) as TextField).enabled, enabled);
}
