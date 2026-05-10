// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:flutter_confetti/flutter_confetti.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_presenter_is_running.dart';
import './step/i_trigger_presentation.dart';
import 'package:bdd_steps/step/text/i_see_text.dart';
import 'package:bdd_steps/step/widget/i_see_multiple_widgets.dart';

void main() {
  group('''Presenter feature''', () {
    testWidgets('''User can see unknow error toast''', (tester) async {
      await thePresenterIsRunning(tester);
      await iTriggerPresentation(tester, unknownError: true);
      await iSeeText(tester, 'Something went wrong!');
    });
    testWidgets('''User can see confetti''', (tester) async {
      await thePresenterIsRunning(tester);
      await iTriggerPresentation(tester, confetti: true);
      await iSeeMultipleWidgets(tester, Confetti);
    });
    testWidgets('''User defines custom toast presentation''', (tester) async {
      await thePresenterIsRunning(tester);
      await iTriggerPresentation(tester, custom: true);
      await iSeeText(tester, 'My custom presentation');
    });
  });
}
