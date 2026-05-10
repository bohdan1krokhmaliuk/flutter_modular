import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/stub_usecase.dart';

void main() {
  group('$StubUseCase', () {
    test('should do ..', () async {
      final useCase = StubUseCase();

      final result = await useCase();

      expect(result, isTrue);
    });
  });
}
