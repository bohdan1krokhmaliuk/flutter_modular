import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/presentation/completed/bloc/completed_bloc.dart';
import 'package:questionnaire/src/presentation/localization/translations_extension.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key, required this.isCorrect});

  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final translations = context.translations.completed;
    return BlocProvider(
      create: (_) => diContainer<CompletedBloc>(parameter: isCorrect),
      child: DefaultPresenter<CompletedBloc, CompletedState>(
        child: BlocBuilder<CompletedBloc, CompletedState>(
          builder: (context, state) {
            final bloc = context.read<CompletedBloc>();
            final halfScreen = MediaQuery.widthOf(context) / 2;
            return PlatformScaffold(
              appBar: PlatformAppBar(
                leading: BackButton(
                  onPressed: () => bloc.add(const CompletedEvent.close()),
                ),
              ),
              body: SubmitPage(
                bottom: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: () => bloc.add(const CompletedEvent.close()),
                      child: Text(context.commonTranslations.button.close),
                    ),
                    if (!state.isCorrect) ...[
                      const SizedBox(height: xxs),
                      OutlinedButton(
                        onPressed: () => bloc.add(const CompletedEvent.retry()),
                        child: Text(context.commonTranslations.button.tryAgain),
                      ),
                    ],
                  ],
                ),
                child: Padding(
                  padding: dimen.all.xs,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: xs),
                      state.isCorrect
                          ? Illustrations.feedback.success(width: halfScreen)
                          : Illustrations.feedback.failure(width: halfScreen),
                      const SizedBox(height: sm),
                      Text(
                        translations.title(state.isCorrect),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: xxs),
                      Text(
                        translations.description(state.isCorrect),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
