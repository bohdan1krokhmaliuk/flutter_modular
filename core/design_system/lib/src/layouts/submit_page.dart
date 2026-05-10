import 'package:design_system/src/atoms/dimension.dart';
import 'package:design_system/src/molecules/effects/blur_container.dart';
import 'package:flutter/material.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key, required this.child, this.bottom});

  final Widget child;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      backgroundColor: Colors.transparent,
      body: child,
      extendBody: bottom != null,
      bottomNavigationBar: bottom != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlurContainer(
                  child: SafeArea(
                    top: false,
                    minimum: dimen.all.xs,
                    child: bottom!,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
