import 'package:flutter/material.dart';

class PlatformBackButton extends StatelessWidget {
  const PlatformBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return BackButton(onPressed: onPressed ?? () => _pop(context));
  }

  Future<void> _pop(BuildContext context) async {
    NavigatorState? navigator = Navigator.of(context);
    while (navigator != null) {
      if (navigator.canPop() && await navigator.maybePop()) {
        return;
      }
      navigator = navigator.context.findAncestorStateOfType<NavigatorState>();
    }
  }
}
