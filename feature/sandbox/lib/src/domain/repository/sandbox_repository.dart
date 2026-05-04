import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:prelude/prelude.dart';
import 'package:sandbox/src/domain/api/sandbox_api.dart';
import 'package:sandbox/src/domain/model/sandbox_exception.dart';

@injectable
class SandboxRepository {
  const SandboxRepository(this._api);

  final SandboxApi _api;

  Future<Result<void, FailureException>> callInvalidUri() {
    return Result.fromAsync(() => _api.callInvalidUri());
  }

  Future<Result<void, FailureException>> callCustomException() async {
    final result = await Result.fromAsync(() => _api.callNoTokenApi());
    return result.mapFailure(
      (f) => f.isNotFoundException ? SandboxException() : f,
    );
  }
}
