import 'package:platform_info/src/internal/platform_delegate.dart';

abstract final class PlatformInfo {
  // ── dart:io-backed (web-safe via conditional import) ─────────────────────

  /// Whether the current process was launched by `flutter test`.
  static bool get isFlutterTest => PlatformDelegate.isFlutterTest;

  /// Process environment variables. Always empty on web.
  static Map<String, String> get environment => PlatformDelegate.environment;

  /// BCP 47 locale tag reported by the OS (e.g. `en_US`). Empty on web.
  static String get localeName => PlatformDelegate.localeName;

  /// OS identifier string (e.g. `macos`, `android`, `web`).
  static String get operatingSystem => PlatformDelegate.operatingSystem;

  /// Human-readable OS version string. Empty on web.
  static String get operatingSystemVersion =>
      PlatformDelegate.operatingSystemVersion;

  /// Number of logical processors available. Returns 1 on web.
  static int get numberOfProcessors => PlatformDelegate.numberOfProcessors;
}
