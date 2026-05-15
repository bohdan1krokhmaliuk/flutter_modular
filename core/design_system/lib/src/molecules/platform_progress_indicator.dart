import 'package:design_system/src/atoms/size.dart';
import 'package:design_system/src/molecules/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProgressIndicator extends PlatformWidget {
  const PlatformProgressIndicator({super.key});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return const CupertinoActivityIndicator(radius: xs);
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return const CircularProgressIndicator(strokeCap: StrokeCap.round);
  }
}
