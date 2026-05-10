part of 'sandbox_bloc.dart';

@blocState
sealed class SandboxState with _$SandboxState implements PresentingState {
  const factory SandboxState.loading({Presentation? presentation}) =
      _LoadingState;
  const factory SandboxState.content({
    @Default(false) bool isRickAndMortyAvailable,
    @Default(false) bool isQuestionnaireAvailable,
    Presentation? presentation,
  }) = _State;
}
