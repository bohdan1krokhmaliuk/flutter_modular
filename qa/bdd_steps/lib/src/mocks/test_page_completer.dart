import 'package:mocktail/mocktail.dart';

abstract class TestPageCompleter {
  void call(Object? value);
}

class MockCompleter extends Mock implements TestPageCompleter {}

TestPageCompleter setupTestPageCompleter() {
  final mock = MockCompleter();
  when(() => mock.call(any())).thenReturn(null);
  return mock;
}
