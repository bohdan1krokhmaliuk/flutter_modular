import 'package:bdd_steps/step/text/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {['lorem','ipsum']} texts
Future<void> iSeeTexts(WidgetTester tester, List<String> texts) async {
  for (final text in texts) {
    await iSeeText(tester, text);
  }
}
