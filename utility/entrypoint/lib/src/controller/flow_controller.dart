part of '../entrypoint.dart';

typedef FeatureFlowCallback<T> = T Function(T state);

abstract class FeatureFlowController<T> {
  T get state;

  void update(FeatureFlowCallback<T> callback);

  void complete<R extends Object?>([R? value]);
}

class MultipageFlowController<T> extends FeatureFlowController<T>
    with ChangeNotifier {
  MultipageFlowController({required T state})
    : _isCompleted = false,
      _controller = FlowController(state) {
    _controller.addListener(notifyListeners);
  }

  final FlowController<T> _controller;

  bool _isCompleted;

  @override
  T get state => _controller.state;

  @override
  void update(FeatureFlowCallback<T> callback) => _controller.update(callback);

  @override
  void complete<R extends Object?>([R? value]) {
    if (!_isCompleted) {
      _isCompleted = true;
    } else {
      // TODO: Monitor that compelition called twice
    }
  }

  @override
  void dispose() {
    _controller.removeListener(notifyListeners);
    _controller.dispose();

    super.dispose();
  }
}

@visibleForTesting
class SinglePageFlowController<T> extends FeatureFlowController<T> {
  SinglePageFlowController() : _isCompleted = false;

  bool _isCompleted;

  @override
  T get state =>
      throw Exception('state is not available for a single page flow');

  @override
  void update(FeatureFlowCallback<T> callback) =>
      throw Exception('update is not supported for a single page flow');

  @override
  void complete<R extends Object?>([R? value]) {
    if (!_isCompleted) {
      _isCompleted = true;
      final nav = diContainer<GlobalKey<NavigatorState>>();
      final context = nav.currentContext;
      if (context == null) {
        // TODO: Monitor context not available
        return;
      }
      if (Navigator.canPop(context)) {
        Navigator.pop(context, value);
      }
    } else {
      // TODO: Monitor that compelition called twice
    }
  }
}
