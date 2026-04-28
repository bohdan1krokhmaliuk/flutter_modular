import 'package:design_system/src/atoms/dimension.dart';
import 'package:design_system/src/atoms/size.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.title,
    this.subtitle,
    this.actionTitle,
    this.onRetry,
  });

  final String? title;
  final String? subtitle;
  final String? actionTitle;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: dimen.all.sm,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Icon(Icons.help_outline, color: Colors.grey),
            if (title != null) ...[
              const SizedBox(height: xs),
              Center(child: Text(title!, textAlign: TextAlign.center)),
            ],
            const SizedBox(height: xs),
            Center(
              child: Text(
                subtitle ?? context.commonTranslations.error.smthWentWrong,
                textAlign: TextAlign.center,
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: xs),
              TextButton(
                onPressed: onRetry,
                child: Text(
                  actionTitle ?? context.commonTranslations.button.retry,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
