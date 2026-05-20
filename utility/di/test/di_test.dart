import 'package:checks/checks.dart';
import 'package:di/src/di_container.dart';
import 'package:di/src/di_initializer.dart';
import 'package:di/src/scope/scope_di_initializer.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  group('DIInitializer', () {
    test('init passes getIt to the initializer', () {
      final getIt = GetIt.asNewInstance();
      GetIt? captured;

      DIInitializer((g, _) => captured = g).init(getIt);

      check(captured).identicalTo(getIt);
    });

    test('init passes null environment to the initializer', () {
      final getIt = GetIt.asNewInstance();
      String? capturedEnv = 'not-null';

      DIInitializer((_, env) => capturedEnv = env).init(getIt);

      check(capturedEnv).isNull();
    });
  });

  group('DIInitializer.combined', () {
    test('runs all initializers', () {
      final getIt = GetIt.asNewInstance();
      var callCount = 0;

      final combined = DIInitializer.combined([
        DIInitializer((_, _) => callCount++),
        DIInitializer((_, _) => callCount++),
        DIInitializer((_, _) => callCount++),
      ]);
      combined.init(getIt);

      check(callCount).equals(3);
    });

    test('returns null when all initializers are synchronous', () {
      final combined = DIInitializer.combined([
        DIInitializer((_, _) {}),
        DIInitializer((_, _) {}),
      ]);

      final result = combined.init(GetIt.asNewInstance());

      check(result).isNull();
    });

    test('returns Future when any initializer is async', () {
      final combined = DIInitializer.combined([
        DIInitializer((_, _) {}),
        DIInitializer((_, _) async {}),
      ]);

      final result = combined.init(GetIt.asNewInstance());

      check(result).isA<Future<void>>();
    });

    test('waits for all async initializers before completing', () async {
      var asyncDone = false;

      final combined = DIInitializer.combined([
        DIInitializer((_, _) async {
          await Future.delayed(Duration.zero);
          asyncDone = true;
        }),
      ]);

      await combined.init(GetIt.asNewInstance());

      check(asyncDone).isTrue();
    });

    test('returns null for empty list', () {
      final result = DIInitializer.combined(
        const [],
      ).init(GetIt.asNewInstance());

      check(result).isNull();
    });
  });

  group('initializeDIContainer', () {
    setUp(() async => GetIt.instance.reset());
    tearDown(() async => GetIt.instance.reset());

    test('resets existing registrations when shouldReset is true', () async {
      GetIt.instance.registerSingleton<String>('before');

      await initializeDIContainer(
        DIInitializer((g, _) => g.registerSingleton<int>(1)),
      );

      check(GetIt.instance.isRegistered<String>()).isFalse();
      check(GetIt.instance.isRegistered<int>()).isTrue();
    });

    test(
      'preserves existing registrations when shouldReset is false',
      () async {
        GetIt.instance.registerSingleton<String>('before');

        await initializeDIContainer(
          DIInitializer((g, _) => g.registerSingleton<int>(1)),
          shouldReset: false,
        );

        check(GetIt.instance.isRegistered<String>()).isTrue();
        check(GetIt.instance.isRegistered<int>()).isTrue();
      },
    );

    test('awaits async initializer before returning', () async {
      var asyncDone = false;

      await initializeDIContainer(
        DIInitializer((_, _) async {
          await Future.delayed(Duration.zero);
          asyncDone = true;
        }),
        shouldReset: false,
      );

      check(asyncDone).isTrue();
    });
  });

  group('DIContainer', () {
    setUp(() async => GetIt.instance.reset());
    tearDown(() async => GetIt.instance.reset());

    test('resolves registered type', () {
      GetIt.instance.registerSingleton<int>(99);

      check(diContainer<int>()).equals(99);
    });

    test('resolves named registration', () {
      GetIt.instance.registerSingleton<String>('a', instanceName: 'first');
      GetIt.instance.registerSingleton<String>('b', instanceName: 'second');

      check(diContainer<String>(name: 'first')).equals('a');
      check(diContainer<String>(name: 'second')).equals('b');
    });

    test('isRegistered returns true for registered type', () {
      GetIt.instance.registerSingleton<int>(1);

      check(diContainer.isRegistered<int>()).isTrue();
    });

    test('isRegistered returns false for unregistered type', () {
      check(diContainer.isRegistered<double>()).isFalse();
    });

    test('isRegistered returns true for named registration', () {
      GetIt.instance.registerSingleton<String>('x', instanceName: 'named');

      check(diContainer.isRegistered<String>(name: 'named')).isTrue();
    });
  });

  group('ScopeDiInitializer', () {
    setUp(() async => GetIt.instance.reset());
    tearDown(() async => GetIt.instance.reset());

    test('initScope registers dependencies inside the scope', () async {
      await ScopeDiInitializer.initScope(
        'testScope',
        DIInitializer((g, _) => g.registerSingleton<int>(1)),
      );

      check(GetIt.instance.isRegistered<int>()).isTrue();
    });

    test('disposeScope removes scoped registrations', () async {
      await ScopeDiInitializer.initScope(
        'testScope',
        DIInitializer((g, _) => g.registerSingleton<int>(1)),
      );

      await ScopeDiInitializer.disposeScope('testScope');

      check(GetIt.instance.isRegistered<int>()).isFalse();
    });

    test('scoped registration does not affect outer scope', () async {
      GetIt.instance.registerSingleton<String>('outer');

      await ScopeDiInitializer.initScope(
        'testScope',
        DIInitializer((g, _) => g.registerSingleton<int>(1)),
      );
      await ScopeDiInitializer.disposeScope('testScope');

      check(GetIt.instance.isRegistered<String>()).isTrue();
    });
  });
}
