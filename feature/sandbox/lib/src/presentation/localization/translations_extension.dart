import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:sandbox/src/presentation/localization/translations/sandboxTranslations.i69n.dart';

extension SandboxTranslationsX on BuildContext {
  SandboxTranslations get translations =>
      getTranslations<SandboxTranslations>();
}
