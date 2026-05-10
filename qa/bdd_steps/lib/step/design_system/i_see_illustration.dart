import 'package:bdd_steps/step/design_system/utils/get_image_asset.dart';
import 'package:bdd_steps/step/design_system/utils/image_asset_finder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {Illustrations.custom.questionnaire} illustration
Future<void> iSeeIllustration(WidgetTester tester, Widget illustration) async {
  final asset = getImageAsset(illustration);
  expect(imageAssetFinder(asset!), findsOneWidget);
}
