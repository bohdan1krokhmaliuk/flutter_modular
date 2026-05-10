part of '../illustrations.dart';

class FeedbackImages {
  const FeedbackImages._();

  Illustration success({double? width, double? height}) => Illustration.asset(
    'assets/success.svg',
    package: _package,
    width: width,
    height: height,
  );

  Illustration failure({double? width, double? height}) => Illustration.asset(
    'assets/issue.svg',
    package: _package,
    width: width,
    height: height,
  );
}
