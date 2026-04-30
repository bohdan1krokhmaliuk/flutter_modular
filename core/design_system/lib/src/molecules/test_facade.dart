import 'dart:io';

import 'package:flutter/widgets.dart';

class TestFacade extends StatelessWidget {
  const TestFacade({super.key, required this.child, this.testBuilder});

  final Widget child;
  final WidgetBuilder? testBuilder;

  @override
  Widget build(BuildContext context) {
    final isInTests = Platform.environment.containsKey('FLUTTER_TEST');
    return isInTests ? testBuilder?.call(context) ?? SizedBox.shrink() : child;
  }
}
