import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

String? getImageAsset(Widget widget, {bool skipIllustration = false}) =>
    switch (widget) {
      Illustration(:final asset) when !skipIllustration => asset,
      SvgPicture(bytesLoader: SvgNetworkLoader(:final url)) => url,
      SvgPicture(bytesLoader: SvgAssetLoader(assetName: final asset)) => asset,
      AssetImage(assetName: final asset) => asset,
      NetworkImage(:final url) => url,
      _ => null,
    };
