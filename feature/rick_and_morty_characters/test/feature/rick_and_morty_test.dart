// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import '../utils/scenarios.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_feature_is_running.dart';
import 'package:bdd_steps/step/text/i_see_text.dart';
import 'package:bdd_steps/step/text/i_see_texts.dart';
import 'package:bdd_steps/step/text/i_tap_text.dart';
import 'package:bdd_steps/step/interactions/i_wait.dart';
import 'package:bdd_steps/step/text/i_dont_see_text.dart';
import 'package:bdd_steps/step/interactions/i_scroll_to_bottom.dart';
import 'package:bdd_steps/step/widget/i_see_icon.dart';

void main() {
  group('''Rick and morty feature''', () {
    testWidgets('''User can see rick and morty characters list''',
        (tester) async {
      await theFeatureIsRunning(tester);
      await iSeeText(tester, 'Explore characters of R&M');
      await iSeeTexts(tester, [
        'Character 1',
        'Character 2',
        'Character 3',
        'Character 4',
        'Character 5'
      ]);
    });
    testWidgets('''User can see failure page''', (tester) async {
      await theFeatureIsRunning(tester, scenario: failureScenario);
      await iSeeText(tester, 'Explore characters of R&M');
      await iSeeText(tester, 'Something went wrong!');
      await iSeeText(tester, 'Retry');
    });
    testWidgets('''User retry on failure page''', (tester) async {
      await theFeatureIsRunning(tester, scenario: failureScenario);
      await iTapText(tester, 'Retry');
      await iWait(tester);
      await iDontSeeText(tester, 'Something went wrong!');
      await iSeeTexts(tester, [
        'Character 1',
        'Character 2',
        'Character 3',
        'Character 4',
        'Character 5'
      ]);
    });
    testWidgets('''User scrolls to bottom''', (tester) async {
      await theFeatureIsRunning(tester);
      await iScrollToBottom(tester);
      await iWait(tester);
      await iSeeTexts(tester, [
        'Character 14',
        'Character 15',
        'Character 16',
        'Character 17',
        'Character 18',
        'Character 19'
      ]);
    });
    testWidgets('''User can see different contents''', (tester) async {
      await theFeatureIsRunning(tester, scenario: successContentScenario);
      await iSeeText(tester, 'Woman');
      await iSeeText(tester, 'Man');
      await iSeeText(tester, 'Alien');
      await iSeeText(tester, 'Unknown');
      await iSeeIcon(tester, Icons.male);
      await iSeeIcon(tester, Icons.female);
      await iSeeIcon(tester, Icons.question_mark);
      await iSeeIcon(tester, Icons.transgender);
    });
  });
}
