import 'package:design_system/src/atoms/illustrations/illustration/illustration.dart';

part 'feedback.dart';
part 'custom.dart';

const _package = 'design_system';

abstract class Illustrations {
  static const _FeedbackImages feedback = _FeedbackImages();
  static const _CustomImages custom = _CustomImages();
}
