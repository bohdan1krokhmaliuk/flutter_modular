import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Monitoring',
    skip: 'Stub implementation — delegates directly to dart:developer with no '
        'injectable backend. Add tests once a real SDK (e.g. Sentry, Datadog) '
        'is injected as a constructor dependency so it can be mocked.',
    () {
      test('debug delegates message and name to the monitoring backend', () {});
      test('recordNonFatal reports exception to the monitoring backend', () {});
      test('recordNonFatal uses description when provided', () {});
      test(
        'recordNonFatal falls back to exception.toString() when no description',
        () {},
      );
      test('recordNonFatal passes stackTrace to the monitoring backend', () {});
    },
  );
}
