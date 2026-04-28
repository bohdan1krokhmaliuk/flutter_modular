import 'package:di/di.dart';
import 'package:flutter/widgets.dart';

abstract class ScopeState<T extends StatefulWidget> extends State<T> {
  late final Future<void>? initialization;

  String get _scopeName => hashCode.toString();

  DIInitializer get initializer;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    initialization = ScopeDiInitializer.initScope(_scopeName, initializer);
  }

  @override
  @mustCallSuper
  void dispose() {
    ScopeDiInitializer.disposeScope(_scopeName);
    super.dispose();
  }
}
