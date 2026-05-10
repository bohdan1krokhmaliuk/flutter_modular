part of 'test_app_initializer.dart';

/// Registers all "app wide" used injections which have redefined mocks for tests
class _MocksInitializer extends DIInitializer {
  _MocksInitializer()
    : super(
        (getIt, _) => getIt
          ..registerSingleton<TestPageCompleter>(setupTestPageCompleter())
          ..registerSingleton<Monitoring>(setupMonitoring())
          ..registerSingleton<Preferences>(setupPreferences())
          ..registerSingleton<ScenarioRepository>(setupScenarioRepository())
          ..registerSingleton<NavigatorMonitoringObserver>(
            setupNavigatorMonitoringObserver(),
          )
          ..registerLazySingleton<GlobalKey<NavigatorState>>(
            GlobalKey<NavigatorState>.new,
          ),
      );
}
