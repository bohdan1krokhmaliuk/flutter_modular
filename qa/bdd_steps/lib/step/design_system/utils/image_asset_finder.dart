import 'package:bdd_steps/step/design_system/utils/get_image_asset.dart';
import 'package:flutter_test/flutter_test.dart';

Finder imageAssetFinder(String assetName) => find.byWidgetPredicate(
  // Skips illustration as [Illustration] uses [SvgPicture] underneath
  // And we don't want duplicated findings
  (w) => getImageAsset(w, skipIllustration: true) == assetName,
);
