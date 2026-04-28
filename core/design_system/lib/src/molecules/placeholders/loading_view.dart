import 'package:design_system/src/molecules/platform_progress_indicator.dart';
import 'package:flutter/widgets.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: PlatformProgressIndicator());
  }
}
