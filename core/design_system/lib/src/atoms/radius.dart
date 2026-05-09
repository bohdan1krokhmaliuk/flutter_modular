import 'package:flutter/material.dart';

const _xs = 4.0;
const _sm = 8.0;
const _md = 16.0;
const _lg = 16.0;
const _xl = 20.0;
const _xxl = 40.0;
const _round = 999.0;

const radius = _Radius.standard;

@immutable
enum _Radius {
  standard(
    all: _RadiusSide.all,
    top: _RadiusSide.top,
    bottom: _RadiusSide.bottom,
    left: _RadiusSide.left,
    right: _RadiusSide.right,
  );

  const _Radius({
    required this.all,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  final _RadiusSide all;
  final _RadiusSide top;
  final _RadiusSide bottom;
  final _RadiusSide left;
  final _RadiusSide right;
}

@immutable
enum _RadiusSide {
  all(
    none: BorderRadius.zero,
    xs: BorderRadius.all(Radius.circular(_xs)),
    sm: BorderRadius.all(Radius.circular(_sm)),
    md: BorderRadius.all(Radius.circular(_md)),
    lg: BorderRadius.all(Radius.circular(_lg)),
    xl: BorderRadius.all(Radius.circular(_xl)),
    xxl: BorderRadius.all(Radius.circular(_xxl)),
    round: BorderRadius.all(Radius.circular(_round)),
  ),
  top(
    none: BorderRadius.zero,
    xs: BorderRadius.vertical(top: Radius.circular(_xs)),
    sm: BorderRadius.vertical(top: Radius.circular(_sm)),
    md: BorderRadius.vertical(top: Radius.circular(_md)),
    lg: BorderRadius.vertical(top: Radius.circular(_lg)),
    xl: BorderRadius.vertical(top: Radius.circular(_xl)),
    xxl: BorderRadius.vertical(top: Radius.circular(_xxl)),
    round: BorderRadius.vertical(top: Radius.circular(_round)),
  ),
  bottom(
    none: BorderRadius.zero,
    xs: BorderRadius.vertical(bottom: Radius.circular(_xs)),
    sm: BorderRadius.vertical(bottom: Radius.circular(_sm)),
    md: BorderRadius.vertical(bottom: Radius.circular(_md)),
    lg: BorderRadius.vertical(bottom: Radius.circular(_lg)),
    xl: BorderRadius.vertical(bottom: Radius.circular(_xl)),
    xxl: BorderRadius.vertical(bottom: Radius.circular(_xxl)),
    round: BorderRadius.vertical(bottom: Radius.circular(_round)),
  ),
  left(
    none: BorderRadius.zero,
    xs: BorderRadius.horizontal(left: Radius.circular(_xs)),
    sm: BorderRadius.horizontal(left: Radius.circular(_sm)),
    md: BorderRadius.horizontal(left: Radius.circular(_md)),
    lg: BorderRadius.horizontal(left: Radius.circular(_lg)),
    xl: BorderRadius.horizontal(left: Radius.circular(_xl)),
    xxl: BorderRadius.horizontal(left: Radius.circular(_xxl)),
    round: BorderRadius.horizontal(left: Radius.circular(_round)),
  ),
  right(
    none: BorderRadius.zero,
    xs: BorderRadius.horizontal(right: Radius.circular(_xs)),
    sm: BorderRadius.horizontal(right: Radius.circular(_sm)),
    md: BorderRadius.horizontal(right: Radius.circular(_md)),
    lg: BorderRadius.horizontal(right: Radius.circular(_lg)),
    xl: BorderRadius.horizontal(right: Radius.circular(_xl)),
    xxl: BorderRadius.horizontal(right: Radius.circular(_xxl)),
    round: BorderRadius.horizontal(right: Radius.circular(_round)),
  );

  const _RadiusSide({
    required this.none,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
    required this.round,
  });

  final BorderRadius none;
  final BorderRadius xs;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius xxl;
  final BorderRadius round;
}
