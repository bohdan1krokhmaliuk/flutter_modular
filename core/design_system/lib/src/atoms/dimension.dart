import 'package:design_system/src/atoms/size.dart' as s;
import 'package:flutter/material.dart';

const dimen = _Dimension.standard;

enum _Dimension {
  standard(
    left: _DimensionSide.left,
    top: _DimensionSide.top,
    right: _DimensionSide.right,
    bottom: _DimensionSide.bottom,
    x: _DimensionSide.x,
    y: _DimensionSide.y,
    all: _DimensionSide.all,
  );

  const _Dimension({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.x,
    required this.y,
    required this.all,
  });

  final _DimensionSide left;
  final _DimensionSide top;
  final _DimensionSide right;
  final _DimensionSide bottom;
  final _DimensionSide x;
  final _DimensionSide y;
  final _DimensionSide all;
}

@immutable
enum _DimensionSide {
  all(
    none: EdgeInsets.zero,
    nano: EdgeInsets.all(s.nano),
    micro: EdgeInsets.all(s.micro),
    xxs: EdgeInsets.all(s.xxs),
    xs: EdgeInsets.all(s.xs),
    sm: EdgeInsets.all(s.sm),
    md: EdgeInsets.all(s.md),
    lg: EdgeInsets.all(s.lg),
    xl: EdgeInsets.all(s.xl),
    xxl: EdgeInsets.all(s.xxl),
    xxxl: EdgeInsets.all(s.xxxl),
  ),
  left(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(left: s.nano),
    micro: EdgeInsets.only(left: s.micro),
    xxs: EdgeInsets.only(left: s.xxs),
    xs: EdgeInsets.only(left: s.xs),
    sm: EdgeInsets.only(left: s.sm),
    md: EdgeInsets.only(left: s.md),
    lg: EdgeInsets.only(left: s.lg),
    xl: EdgeInsets.only(left: s.xl),
    xxl: EdgeInsets.only(left: s.xxl),
    xxxl: EdgeInsets.only(left: s.xxxl),
  ),
  top(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(top: s.nano),
    micro: EdgeInsets.only(top: s.micro),
    xxs: EdgeInsets.only(top: s.xxs),
    xs: EdgeInsets.only(top: s.xs),
    sm: EdgeInsets.only(top: s.sm),
    md: EdgeInsets.only(top: s.md),
    lg: EdgeInsets.only(top: s.lg),
    xl: EdgeInsets.only(top: s.xl),
    xxl: EdgeInsets.only(top: s.xxl),
    xxxl: EdgeInsets.only(top: s.xxxl),
  ),
  right(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(right: s.nano),
    micro: EdgeInsets.only(right: s.micro),
    xxs: EdgeInsets.only(right: s.xxs),
    xs: EdgeInsets.only(right: s.xs),
    sm: EdgeInsets.only(right: s.sm),
    md: EdgeInsets.only(right: s.md),
    lg: EdgeInsets.only(right: s.lg),
    xl: EdgeInsets.only(right: s.xl),
    xxl: EdgeInsets.only(right: s.xxl),
    xxxl: EdgeInsets.only(right: s.xxxl),
  ),
  bottom(
    none: EdgeInsets.zero,
    nano: EdgeInsets.only(bottom: s.nano),
    micro: EdgeInsets.only(bottom: s.micro),
    xxs: EdgeInsets.only(bottom: s.xxs),
    xs: EdgeInsets.only(bottom: s.xs),
    sm: EdgeInsets.only(bottom: s.sm),
    md: EdgeInsets.only(bottom: s.md),
    lg: EdgeInsets.only(bottom: s.lg),
    xl: EdgeInsets.only(bottom: s.xl),
    xxl: EdgeInsets.only(bottom: s.xxl),
    xxxl: EdgeInsets.only(bottom: s.xxxl),
  ),
  x(
    none: EdgeInsets.zero,
    nano: EdgeInsets.symmetric(horizontal: s.nano),
    micro: EdgeInsets.symmetric(horizontal: s.micro),
    xxs: EdgeInsets.symmetric(horizontal: s.xxs),
    xs: EdgeInsets.symmetric(horizontal: s.xs),
    sm: EdgeInsets.symmetric(horizontal: s.sm),
    md: EdgeInsets.symmetric(horizontal: s.md),
    lg: EdgeInsets.symmetric(horizontal: s.lg),
    xl: EdgeInsets.symmetric(horizontal: s.xl),
    xxl: EdgeInsets.symmetric(horizontal: s.xxl),
    xxxl: EdgeInsets.symmetric(horizontal: s.xxxl),
  ),
  y(
    none: EdgeInsets.zero,
    nano: EdgeInsets.symmetric(vertical: s.nano),
    micro: EdgeInsets.symmetric(vertical: s.micro),
    xxs: EdgeInsets.symmetric(vertical: s.xxs),
    xs: EdgeInsets.symmetric(vertical: s.xs),
    sm: EdgeInsets.symmetric(vertical: s.sm),
    md: EdgeInsets.symmetric(vertical: s.md),
    lg: EdgeInsets.symmetric(vertical: s.lg),
    xl: EdgeInsets.symmetric(vertical: s.xl),
    xxl: EdgeInsets.symmetric(vertical: s.xxl),
    xxxl: EdgeInsets.symmetric(vertical: s.xxxl),
  );

  const _DimensionSide({
    required this.none,
    required this.nano,
    required this.micro,
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.xxxl,
  });

  final EdgeInsets none;
  final EdgeInsets nano;
  final EdgeInsets micro;
  final EdgeInsets xxs;
  final EdgeInsets xs;
  final EdgeInsets sm;
  final EdgeInsets md;
  final EdgeInsets lg;
  final EdgeInsets xl;
  final EdgeInsets xxl;
  final EdgeInsets xxxl;
}
