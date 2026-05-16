import 'package:checks/checks.dart';
import 'package:di/di.dart';
import 'package:entrypoint/src/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class _MockMonitoring extends Mock implements Monitoring {}

void main() {
  setUpAll(() => registerFallbackValue(Exception()));

  group('SinglePageFlowController', () {
    late _MockMonitoring monitoring;
    late SinglePageFlowController<int> controller;

    setUp(() {
      monitoring = _MockMonitoring();
      controller = SinglePageFlowController<int>(monitoring);
    });

    test('state throws', () {
      check(() => controller.state).throws<Exception>();
    });

    test('update throws', () {
      check(() => controller.update((s) => s)).throws<Exception>();
    });
  });

  group('MultipageFlowController', () {
    late _MockMonitoring monitoring;

    setUp(() => monitoring = _MockMonitoring());

    test('state returns initial value', () {
      final controller = MultipageFlowController<int>(monitoring, state: 42);

      check(controller.state).equals(42);

      controller.dispose();
    });

    test('update changes state', () {
      final controller = MultipageFlowController<int>(monitoring, state: 0);

      controller.update((s) => s + 5);

      check(controller.state).equals(5);
      controller.dispose();
    });

    test('update notifies listeners', () {
      final controller = MultipageFlowController<int>(monitoring, state: 0);
      var calls = 0;
      controller.addListener(() => calls++);

      controller.update((s) => s + 1);

      check(calls).equals(1);
      controller.dispose();
    });

    test('dispose removes inner listener without error', () {
      final controller = MultipageFlowController<int>(monitoring, state: 0);
      var calls = 0;
      controller.addListener(() => calls++);

      controller.dispose();

      check(calls).equals(0);
    });

    group('complete', () {
      late GlobalKey<NavigatorState> navKey;

      setUp(() async {
        navKey = GlobalKey<NavigatorState>();
        await initializeDIContainer(
          DIInitializer(
            (getIt, _) =>
                getIt.registerSingleton<GlobalKey<NavigatorState>>(navKey),
          ),
        );
      });

      tearDown(() async => initializeDIContainer(DIInitializer((_, _) {})));

      test('records non-fatal when context is null', () {
        final controller = MultipageFlowController<int>(monitoring, state: 0);

        controller.complete();

        verify(() => monitoring.recordNonFatal(any())).called(1);
        controller.dispose();
      });

      test('records non-fatal when called after completion', () {
        final controller = MultipageFlowController<int>(monitoring, state: 0);
        controller.complete();
        clearInteractions(monitoring);

        controller.complete();

        verify(() => monitoring.recordNonFatal(any())).called(1);
        controller.dispose();
      });

      testWidgets('pops navigator when canPop is true', (tester) async {
        const childKey = Key('__child__');
        await tester.pumpWidget(
          MaterialApp(
            navigatorKey: navKey,
            home: Builder(
              builder: (context) => TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const Scaffold(key: childKey),
                  ),
                ),
                child: const Text('push'),
              ),
            ),
          ),
        );
        await tester.tap(find.text('push'));
        await tester.pumpAndSettle();

        final controller = MultipageFlowController<int>(monitoring, state: 0);
        controller.complete();
        await tester.pumpAndSettle();

        expect(find.byKey(childKey), findsNothing);
        controller.dispose();
      });

      testWidgets('does not pop when canPop is false', (tester) async {
        await tester.pumpWidget(
          MaterialApp(navigatorKey: navKey, home: const Scaffold()),
        );
        final controller = MultipageFlowController<int>(monitoring, state: 0);

        controller.complete();
        await tester.pumpAndSettle();

        verifyNever(() => monitoring.recordNonFatal(any()));
        controller.dispose();
      });
    });
  });
}
