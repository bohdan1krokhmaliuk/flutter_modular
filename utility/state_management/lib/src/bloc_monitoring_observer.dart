import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:monitoring/monitoring.dart';

const _name = 'bloc';

@singleton
class BlocMonitoringObserver extends BlocObserver {
  const BlocMonitoringObserver({required Monitoring monitoring})
    : _monitoring = monitoring;

  final Monitoring _monitoring;

  @postConstruct
  void init() {
    if (kDebugMode) {
      Bloc.observer = this;
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);

    final e = event?.toString();
    if (e != null) {
      _monitoring.debug('event: ${_truncate(e)}', name: _name);
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final state = change.nextState.toString();
    _monitoring.debug('state: ${_truncate(state)}', name: _name);
  }

  String _truncate(String message) {
    final bracket = message.indexOf('(');

    return bracket == -1 ? message : message.substring(0, bracket);
  }
}
