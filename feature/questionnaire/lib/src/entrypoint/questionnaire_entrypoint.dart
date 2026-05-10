import 'package:entrypoint/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:questionnaire/src/di/di_initializer.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart';
import 'package:questionnaire/src/presentation/completed/completed_page.dart';
import 'package:questionnaire/src/presentation/localization/localizations_delegate.dart';
import 'package:questionnaire/src/presentation/questions/question_page.dart';
import 'package:questionnaire/src/presentation/wellcome/wellcome_page.dart';

class QuestionnaireEntrypoint extends StatelessWidget {
  const QuestionnaireEntrypoint({super.key});

  @override
  Widget build(BuildContext context) => Entrypoint<QuestionarrieState>.flow(
    state: const QuestionarrieState(),
    onGeneratePages: _onGeneratePages,
    initializer: const QuestionnaireDIInitializer(),
    localizationsDelegate: QuestionnaireLocalizationsDelegate(),
  );

  List<Page<dynamic>> _onGeneratePages(
    QuestionarrieState state,
    List<Page<dynamic>> pages,
  ) {
    if (state.isCorrect case final isCorrect?) {
      return [MaterialPage(child: CompletedPage(isCorrect: isCorrect))];
    } else if (state.questions.isEmpty) {
      return [const MaterialPage(child: WellcomePage())];
    } else if (state.next case final next? when state.selected.isEmpty) {
      return [
        const MaterialPage(child: WellcomePage()),
        MaterialPage(child: QuestionPage(question: next)),
      ];
    } else if (state.next case final next?) {
      return [
        ...pages,
        MaterialPage(
          child: QuestionPage(question: next, preselected: state.preselected),
        ),
      ];
    }
    return pages;
  }
}
