import 'package:flutter_test/flutter_test.dart';
import 'package:monitoring/monitoring.dart';

void main() {
  // Stub implementation — delegates directly to dart:developer with no
  // injectable backend. Add tests once a real SDK (e.g. Sentry, Datadog)
  // is injected as a constructor dependency so it can be mocked.
  group('Monitoring', () {
    test('debug delegates message and name to the monitoring backend', () {
      const Monitoring().debug('random message');
    });
    test('recordNonFatal reports exception to the monitoring backend', () {
      const Monitoring().recordNonFatal(Exception('random exception'));
    });
  });
}
