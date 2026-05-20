import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/presentation/localization/translations_extension.dart';
import 'package:questionnaire/src/presentation/welcome/bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = context.translations.welcome;
    return PlatformScaffold(
      appBar: PlatformAppBar(title: translations.pageTitle),
      body: BlocProvider(
        create: (_) => diContainer<WelcomeBloc>(),
        child: DefaultPresenter<WelcomeBloc, WelcomeState>(
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              final bloc = context.read<WelcomeBloc>();
              return SubmitPage(
                bottom: FilledButton(
                  onPressed: state.isLoading
                      ? null
                      : () => bloc.add(const WelcomeEvent.proceed()),
                  child: Text(translations.button),
                ),
                child: Padding(
                  padding: dimen.all.xs,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: xs),
                      Illustrations.custom.questionnaire(
                        width: MediaQuery.widthOf(context) / 2,
                      ),
                      const SizedBox(height: md),
                      Text(
                        translations.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: xxs),
                      Text(
                        translations.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
