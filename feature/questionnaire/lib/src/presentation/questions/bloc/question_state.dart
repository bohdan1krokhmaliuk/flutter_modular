part of 'question_bloc.dart';

@blocState
sealed class QuestionState with _$QuestionState implements PresentingState {
  const factory QuestionState({
    required Question question,
    Answer? selected,
    Presentation? presentation,
  }) = _QuestionState;
}
