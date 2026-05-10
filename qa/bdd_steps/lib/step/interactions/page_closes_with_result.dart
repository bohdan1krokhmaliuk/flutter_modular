import 'package:bdd_steps/src/mocks/test_page_completer.dart';
import 'package:di/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Example: Then page closes with {value} result
Future<void> pageClosesWithResult(WidgetTester tester, Object? result) async {
  final completer = diContainer<TestPageCompleter>();
  verify(() => completer(result));
}
