import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavBar,
    this.floatingButton,
    this.floatingButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavBar;
  final Widget? floatingButton;
  final FloatingActionButtonLocation? floatingButtonLocation;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Theme.brightnessOf(context) == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: appBar,
        body: SizedBox.expand(child: body),
        bottomNavigationBar: bottomNavBar,
        floatingActionButton: floatingButton,
        floatingActionButtonLocation: floatingButtonLocation,
      ),
    );
  }
}
