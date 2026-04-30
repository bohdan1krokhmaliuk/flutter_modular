import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monitoring/monitoring.dart';

class MockNavigatorMonitoringObserver extends Mock
    implements NavigatorMonitoringObserver {}

NavigatorMonitoringObserver setupNavigatorMonitoringObserver() {
  registerFallbackValue(MaterialPageRoute(builder: (_) => const SizedBox()));

  final mock = MockNavigatorMonitoringObserver();
  when(() => mock.didPush(any(), any())).thenReturn(null);
  when(() => mock.didPop(any(), any())).thenReturn(null);
  when(() => mock.didRemove(any(), any())).thenReturn(null);
  when(
    () => mock.didReplace(
      newRoute: any(named: 'newRoute'),
      oldRoute: any(named: 'oldRoute'),
    ),
  ).thenReturn(null);
  return mock;
}
