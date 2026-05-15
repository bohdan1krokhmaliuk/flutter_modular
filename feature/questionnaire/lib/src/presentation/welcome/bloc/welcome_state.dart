part of 'welcome_bloc.dart';

@blocState
sealed class WelcomeState with _$WelcomeState implements PresentingState {
  const factory WelcomeState({
    @Default(false) bool isLoading,
    Presentation? presentation,
  }) = _WelcomeState;
}
