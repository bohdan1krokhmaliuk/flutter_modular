import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class MockMonitoring extends Mock implements Monitoring {}

Monitoring setupMonitoring() {
  final mock = MockMonitoring();
  when(() => mock.developerLog(any())).thenReturn(null);
  return mock;
}
