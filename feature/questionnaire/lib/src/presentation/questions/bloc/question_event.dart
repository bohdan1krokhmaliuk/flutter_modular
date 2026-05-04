part of 'question_bloc.dart';

@blocEvent
sealed class QuestionEvent with _$QuestionEvent {
  const factory QuestionEvent.select(Answer answer) = _SelectEvent;
  const factory QuestionEvent.next() = _NextEvent;
  const factory QuestionEvent.submit() = _SubmitEvent;
}
