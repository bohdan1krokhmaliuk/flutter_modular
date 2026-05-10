// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_sandbox_is_running.dart';
import 'package:bdd_steps/step/text/i_see_text.dart';
import 'package:bdd_steps/step/text/i_dont_see_texts.dart';
import 'package:bdd_steps/step/text/i_tap_text.dart';
import 'package:bdd_steps/step/interactions/i_wait.dart';
import './step/i_am_navigated_to_feature.dart';

void main() {
  group('''Sandbox feature''', () {
    testWidgets('''User can see feature ui''', (tester) async {
      await theSandboxIsRunning(tester);
      await iSeeText(tester, 'Home');
      await iSeeText(tester, 'Check out our new rick and morty list!');
      await iSeeText(tester,
          'This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters');
      await iSeeText(tester, 'Pass your knowledge quiz!');
      await iSeeText(tester,
          'This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully');
      await iSeeText(tester, 'Make custom failure api call');
      await iSeeText(tester, 'Make failure api call');
      await iSeeText(tester,
          'This card onTap logic makes an api call which always fails - and it demostrates how Presenter handles default exceptions');
    });
    testWidgets(
        '''Outline: User can't see parts of feature ui if disabled (isRickAndMortyAvailable: false, ['Check out our new rick and morty list!','This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters'])''',
        (tester) async {
      await theSandboxIsRunning(tester, isRickAndMortyAvailable: false);
      await iDontSeeTexts(tester, [
        'Check out our new rick and morty list!',
        'This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters'
      ]);
    });
    testWidgets(
        '''Outline: User can't see parts of feature ui if disabled (isQuestionnaireAvailable: false, ['Pass your knowledge quiz!','This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully'])''',
        (tester) async {
      await theSandboxIsRunning(tester, isQuestionnaireAvailable: false);
      await iDontSeeTexts(tester, [
        'Pass your knowledge quiz!',
        'This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully'
      ]);
    });
    testWidgets(
        '''Outline: User clicks on api call cards ('Make failure api call', 'Something went wrong!')''',
        (tester) async {
      await theSandboxIsRunning(tester);
      await iTapText(tester, 'Make failure api call');
      await iWait(tester);
      await iSeeText(tester, 'Something went wrong!');
    });
    testWidgets(
        '''Outline: User clicks on api call cards ('Make custom failure api call', 'We intercepted custom exception here :)')''',
        (tester) async {
      await theSandboxIsRunning(tester);
      await iTapText(tester, 'Make custom failure api call');
      await iWait(tester);
      await iSeeText(tester, 'We intercepted custom exception here :)');
    });
    testWidgets('''User navigates to rick and morty feature''', (tester) async {
      await theSandboxIsRunning(tester);
      await iTapText(tester, 'Check out our new rick and morty list!');
      await iAmNavigatedToFeature(tester, rickAndMorty: true);
    });
    testWidgets('''User navigates to questionnaire feature''', (tester) async {
      await theSandboxIsRunning(tester);
      await iTapText(tester, 'Pass your knowledge quiz!');
      await iAmNavigatedToFeature(tester, questionnaire: true);
    });
    testWidgets(
        '''Outline: User is congratulated on navigation from questionnaire feature (passedQuestionnaire: false, 'Good luck next time!')''',
        (tester) async {
      await theSandboxIsRunning(tester, passedQuestionnaire: false);
      await iTapText(tester, 'Pass your knowledge quiz!');
      await iSeeText(tester, 'Good luck next time!');
    });
    testWidgets(
        '''Outline: User is congratulated on navigation from questionnaire feature (passedQuestionnaire: true, 'Good Job!')''',
        (tester) async {
      await theSandboxIsRunning(tester, passedQuestionnaire: true);
      await iTapText(tester, 'Pass your knowledge quiz!');
      await iSeeText(tester, 'Good Job!');
    });
  });
}
