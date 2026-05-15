import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:questionnaire/src/domain/model/answer.dart';
import 'package:questionnaire/src/domain/model/question.dart';

part 'questionnaire_state.freezed.dart';

@freezed
sealed class QuestionnaireState with _$QuestionnaireState {
  const factory QuestionnaireState({
    @Default([]) List<Question> questions,
    @Default([]) List<Answer> selected,
    Question? next,
    bool? isCorrect,
  }) = _State;
}

extension QuestionnaireStateX on QuestionnaireState {
  QuestionnaireState reset() =>
      copyWith(selected: [], next: questions.firstOrNull, isCorrect: null);

  QuestionnaireState saveAnswer(Answer answer) {
    final currentAnswerIds = questions
        .map((q) => [...q.answers.map((a) => a.id)])
        .firstWhere((ids) => ids.contains(answer.id), orElse: () => []);

    final newSelected = selected.toList();
    newSelected
      ..removeWhere((a) => currentAnswerIds.contains(a.id))
      ..add(answer);

    return copyWith(
      selected: newSelected,
      next: questions.where((q) => q.id == answer.nextQuestion).firstOrNull,
    );
  }

  QuestionnaireState setQuestions(List<Question> questions) {
    return copyWith(questions: questions, next: questions.firstOrNull);
  }

  Answer? get preselected {
    if (next case final next?) {
      return selected.where((s) => next.answers.contains(s)).firstOrNull;
    }
    return null;
  }

  List<String> get answerIds => selected.map((a) => a.id).toList();
}
