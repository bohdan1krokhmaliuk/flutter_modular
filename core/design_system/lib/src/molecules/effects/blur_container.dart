import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({super.key, this.applyBlur = true, required this.child});

  final bool applyBlur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!applyBlur) {
      return child;
    }
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor.withAlpha(77),
          child: child,
        ),
      ),
    );
  }
}
