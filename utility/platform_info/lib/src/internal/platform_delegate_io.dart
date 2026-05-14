import 'dart:io';

final class PlatformDelegate {
  PlatformDelegate._();

  static bool get isFlutterTest =>
      Platform.environment.containsKey('FLUTTER_TEST');
  static Map<String, String> get environment => Platform.environment;
  static String get localeName => Platform.localeName;
  static String get operatingSystem => Platform.operatingSystem;
  static String get operatingSystemVersion => Platform.operatingSystemVersion;
  static int get numberOfProcessors => Platform.numberOfProcessors;
}
