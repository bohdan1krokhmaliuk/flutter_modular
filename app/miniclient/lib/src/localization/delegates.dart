import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizations/localizations.dart';

final localizationDelegates = [
  ..._defaultLocalizationsDelegates,
  ..._appLocalizationsDelegates,
];

final _defaultLocalizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

final _appLocalizationsDelegates = [CommonTranslationsLocalizationsDelegate()];
