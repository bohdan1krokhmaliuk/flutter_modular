import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:monitoring/src/monitoring.dart';

@injectable
class NavigatorMonitoringObserver extends NavigatorObserver {
  NavigatorMonitoringObserver(this._monitoring);

  final Monitoring _monitoring;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _recordNavigation(
        to: route,
        from: previousRoute,
        log: (from, to) => 'Push from $from to $to',
      );

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _recordNavigation(
        to: route,
        from: previousRoute,
        log: (from, to) => 'Pop from $from to $to',
      );

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _recordNavigation(
        to: newRoute,
        from: oldRoute,
        log: (from, to) => 'Replace from $from to $to',
      );

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _recordNavigation(
        from: route,
        to: previousRoute,
        log: (from, to) => 'Remove $from, revealed $to',
      );

  void _recordNavigation({
    required Route<dynamic>? from,
    required Route<dynamic>? to,
    required String Function(String? from, String? to) log,
  }) {
    final fromName = from?.settings.name;
    final toName = to?.settings.name;

    if ((fromName?.isEmpty ?? true) && (toName?.isEmpty ?? true)) {
      return;
    }

    _monitoring.debug(log(fromName, toName), name: 'navigation');
  }
}
