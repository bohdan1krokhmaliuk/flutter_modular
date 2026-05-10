import 'package:design_system/src/atoms/dimension.dart';
import 'package:design_system/src/atoms/radius.dart';
import 'package:design_system/src/atoms/size.dart';
import 'package:flutter/material.dart';

class PlatformCard extends StatelessWidget {
  const PlatformCard({
    super.key,
    this.title,
    this.description,
    this.borderRadius,
    this.padding,
    this.onTap,
    this.style = CardStyle.standard,
    this.trailing,
  });

  final BorderRadiusGeometry? borderRadius;
  final String? title;
  final String? description;
  final EdgeInsets? padding;
  final CardStyle style;
  final VoidCallback? onTap;
  final IconData? trailing;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      side: BorderSide(color: style.border(context)),
      borderRadius: borderRadius ?? radius.all.lg,
    );
    return Card(
      shape: shape,
      elevation: none,
      margin: dimen.all.none,
      color: style.background(context),
      child: ListTile(
        trailing: trailing != null ? Icon(trailing) : null,
        contentPadding: dimen.x.xxs,
        subtitle: description != null ? Text(description!) : null,
        title: title != null ? Text(title!) : null,
        onTap: onTap,
        shape: shape,
      ),
    );
  }
}

enum CardStyle { standard, selected, error }

extension on CardStyle {
  Color border(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      .standard => scheme.outlineVariant,
      .selected => scheme.primary,
      .error => scheme.error,
    };
  }

  Color background(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      .standard => scheme.surfaceContainer,
      .selected => scheme.primaryContainer,
      .error => scheme.errorContainer,
    };
  }
}
