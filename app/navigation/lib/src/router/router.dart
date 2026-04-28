import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:monitoring/monitoring.dart';
import 'package:navigation/src/route/routes.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'EntrypointWrapper,Route')
@lazySingleton
class MiniclientRouter extends RootStackRouter {
  MiniclientRouter(GlobalKey<NavigatorState> _navigatorKey)
    : _routes = featureRoutes,
      _guards = [
        // [HINT] Inject here any redirection guards, like auth guard etc
      ],
      super(navigatorKey: _navigatorKey);

  final List<AutoRoute> _routes;
  final List<AutoRouteGuard> _guards;

  Completer<void>? _navigationCompleter;

  @override
  List<AutoRoute> get routes => _routes;

  @override
  List<AutoRouteGuard> get guards => _guards;

  @override
  Future<T?> push<T extends Object?>(
    PageRouteInfo<Object?> route, {
    OnNavigationFailure? onFailure,
  }) async {
    await _delayNavigationAndSetupForNext();
    return super.push(route, onFailure: onFailure);
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) async {
    await _delayNavigationAndSetupForNext();
    return super.maybePop(result);
  }

  @override
  Future<void> replaceAll(
    List<PageRouteInfo<Object?>> routes, {
    OnNavigationFailure? onFailure,
    bool updateExistingRoutes = true,
  }) async {
    await _delayNavigationAndSetupForNext();
    return super.replaceAll(
      routes,
      onFailure: onFailure,
      updateExistingRoutes: updateExistingRoutes,
    );
  }

  RouterConfig<UrlState> appConfig({
    WidgetBuilder? placeholder,
    NavigatorObserversBuilder navigatorObservers =
        AutoRouterDelegate.defaultNavigatorObserversBuilder,
  }) => super.config(
    placeholder: placeholder,
    navigatorObservers: () => [
      ...navigatorObservers(),
      diContainer<NavigatorMonitoringObserver>(),
    ],
  );

  @override
  void popUntilRoot() async {
    await _delayNavigationAndSetupForNext();
    super.popUntilRoot();
  }

  Future<void> _delayNavigationAndSetupForNext() async {
    await _delayNavigationEvent();
    await _delayUpcomingNavigationEvent();
  }

  Future<void> _delayUpcomingNavigationEvent() async {
    _navigationCompleter = Completer();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!(_navigationCompleter?.isCompleted ?? true)) {
        _navigationCompleter?.complete();
      }
    });
  }

  Future<void> _delayNavigationEvent() async {
    if (!(_navigationCompleter?.isCompleted ?? true)) {
      await _navigationCompleter?.future;
    }
  }
}
