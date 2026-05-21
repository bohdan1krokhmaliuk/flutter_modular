final class PlatformDelegate {
  PlatformDelegate._();

  static bool get isFlutterTest => false;
  static Map<String, String> get environment => const {};
  static String get localeName => '';
  static String get operatingSystem => 'web';
  static String get operatingSystemVersion => '';
  static int get numberOfProcessors => 1;
}
