part of 'sandbox_bloc.dart';

@blocEvent
sealed class SandboxEvent with _$SandboxEvent {
  const factory SandboxEvent.load() = _LoadEvent;
  const factory SandboxEvent.openRickAndMorty() = _OpenRickAndMortyEvent;
  const factory SandboxEvent.openQuestionnaire() = _OpenQuestionnaireEvent;
  const factory SandboxEvent.triggerDefaultExceptionPresentation() =
      _DefaultExceptionEvent;
  const factory SandboxEvent.triggerCustomExceptionPresentation() =
      _CustomExceptionEvent;
}
