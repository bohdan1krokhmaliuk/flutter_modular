import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/domain/model/answer.dart';
import 'package:questionnaire/src/domain/model/question.dart';
import 'package:questionnaire/src/presentation/questions/bloc/question_bloc.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.question, this.preselected});

  final Question question;
  final Answer? preselected;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: const PlatformAppBar(),
      body: BlocProvider(
        create: (_) => diContainer<QuestionBloc>(
          parameter: QuestionBlocParams(question, preselected),
        ),
        child: DefaultPresenter<QuestionBloc, QuestionState>(
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              final bloc = context.read<QuestionBloc>();
              return SubmitPage(
                bottom: FilledButton(
                  onPressed: state.selected != null
                      ? () => bloc.add(
                          state.selected?.nextQuestion != null
                              ? const QuestionEvent.next()
                              : const QuestionEvent.submit(),
                        )
                      : null,
                  child: Text(
                    state.selected == null ||
                            state.selected?.nextQuestion != null
                        ? context.commonTranslations.button.next
                        : context.commonTranslations.button.submit,
                  ),
                ),
                child: Padding(
                  padding: dimen.all.xs,
                  child: Column(
                    children: [
                      Text(
                        state.question.content,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: sm),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.question.answers.length,
                        separatorBuilder: (_, _) => const SizedBox(height: xxs),
                        itemBuilder: (context, i) {
                          final option = state.question.answers[i];
                          return PlatformCard(
                            title: option.content,
                            onTap: () => bloc.add(QuestionEvent.select(option)),
                            style: option.id == state.selected?.id
                                ? CardStyle.selected
                                : CardStyle.standard,
                          );
                        },
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
