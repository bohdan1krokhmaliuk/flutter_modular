part of 'wellcome_bloc.dart';

@blocEvent
sealed class WellcomeEvent with _$WellcomeEvent {
  const factory WellcomeEvent.proceed() = _ProceedEvent;
}
