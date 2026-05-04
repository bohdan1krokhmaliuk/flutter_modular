import 'package:entrypoint/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/src/di/di_initializer.dart';
import 'package:sandbox/src/presentation/localization/localizations_delegate.dart';
import 'package:sandbox/src/presentation/sandbox/sandbox_page.dart';

class SandboxEntrypoint extends StatelessWidget {
  const SandboxEntrypoint({super.key});

  @override
  Widget build(BuildContext context) => Entrypoint.page(
    page: const SandboxPage(),
    initializer: const SandboxDIInitializer(),
    localizationsDelegate: SandboxLocalizationsDelegate(),
  );
}
