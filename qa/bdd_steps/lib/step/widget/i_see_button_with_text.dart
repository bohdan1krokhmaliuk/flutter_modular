import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {enabled: true} button with {'Save'} text
Future<void> iSeeButtonWithText(
  WidgetTester tester,
  String text, {
  bool? enabled,
}) async {
  final finder = find.ancestor(
    of: find.text(text),
    matching: find.byWidgetPredicate((w) => w is ButtonStyleButton),
  );

  expect(
    finder,
    findsOneWidget,
    reason: 'Could not find any ButtonStyleButton with text: "$text"',
  );

  if (enabled != null) {
    final button = tester.widget<ButtonStyleButton>(finder);

    expect(
      button.enabled,
      enabled,
      reason:
          'Found button with text "$text", but it was ${button.enabled ? "enabled" : "disabled"} '
          'when {enabled: $enabled} was expected.',
    );
  }
}
