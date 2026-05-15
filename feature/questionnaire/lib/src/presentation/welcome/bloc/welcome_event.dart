part of 'welcome_bloc.dart';

@blocEvent
sealed class WelcomeEvent with _$WelcomeEvent {
  const factory WelcomeEvent.proceed() = _ProceedEvent;
}
