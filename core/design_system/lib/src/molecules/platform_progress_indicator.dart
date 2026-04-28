import 'package:design_system/src/atoms/size.dart';
import 'package:design_system/src/molecules/paltform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProgressIndicator extends PaltformWidget {
  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoActivityIndicator(radius: xs);
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return CircularProgressIndicator(strokeCap: StrokeCap.round);
  }
}
