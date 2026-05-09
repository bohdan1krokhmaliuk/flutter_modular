import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presenter/presenter.dart';
import 'package:sandbox/src/presentation/localization/translations_extension.dart';
import 'package:sandbox/src/presentation/presentation_builder.dart';
import 'package:sandbox/src/presentation/sandbox/bloc/sandbox_bloc.dart';

class SandboxPage extends StatelessWidget {
  const SandboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: context.translations.main.title),
      body: BlocProvider(
        create: (_) => diContainer<SandboxBloc>(),
        child: DefaultPresenter<SandboxBloc, SandboxState>(
          builder: presentationBuilder,
          child: BlocBuilder<SandboxBloc, SandboxState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: state.map(
                  loading: (_) => const LoadingView(),
                  content: (state) {
                    final bloc = context.read<SandboxBloc>();
                    final translations = context.translations.main;
                    return Padding(
                      padding: dimen.all.xs,
                      child: Column(
                        spacing: xs,
                        children: [
                          if (state.isRickAndMortyAvailable)
                            PlatformCard(
                              trailing: Icons.chevron_right,
                              title: translations.rickAndMorty,
                              description: context
                                  .translations
                                  .main
                                  .rickAndMortyDescription,
                              onTap: () => bloc.add(
                                const SandboxEvent.openRickAndMory(),
                              ),
                            ),
                          if (state.isQuestionnaireAvailable)
                            PlatformCard(
                              trailing: Icons.chevron_right,
                              title: translations.quest,
                              description: translations.questDescription,
                              onTap: () => bloc.add(
                                const SandboxEvent.openQuestionnaire(),
                              ),
                            ),
                          PlatformCard(
                            trailing: Icons.link,
                            title: translations.defaultException,
                            description:
                                translations.defaultExceptionDescription,
                            onTap: () => bloc.add(
                              const SandboxEvent.tirggerDefaultExceptionPresentation(),
                            ),
                          ),
                          PlatformCard(
                            trailing: Icons.link,
                            title: translations.customException,
                            description:
                                translations.customExceptionDescription,
                            onTap: () => bloc.add(
                              const SandboxEvent.tirggerCustomExceptionPresentation(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
