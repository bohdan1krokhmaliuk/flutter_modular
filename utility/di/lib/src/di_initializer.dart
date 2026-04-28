import 'dart:async';
import 'package:get_it/get_it.dart';

typedef GetItInitializer =
    FutureOr<void> Function(GetIt getIt, String? environment);

class DIInitializer {
  const DIInitializer(this._initializer);
  factory DIInitializer.combined(List<DIInitializer> initializers) =>
      DIInitializer((getIt, _) {
        List<Future<void>>? futures;

        for (int i = 0; i < initializers.length; i++) {
          final res = initializers[i].init(getIt);

          if (res is Future) {
            (futures ??= []).add(res);
          }
        }

        return futures == null ? null : Future.wait(futures);
      });

  final GetItInitializer _initializer;

  FutureOr<void> init(GetIt getIt) => _initializer(getIt, null);
}
