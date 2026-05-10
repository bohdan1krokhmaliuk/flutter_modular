import 'package:bdd_steps/src/fakes/locale.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class TestApp<T> extends StatelessWidget {
  const TestApp({super.key, required this.builder, required this.onComplete});

  final Widget Function() builder;
  final ValueSetter<T?>? onComplete;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: diContainer<GlobalKey<NavigatorState>>(),
      localizationsDelegates: [CommonTranslationsLocalizationsDelegate()],
      locale: defaultLocale,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: _TestPage<T>(builder: builder, onComplete: onComplete),
    );
  }
}

class _TestPage<T> extends StatefulWidget {
  const _TestPage({super.key, required this.builder, required this.onComplete});

  final Widget Function() builder;
  final ValueSetter<T?>? onComplete;

  @override
  State<_TestPage<T>> createState() => __TestPageState<T>();
}

class __TestPageState<T> extends State<_TestPage<T>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final value = await Navigator.of(
        context,
      ).push<T>(MaterialPageRoute(builder: (_) => widget.builder()));

      widget.onComplete?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
