import 'package:flutter/material.dart';

abstract class PaltformWidget<I extends Widget, M extends Widget>
    extends StatelessWidget {
  const PaltformWidget({Key? key}) : super(key: key);

  I buildCupertinoWidget(BuildContext context);
  M buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return switch (platform) {
      TargetPlatform.iOS => buildCupertinoWidget(context),
      _ => buildMaterialWidget(context),
    };
  }
}
