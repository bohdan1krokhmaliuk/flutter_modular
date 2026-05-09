// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:design_system/design_system.dart';
import '../utils/scenarios.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_flow_is_running.dart';
import 'package:bdd_steps/step/text/i_see_text.dart';
import 'package:bdd_steps/step/design_system/i_see_illustration.dart';
import 'package:bdd_steps/step/widget/i_see_button_with_text.dart';
import 'package:bdd_steps/step/text/i_tap_text.dart';
import 'package:bdd_steps/step/interactions/i_dismiss_the_page.dart';
import './step/i_go_thorugh_quiz_with_answers.dart';
import 'package:bdd_steps/step/interactions/page_closes_with_result.dart';

void main() {
  group('''Questionarrie feature''', () {
    testWidgets('''User can see wellcome page''', (tester) async {
      await theFlowIsRunning(tester);
      await iSeeText(tester, 'Ready to test your knowledge?');
      await iSeeText(tester,
          "Welcome to the quiz! These questions are designed to help you reinforce what you've learned and discover new insights. Take your time and focus on the details. Good luck");
      await iSeeIllustration(tester, Illustrations.custom.questionnaire());
      await iSeeButtonWithText(tester, enabled: true, 'Start quiz');
    });
    testWidgets('''User can see error popup when failed to load questions''',
        (tester) async {
      await theFlowIsRunning(tester, scenario: failureQuestionsScenario);
      await iTapText(tester, 'Start quiz');
      await iSeeText(tester, 'Something went wrong!');
    });
    testWidgets('''User opens questions''', (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iSeeText(tester, '2 + 2 =');
      await iSeeText(tester, '4');
      await iSeeText(tester, '13');
      await iSeeButtonWithText(tester, enabled: false, 'Next');
    });
    testWidgets(
        '''Outline: User selects any option and button becomes active ('4')''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '4');
      await iSeeButtonWithText(tester, enabled: true, 'Next');
    });
    testWidgets(
        '''Outline: User selects any option and button becomes active ('13')''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '13');
      await iSeeButtonWithText(tester, enabled: true, 'Next');
    });
    testWidgets('''User proceeds to next (final) question''', (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '4');
      await iTapText(tester, 'Next');
      await iSeeText(tester, 'General question');
      await iSeeText(tester, 'Correct answer');
      await iSeeText(tester, 'Invalid answer');
      await iSeeButtonWithText(tester, enabled: false, 'Next');
    });
    testWidgets('''User selects option on final question''', (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '4');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Correct answer');
      await iSeeButtonWithText(tester, enabled: true, 'Submit');
    });
    testWidgets('''User answers questions correctly''', (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '4');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Correct answer');
      await iTapText(tester, 'Submit');
      await iSeeText(tester, 'Fantastic Job! 🎉');
      await iSeeText(tester,
          "You've successfully completed the quiz! You've shown great dedication and a solid grasp of the material. Take a moment to celebrate your progress—you've earned it!");
      await iSeeButtonWithText(tester, enabled: true, 'Close');
    });
    testWidgets(
        '''Outline: User answers questions incorrectly ('13', 'Correct answer')''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '13');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Correct answer');
      await iTapText(tester, 'Submit');
      await iSeeText(tester, 'Not Quite There Yet ✨');
      await iSeeText(tester,
          "Good effort! You've completed the session, but there's still room to grow. Review your results below and give it another shot whenever you're ready.");
      await iSeeButtonWithText(tester, enabled: true, 'Close');
      await iSeeButtonWithText(tester, enabled: true, 'Try again');
    });
    testWidgets(
        '''Outline: User answers questions incorrectly ('4', 'Invalid answer')''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '4');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Invalid answer');
      await iTapText(tester, 'Submit');
      await iSeeText(tester, 'Not Quite There Yet ✨');
      await iSeeText(tester,
          "Good effort! You've completed the session, but there's still room to grow. Review your results below and give it another shot whenever you're ready.");
      await iSeeButtonWithText(tester, enabled: true, 'Close');
      await iSeeButtonWithText(tester, enabled: true, 'Try again');
    });
    testWidgets(
        '''Outline: User answers questions incorrectly ('13', 'Invalid answer')''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '13');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Invalid answer');
      await iTapText(tester, 'Submit');
      await iSeeText(tester, 'Not Quite There Yet ✨');
      await iSeeText(tester,
          "Good effort! You've completed the session, but there's still room to grow. Review your results below and give it another shot whenever you're ready.");
      await iSeeButtonWithText(tester, enabled: true, 'Close');
      await iSeeButtonWithText(tester, enabled: true, 'Try again');
    });
    testWidgets('''User answers questions incorrectly and fixes it''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '13');
      await iTapText(tester, 'Next');
      await iDismissThePage(tester);
      await iTapText(tester, '4');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Correct answer');
      await iTapText(tester, 'Submit');
      await iSeeText(tester, 'Fantastic Job! 🎉');
      await iSeeText(tester,
          "You've successfully completed the quiz! You've shown great dedication and a solid grasp of the material. Take a moment to celebrate your progress—you've earned it!");
      await iSeeButtonWithText(tester, enabled: true, 'Close');
    });
    testWidgets('''User answers questions incorrectly and tries again''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iTapText(tester, 'Start quiz');
      await iTapText(tester, '13');
      await iTapText(tester, 'Next');
      await iTapText(tester, 'Invalid answer');
      await iTapText(tester, 'Submit');
      await iTapText(tester, 'Try again');
      await iSeeText(tester, '2 + 2 =');
      await iSeeText(tester, '4');
      await iSeeText(tester, '13');
      await iSeeButtonWithText(tester, enabled: false, 'Next');
    });
    testWidgets(
        '''Outline: User closes results page and quiz page finishes (close button) (correct: true, true)''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iGoThorughQuizWithAnswers(tester, correct: true);
      await iTapText(tester, 'Close');
      await pageClosesWithResult(tester, true);
    });
    testWidgets(
        '''Outline: User closes results page and quiz page finishes (close button) (correct: false, false)''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iGoThorughQuizWithAnswers(tester, correct: false);
      await iTapText(tester, 'Close');
      await pageClosesWithResult(tester, false);
    });
    testWidgets(
        '''Outline: User closes results page and quiz page finishes (back button) (correct: true, true)''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iGoThorughQuizWithAnswers(tester, correct: true);
      await iDismissThePage(tester);
      await pageClosesWithResult(tester, true);
    });
    testWidgets(
        '''Outline: User closes results page and quiz page finishes (back button) (correct: false, false)''',
        (tester) async {
      await theFlowIsRunning(tester);
      await iGoThorughQuizWithAnswers(tester, correct: false);
      await iDismissThePage(tester);
      await pageClosesWithResult(tester, false);
    });
    testWidgets('''User submits answers but be failure happens''',
        (tester) async {
      await theFlowIsRunning(tester, scenario: failureAnswersScenario);
      await iGoThorughQuizWithAnswers(tester, correct: true);
      await iSeeText(tester, 'Something went wrong!');
    });
  });
}
