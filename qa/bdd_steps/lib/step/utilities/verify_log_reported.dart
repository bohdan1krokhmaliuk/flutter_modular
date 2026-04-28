import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

/// Usage: verify {'lorem'} log reported
Future<void> verifyLogReported(WidgetTester tester, String text) async {
  final monitoring = diContainer<Monitoring>();
  verify(() => monitoring.developerLog(text));
}
