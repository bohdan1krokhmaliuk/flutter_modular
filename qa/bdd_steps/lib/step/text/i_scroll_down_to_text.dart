import 'package:bdd_steps/step/interactions/i_scroll_down_to_finder.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I scroll down to {'lorem'} text
Future<void> iScrollDownToText(WidgetTester tester, String text) async {
  await iScrollDownToFinder(tester, find.text(text));
}
