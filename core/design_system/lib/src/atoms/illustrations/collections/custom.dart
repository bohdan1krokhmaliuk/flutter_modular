part of '../illustrations.dart';

class CustomImages {
  const CustomImages._();

  Illustration questionnaire({double? width, double? height}) =>
      Illustration.asset(
        'assets/questionnaire.svg',
        package: _package,
        width: width,
        height: height,
      );
}
