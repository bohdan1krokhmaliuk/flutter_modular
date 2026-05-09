import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

sealed class Illustration extends StatelessWidget {
  const Illustration({super.key});

  const factory Illustration.asset(
    String asset, {
    Key? key,
    Color? color,
    double? width,
    double? height,
    String? package,
    Widget? placeholder,
  }) = _AssetIllustration;

  factory Illustration.network(
    String url, {
    Key? key,
    Color? color,
    double? width,
    Widget? error,
    double? height,
    Widget? placeholder,
    BoxFit fit = BoxFit.contain,
  }) => _NetworkIllustration(
    url,
    key: key,
    fit: fit,
    color: color,
    width: width,
    error: error,
    height: height,
    placeholder: placeholder,
  );

  String get asset;
}

class _AssetIllustration extends Illustration {
  const _AssetIllustration(
    this.asset, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.package,
    this.placeholder,
  });

  @override
  final String asset;
  final Color? color;
  final double? width;
  final double? height;
  final String? package;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      package: package,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
    );
  }
}

class _NetworkIllustration extends Illustration {
  const _NetworkIllustration(
    this.url, {
    super.key,
    this.width,
    this.color,
    this.error,
    this.height,
    this.placeholder,
    this.fit = BoxFit.contain,
  });

  final String url;
  final BoxFit fit;
  final Color? color;
  final double? width;
  final Widget? error;
  final double? height;
  final Widget? placeholder;

  @override
  String get asset => url;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      fit: fit,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: placeholder != null ? (_) => placeholder! : null,
      errorBuilder: (_, _, _) => error ?? SizedBox.shrink(),
    );
  }
}
