import 'package:bdd_steps/step/text/i_dont_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I don't see {['lorem','ipsum']} texts
Future<void> iDontSeeTexts(WidgetTester tester, List<String> texts) async {
  for (final text in texts) {
    await iDontSeeText(tester, text);
  }
}
