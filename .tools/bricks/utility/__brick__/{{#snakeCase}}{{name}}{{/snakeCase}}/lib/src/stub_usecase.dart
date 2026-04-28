import 'package:injectable/injectable.dart';

class StubUseCase {
  Future<bool> call() => Future.value(true);
}
