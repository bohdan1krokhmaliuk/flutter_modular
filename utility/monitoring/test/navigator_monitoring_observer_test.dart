import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/src/monitoring.dart';
import 'package:monitoring/src/navigator_monitoring_observer.dart';

class _MockMonitoring extends Mock implements Monitoring {}

class _FakeRoute extends Fake implements Route<dynamic> {
  _FakeRoute(String? name) : _settings = RouteSettings(name: name);

  final RouteSettings _settings;

  @override
  RouteSettings get settings => _settings;
}

void main() {
  late _MockMonitoring monitoring;
  late NavigatorMonitoringObserver observer;

  setUp(() {
    monitoring = _MockMonitoring();
    observer = NavigatorMonitoringObserver(monitoring);
  });

  group('didPush', () {
    test('logs push message with route names', () {
      final from = _FakeRoute('/home');
      final to = _FakeRoute('/detail');

      observer.didPush(to, from);

      verify(
        () => monitoring.debug('Push from /home to /detail', name: 'navigation'),
      ).called(1);
    });

    test('skips when both route names are null', () {
      final from = _FakeRoute(null);
      final to = _FakeRoute(null);

      observer.didPush(to, from);

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });

    test('skips when both route names are empty', () {
      final from = _FakeRoute('');
      final to = _FakeRoute('');

      observer.didPush(to, from);

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });

    test('logs when only the destination has a name', () {
      final to = _FakeRoute('/detail');

      observer.didPush(to, null);

      verify(
        () => monitoring.debug('Push from null to /detail', name: 'navigation'),
      ).called(1);
    });
  });

  group('didPop', () {
    test('logs pop message with route names', () {
      final from = _FakeRoute('/home');
      final to = _FakeRoute('/detail');

      observer.didPop(to, from);

      verify(
        () => monitoring.debug('Pop from /home to /detail', name: 'navigation'),
      ).called(1);
    });

    test('skips when both route names are null', () {
      observer.didPop(_FakeRoute(null), _FakeRoute(null));

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });
  });

  group('didReplace', () {
    test('logs replace message with route names', () {
      final oldRoute = _FakeRoute('/home');
      final newRoute = _FakeRoute('/detail');

      observer.didReplace(newRoute: newRoute, oldRoute: oldRoute);

      verify(
        () => monitoring.debug(
          'Replace from /home to /detail',
          name: 'navigation',
        ),
      ).called(1);
    });

    test('skips when both routes are null', () {
      observer.didReplace();

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });
  });

  group('didRemove', () {
    test('logs remove message with route names', () {
      final removed = _FakeRoute('/detail');
      final revealed = _FakeRoute('/home');

      observer.didRemove(removed, revealed);

      verify(
        () => monitoring.debug(
          'Remove /detail, revealed /home',
          name: 'navigation',
        ),
      ).called(1);
    });

    test('skips when both route names are null', () {
      observer.didRemove(_FakeRoute(null), _FakeRoute(null));

      verifyNever(() => monitoring.debug(any(), name: any(named: 'name')));
    });
  });
}
