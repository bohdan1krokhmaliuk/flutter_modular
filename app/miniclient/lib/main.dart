import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:entrypoint/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:miniclient/src/di/global_di_initializer.dart';
import 'package:miniclient/src/localization/delegates.dart';
import 'package:navigation/navigation.dart';

void main() {
  runApp(const MiniclientEntrypoint());
}

class MiniclientEntrypoint extends StatelessWidget {
  const MiniclientEntrypoint({super.key});

  // [HINT] This widget is the root of your application.
  // Registration of all top level dependencies happens in [Entrypoint.widget]
  // Initialization is happening via modules/preResolve or other Injectable handlers
  //
  // Thats simple implementation of DI initialization but you may want to initalize more things
  // than you can create top level Future function which will initialize all dependencies
  // and implement similar logic with FutureBuilder for Entrypoint.widget in order to initialize
  // everything and not just DI
  @override
  Widget build(BuildContext context) => Entrypoint.widget(
    initializer: initializer,
    placeholder: LoadingView(),
    child: const _Router(),
  );
}

class _Router extends StatelessWidget {
  const _Router();

  @override
  Widget build(BuildContext context) {
    final router = diContainer<MiniclientRouter>();
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      locale: SupportedLocale.enUS.locale,
      supportedLocales: SupportedLocale.locales,
      localizationsDelegates: localizationDelegates,
      routerConfig: router.appConfig(placeholder: (context) => LoadingView()),
      title: 'Flutter Modular Demo',
    );
  }
}
