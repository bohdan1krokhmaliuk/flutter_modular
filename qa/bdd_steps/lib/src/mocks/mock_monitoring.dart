import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class MockMonitoring extends Mock implements Monitoring {}

Monitoring setupMonitoring() {
  final mock = MockMonitoring();
  when(() => mock.debug(any())).thenReturn(null);
  return mock;
}
