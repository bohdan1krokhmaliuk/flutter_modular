part of 'illustrations.dart';

class _CustomImages {
  const _CustomImages();

  Illustration questionnaire({double? width, double? height}) =>
      Illustration.asset(
        'assets/questionnaire.svg',
        package: _package,
        width: width,
        height: height,
      );
}
