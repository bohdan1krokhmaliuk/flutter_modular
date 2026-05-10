import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:presenter/presenter.dart';
import 'package:sandbox/src/domain/model/sandbox_exception.dart';
import 'package:sandbox/src/presentation/localization/translations_extension.dart';
import 'package:sandbox/src/presentation/presentations.dart';

bool? presentationBuilder(BuildContext context, Presentation presentation) {
  final translations = context.translations.presentation;
  switch (presentation) {
    case Oops():
      Toast.of(context).show(translations.oops, color: Colors.redAccent);
    case Congrats():
      Toast.of(context).show(translations.congrats, color: Colors.green);
    case ExceptionPresentation(exception: final e) when e is SandboxException:
      Toast.of(context).show(translations.custom);
    default:
      return false;
  }
  return true;
}
