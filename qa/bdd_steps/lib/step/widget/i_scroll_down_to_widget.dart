import 'package:bdd_steps/step/interactions/i_scroll_down_to_finder.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I scroll down to {SizedBox} widget
Future<void> iScrollDownToWidget(WidgetTester tester, Type widget) async {
  await iScrollDownToFinder(tester, find.byType(widget));
}
