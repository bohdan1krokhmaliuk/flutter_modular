part of 'wellcome_bloc.dart';

@blocState
sealed class WellcomeState with _$WellcomeState implements PresentingState {
  const factory WellcomeState({
    @Default(false) bool isLoading,
    Presentation? presentation,
  }) = _WellcomeState;
}
