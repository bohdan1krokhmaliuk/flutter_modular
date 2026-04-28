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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Entrypoint.widget(
    initializer: initializer,
    placeholder: Center(child: CircularProgressIndicator()),
    child: const _Router(),
  );
}

class _Router extends StatelessWidget {
  const _Router();

  @override
  Widget build(BuildContext context) {
    final router = diContainer<MiniclientRouter>();
    return MaterialApp.router(
      locale: SupportedLocale.enUS.locale,
      supportedLocales: SupportedLocale.locales,
      localizationsDelegates: localizationDelegates,
      routerConfig: router.appConfig(
        placeholder: (context) => Center(child: CircularProgressIndicator()),
      ),
      title: 'Flutter Modular Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
