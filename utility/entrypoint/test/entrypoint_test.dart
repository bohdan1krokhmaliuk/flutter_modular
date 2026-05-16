import 'dart:async';

import 'package:checks/checks.dart';
import 'package:di/di.dart';
import 'package:entrypoint/src/entrypoint.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class _MockMonitoring extends Mock implements Monitoring {}

class _MockNavigatorMonitoringObserver extends Mock
    implements NavigatorMonitoringObserver {}

void main() {
  group('Entrypoint.widget', () {
    testWidgets('renders child after sync init completes', (tester) async {
      await _setUpDI(tester);
      const childKey = Key('__child__');

      await tester.pumpWidget(
        MaterialApp(
          home: Entrypoint<void>.widget(
            initializer: DIInitializer((_, _) {}),
            child: const SizedBox(key: childKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(childKey), findsOneWidget);
    });

    testWidgets('shows placeholder while async init is in progress', (
      tester,
    ) async {
      await _setUpDI(tester);
      final completer = Completer<void>();
      const childKey = Key('__child__');
      const placeholderKey = Key('__placeholder__');

      await tester.pumpWidget(
        MaterialApp(
          home: Entrypoint<void>.widget(
            initializer: DIInitializer((_, _) => completer.future),
            placeholder: const SizedBox(key: placeholderKey),
            child: const SizedBox(key: childKey),
          ),
        ),
      );

      expect(find.byKey(placeholderKey), findsOneWidget);
      expect(find.byKey(childKey), findsNothing);

      completer.complete();
      await tester.pumpAndSettle();

      expect(find.byKey(placeholderKey), findsNothing);
      expect(find.byKey(childKey), findsOneWidget);
    });

    testWidgets(
      'shows SizedBox.shrink when no placeholder during async init',
      (tester) async {
        await _setUpDI(tester);
        final completer = Completer<void>();
        const childKey = Key('__child__');

        await tester.pumpWidget(
          MaterialApp(
            home: Entrypoint<void>.widget(
              initializer: DIInitializer((_, _) => completer.future),
              child: const SizedBox(key: childKey),
            ),
          ),
        );

        expect(find.byKey(childKey), findsNothing);

        completer.complete();
        await tester.pumpAndSettle();

        expect(find.byKey(childKey), findsOneWidget);
      },
    );

    testWidgets('does not wrap child in ColoredBox', (tester) async {
      await _setUpDI(tester);
      const childKey = Key('__child__');
      const entrypointKey = Key('__entrypoint__');

      await tester.pumpWidget(
        MaterialApp(
          home: Entrypoint<void>.widget(
            key: entrypointKey,
            initializer: DIInitializer((_, _) {}),
            child: const SizedBox(key: childKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byKey(entrypointKey),
          matching: find.byType(ColoredBox),
        ),
        findsNothing,
      );
    });
  });

  group('Entrypoint.page', () {
    testWidgets('wraps page in ColoredBox with theme background by default', (
      tester,
    ) async {
      await _setUpDI(tester);
      const pageKey = Key('__page__');
      const entrypointKey = Key('__entrypoint__');

      await tester.pumpWidget(
        MaterialApp(
          home: Entrypoint<void>.page(
            key: entrypointKey,
            initializer: DIInitializer((_, _) {}),
            page: const Scaffold(key: pageKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(pageKey), findsOneWidget);
      expect(
        find.descendant(
          of: find.byKey(entrypointKey),
          matching: find.byType(ColoredBox),
        ),
        findsOneWidget,
      );
    });

    testWidgets('wraps page in ColoredBox with custom backgroundColor', (
      tester,
    ) async {
      await _setUpDI(tester);
      const pageKey = Key('__page__');
      const entrypointKey = Key('__entrypoint__');
      const background = Color(0xFFABCDEF);

      await tester.pumpWidget(
        MaterialApp(
          home: Entrypoint<void>.page(
            key: entrypointKey,
            initializer: DIInitializer((_, _) {}),
            backgroundColor: background,
            page: const SizedBox(key: pageKey),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final coloredBox = tester.widget<ColoredBox>(
        find.descendant(
          of: find.byKey(entrypointKey),
          matching: find.byType(ColoredBox),
        ),
      );
      check(coloredBox.color).equals(background);
    });
  });

  group('Entrypoint.flow', () {
    Future<({GlobalKey<NavigatorState> navKey})> setUpFlow(
      WidgetTester tester,
    ) async {
      final navKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(const SizedBox());
      await initializeDIContainer(
        DIInitializer((getIt, _) {
          getIt.registerSingleton<Monitoring>(_MockMonitoring());
          getIt.registerSingleton<GlobalKey<NavigatorState>>(navKey);
          getIt.registerSingleton<NavigatorMonitoringObserver>(
            _MockNavigatorMonitoringObserver(),
          );
        }),
      );
      return (navKey: navKey,);
    }

    testWidgets('renders initial flow page', (tester) async {
      final (:navKey) = await setUpFlow(tester);
      const pageKey = Key('__page__');

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navKey,
          home: Entrypoint<int>.flow(
            state: 0,
            initializer: DIInitializer((_, _) {}),
            onGeneratePages: (state, pages) => [
              const MaterialPage<void>(child: Scaffold(key: pageKey)),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(pageKey), findsOneWidget);
    });

    testWidgets(
      'state change via flow controller triggers rebuild and covers _refresh',
      (tester) async {
        final (:navKey) = await setUpFlow(tester);
        const page1Key = Key('__page1__');
        const page2Key = Key('__page2__');
        const buttonKey = Key('__button__');

        await tester.pumpWidget(
          MaterialApp(
            navigatorKey: navKey,
            home: Entrypoint<int>.flow(
              state: 0,
              initializer: DIInitializer((_, _) {}),
              onGeneratePages: (state, pages) => [
                MaterialPage<void>(
                  child: Builder(
                    builder: (context) => Scaffold(
                      key: page1Key,
                      body: TextButton(
                        key: buttonKey,
                        onPressed: () =>
                            context.flow<int>().update((s) => s + 1),
                        child: const Text('next'),
                      ),
                    ),
                  ),
                ),
                if (state == 1)
                  const MaterialPage<void>(child: Scaffold(key: page2Key)),
              ],
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byKey(page1Key), findsOneWidget);
        expect(find.byKey(page2Key), findsNothing);

        await tester.tap(find.byKey(buttonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(page2Key), findsOneWidget);
      },
    );

    testWidgets('applies localizationsDelegate', (tester) async {
      final (:navKey) = await setUpFlow(tester);
      const pageKey = Key('__page__');
      final delegate = _TestLocalizationsDelegate();

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navKey,
          home: Entrypoint<int>.flow(
            state: 0,
            initializer: DIInitializer((_, _) {}),
            localizationsDelegate: delegate,
            onGeneratePages: (state, pages) => [
              const MaterialPage<void>(child: Scaffold(key: pageKey)),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(pageKey), findsOneWidget);
      // Localizations.override adds an extra Localizations widget on top
      // of the one MaterialApp already provides.
      check(
        tester.widgetList(find.byType(Localizations)).length,
      ).isGreaterOrEqual(2);
    });
  });
}

/// Disposes any Entrypoint left from a previous test BEFORE resetting GetIt.
///
/// Without this, [ScopeState.dispose] → [ScopeDiInitializer.disposeScope]
/// would fail with "already on base scope" because [initializeDIContainer]
/// resets GetIt (removing the scope) before the next [pumpWidget] call can
/// trigger the old widget's disposal.
///
/// Registers a [Monitoring] mock in the base container so that [Entrypoint.page]
/// and [Entrypoint.flow] constructors can resolve it when creating their
/// [FeatureFlowController] during [State.initState].
Future<void> _setUpDI(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  await initializeDIContainer(
    DIInitializer(
      (getIt, _) => getIt.registerSingleton<Monitoring>(_MockMonitoring()),
    ),
  );
}

class _TestLocalizationsDelegate extends LocalizationsDelegate<Object> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<Object> load(Locale locale) async => Object();

  @override
  bool shouldReload(covariant LocalizationsDelegate<Object> old) => false;
}
