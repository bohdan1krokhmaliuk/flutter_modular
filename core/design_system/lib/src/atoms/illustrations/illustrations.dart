import 'package:design_system/src/atoms/illustrations/illustration.dart';

part 'collections/feedback.dart';
part 'collections/custom.dart';

const _package = 'design_system';

abstract class Illustrations {
  static const FeedbackImages feedback = FeedbackImages._();
  static const CustomImages custom = CustomImages._();
}
