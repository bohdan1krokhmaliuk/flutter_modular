part of 'completed_bloc.dart';

@blocEvent
sealed class CompletedEvent with _$CompletedEvent {
  const factory CompletedEvent.congrats() = _CongratsEvent;
  const factory CompletedEvent.close() = _CloseEvent;
  const factory CompletedEvent.retry() = _RetryEvent;
}
