import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/presentation/localization/translations_extension.dart';
import 'package:questionnaire/src/presentation/wellcome/bloc/wellcome_bloc.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = context.translations.wellcome;
    return PlatformScaffold(
      appBar: PlatformAppBar(title: translations.pageTitle),
      body: BlocProvider(
        create: (_) => diContainer<WellcomeBloc>(),
        child: DefaultPresenter<WellcomeBloc, WellcomeState>(
          child: BlocBuilder<WellcomeBloc, WellcomeState>(
            builder: (context, state) {
              final bloc = context.read<WellcomeBloc>();
              return SubmitPage(
                bottom: FilledButton(
                  child: Text(translations.button),
                  onPressed: state.isLoading
                      ? null
                      : () => bloc.add(WellcomeEvent.proceed()),
                ),
                child: Padding(
                  padding: dimen.all.xs,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: xs),
                      Illustrations.custom.questionnaire(
                        width: MediaQuery.widthOf(context) / 2,
                      ),
                      SizedBox(height: md),
                      Text(
                        translations.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: xxs),
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
