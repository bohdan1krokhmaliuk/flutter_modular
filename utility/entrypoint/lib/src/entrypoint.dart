import 'package:di/di.dart';
import 'package:entrypoint/src/scope_state.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/monitoring.dart';

part 'controller/flow_controller.dart';

enum _EntrypointType { widget, page, flow }

class Entrypoint<T> extends StatefulWidget {
  const Entrypoint.widget({
    super.key,
    required Widget this.child,
    required this.initializer,
    this.localizationsDelegate,
    this.placeholder,
  }) : _type = _EntrypointType.widget,
       onGeneratePages = null,
       backgroundColor = null,
       observers = null,
       state = null;

  const Entrypoint.page({
    super.key,
    required Widget page,
    required this.initializer,
    this.localizationsDelegate,
    this.backgroundColor,
  }) : _type = _EntrypointType.page,
       onGeneratePages = null,
       placeholder = null,
       observers = null,
       child = page,
       state = null;

  const Entrypoint.flow({
    super.key,
    required T this.state,
    required this.initializer,
    required OnGeneratePages<T> this.onGeneratePages,
    this.observers = const <NavigatorObserver>[],
    this.localizationsDelegate,
    this.backgroundColor,
  }) : _type = _EntrypointType.flow,
       placeholder = null,
       child = null;

  final Widget? child;
  final Widget? placeholder;
  final DIInitializer initializer;
  final LocalizationsDelegate<dynamic>? localizationsDelegate;
  final Color? backgroundColor;

  final T? state;
  final List<NavigatorObserver>? observers;
  final OnGeneratePages<T>? onGeneratePages;

  final _EntrypointType _type;

  @override
  State<Entrypoint<T>> createState() => _EntrypointState<T>();
}

class _EntrypointState<T> extends ScopeState<Entrypoint<T>> {
  late final FeatureFlowController<T>? controller = switch (widget._type) {
    .flow => MultipageFlowController<T>(
      diContainer<Monitoring>(),
      state: widget.state as T,
    ),
    .page => SinglePageFlowController<T>(diContainer<Monitoring>()),
    .widget => null,
  };

  @override
  DIInitializer get initializer => DIInitializer.combined([
    widget.initializer,
    if (controller case FeatureFlowController<T> controller?)
      DIInitializer(
        (getIt, _) =>
            getIt.registerSingleton<FeatureFlowController<T>>(controller),
      ),
  ]);

  @override
  void initState() {
    super.initState();

    /// Fixes the back button behaviour by rebuilding the widget in the end of the frame
    /// Doing this give time to the navigator to remove the disposed routes from the stack
    /// and the internal FeatureFlow won't add internal WillPopScope that prevents the back navigation.
    if (controller case MultipageFlowController<T> controller?) {
      controller.addListener(_refresh);
    }
  }

  @override
  void dispose() {
    if (controller case MultipageFlowController<T> controller?) {
      controller.removeListener(_refresh);
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child =
        widget.child ??
        FlowBuilder(
          onGeneratePages: widget.onGeneratePages!,
          rootRouter: diContainer<GlobalKey<NavigatorState>>(),
          controller: (controller as MultipageFlowController<T>)._controller,
          observers: [
            diContainer<NavigatorMonitoringObserver>(),
            ...?widget.observers,
          ],
        );

    final delegate = widget.localizationsDelegate;
    if (delegate != null) {
      child = Localizations.override(
        context: context,
        delegates: [delegate],
        child: child,
      );
    }

    final builder = FutureBuilder<void>(
      future: initialization,
      builder: (context, snapshot) => switch (snapshot.connectionState) {
        .done || .none => child,
        _ => widget.placeholder ?? const SizedBox.shrink(),
      },
    );

    return switch (widget._type) {
      .widget => builder,
      _ => ColoredBox(
        color:
            widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: builder,
      ),
    };
  }

  void _refresh() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
}
