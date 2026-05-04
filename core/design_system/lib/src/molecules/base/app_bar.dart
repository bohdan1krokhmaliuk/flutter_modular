import 'package:design_system/src/atoms/size.dart';
import 'package:design_system/src/molecules/base/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlatformAppBar({
    super.key,
    this.title,
    this.isCenterTitle,
    this.leading,
    this.bottom,
  });

  final String? title;
  final bool? isCenterTitle;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: none,
      centerTitle: isCenterTitle,
      scrolledUnderElevation: micro,
      title: title != null ? Text(title!) : null,
      leading: leading ?? (_canPop(context) ? PlatformBackButton() : null),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    switch (defaultTargetPlatform) {
          TargetPlatform.iOS => kMinInteractiveDimensionCupertino,
          _ => kToolbarHeight,
        } +
        (bottom?.preferredSize.height ?? none),
  );

  bool _canPop(BuildContext context) =>
      Navigator.canPop(context) ||
      Navigator.of(context, rootNavigator: true).canPop();
}
