import 'package:design_system/src/atoms/dimension.dart';
import 'package:flutter/material.dart';

class Toast {
  const Toast._(this.context);

  const factory Toast.of(BuildContext context) = Toast._;

  final BuildContext context;

  void hide() {
    ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
  }

  void show(
    String message, {
    bool hideCurrent = true,
    Duration duration = const Duration(seconds: 2),
  }) {
    final messanger = ScaffoldMessenger.maybeOf(context);
    if (messanger == null) {
      return;
    }

    if (hideCurrent) {
      messanger.hideCurrentSnackBar();
    }

    messanger.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(message),
        padding: dimen.x.xs + dimen.y.xxs,
      ),
    );
  }
}
