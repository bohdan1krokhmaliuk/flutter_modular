import 'package:flutter/widgets.dart';
import 'package:platform_info/platform_info.dart';

class TestFacade extends StatelessWidget {
  const TestFacade({super.key, required this.child, this.testBuilder});

  final Widget child;
  final WidgetBuilder? testBuilder;

  @override
  Widget build(BuildContext context) {
    final isInTests = PlatformInfo.isFlutterTest;
    return isInTests
        ? testBuilder?.call(context) ?? const SizedBox.shrink()
        : child;
  }
}
