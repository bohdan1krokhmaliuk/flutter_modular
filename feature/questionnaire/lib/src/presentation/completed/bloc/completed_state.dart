part of 'completed_bloc.dart';

@blocState
sealed class CompletedState with _$CompletedState implements PresentingState {
  const factory CompletedState({
    required bool isCorrect,
    Presentation? presentation,
  }) = _CompletedState;
}
