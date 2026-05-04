import 'package:design_system/src/molecules/platform_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final loader = Center(child: PlatformProgressIndicator());
    if (backgroundColor != null) {
      ColoredBox(color: backgroundColor!, child: loader);
    }

    return loader;
  }
}
