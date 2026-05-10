part of '../entrypoint.dart';

typedef FeatureFlowCallback<T> = T Function(T state);

abstract class FeatureFlowController<T> {
  FeatureFlowController(this._monitoring) : _isCompleted = false;

  T get state;

  final Monitoring _monitoring;
  late bool _isCompleted;

  void update(FeatureFlowCallback<T> callback);

  void complete<R extends Object?>([R? value]) {
    if (!_isCompleted) {
      _isCompleted = true;
      final nav = diContainer<GlobalKey<NavigatorState>>();
      final context = nav.currentContext;
      if (context == null) {
        _monitoring.recordNonFatal(
          Exception('FeatureFlowController.complete failed to get context'),
        );
        return;
      }
      if (Navigator.canPop(context)) {
        Navigator.pop(context, value);
      }
    } else {
      _monitoring.recordNonFatal(
        Exception('FeatureFlowController.complete failed to get context'),
      );
    }
  }
}

class MultipageFlowController<T> extends FeatureFlowController<T>
    with ChangeNotifier {
  MultipageFlowController(super._monitoring, {required T state})
    : _controller = FlowController(state) {
    _controller.addListener(notifyListeners);
  }

  final FlowController<T> _controller;

  @override
  T get state => _controller.state;

  @override
  void update(FeatureFlowCallback<T> callback) => _controller.update(callback);

  @override
  void dispose() {
    _controller.removeListener(notifyListeners);
    _controller.dispose();

    super.dispose();
  }
}

@visibleForTesting
class SinglePageFlowController<T> extends FeatureFlowController<T> {
  SinglePageFlowController(super._monitoring);

  @override
  T get state =>
      throw Exception('state is not available for a single page flow');

  @override
  void update(FeatureFlowCallback<T> callback) =>
      throw Exception('update is not supported for a single page flow');
}
