import 'package:checks/checks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/src/monitoring.dart';
import 'package:state_management/src/bloc_monitoring_observer.dart';

class _MockMonitoring extends Mock implements Monitoring {}

class _FakeBloc extends Bloc<Object, Object?> {
  _FakeBloc() : super(null);
}

void main() {
  late _MockMonitoring monitoring;
  late BlocMonitoringObserver observer;
  late _FakeBloc bloc;

  setUp(() {
    monitoring = _MockMonitoring();
    observer = BlocMonitoringObserver(monitoring: monitoring);
    bloc = _FakeBloc();
  });

  tearDown(() async => bloc.close());

  group('onEvent', () {
    test('logs truncated event string up to opening parenthesis', () {
      observer.onEvent(bloc, 'MyEvent(data: 123)');

      verify(
        () => monitoring.debug('event: MyEvent', name: 'bloc'),
      ).called(1);
    });

    test('logs full event string when no parenthesis present', () {
      observer.onEvent(bloc, 'MyEvent');

      verify(
        () => monitoring.debug('event: MyEvent', name: 'bloc'),
      ).called(1);
    });

    test('skips logging when event is null', () {
      observer.onEvent(bloc, null);

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });
  });

  group('onChange', () {
    test('logs truncated next state string up to opening parenthesis', () {
      const change = Change(
        currentState: null,
        nextState: 'MyState(value: 1)',
      );

      observer.onChange(bloc, change);

      verify(
        () => monitoring.debug('state: MyState', name: 'bloc'),
      ).called(1);
    });

    test('logs full next state string when no parenthesis present', () {
      const change = Change(currentState: null, nextState: 'MyState');

      observer.onChange(bloc, change);

      verify(
        () => monitoring.debug('state: MyState', name: 'bloc'),
      ).called(1);
    });
  });

  group('init', () {
    late BlocObserver originalObserver;

    setUp(() => originalObserver = Bloc.observer);
    tearDown(() => Bloc.observer = originalObserver);

    test('sets Bloc.observer to itself when isDebug is true', () {
      observer.init();

      check(Bloc.observer).identicalTo(observer);
    });

    test('does not set Bloc.observer when isDebug is false', () {
      // ignore: avoid_redundant_argument_values
      observer.init(isDebug: false);

      check(Bloc.observer).identicalTo(originalObserver);
    });
  });
}
