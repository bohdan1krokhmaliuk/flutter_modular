part of 'sandbox_bloc.dart';

@blocEvent
sealed class SandboxEvent with _$SandboxEvent {
  const factory SandboxEvent.load() = _LoadEvent;
  const factory SandboxEvent.openRickAndMory() = _OpenRickAndMortyEvent;
  const factory SandboxEvent.openQuestionnaire() = _OpenQuestionnaireEvent;
  const factory SandboxEvent.tirggerDefaultExceptionPresentation() =
      _DefaultExceptionEvent;
  const factory SandboxEvent.tirggerCustomExceptionPresentation() =
      _CustomExceptionEvent;
}
