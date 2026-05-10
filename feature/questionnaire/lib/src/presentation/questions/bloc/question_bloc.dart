import 'package:entrypoint/entrypoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/domain/model/answer.dart';
import 'package:questionnaire/src/domain/model/question.dart';
import 'package:questionnaire/src/domain/repository/questions_repository.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart';
import 'package:state_management/state_management.dart';

part 'question_bloc.freezed.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuesstionBlocParams {
  const QuesstionBlocParams(this.question, this.preselectedAnswer);

  final Question question;
  final Answer? preselectedAnswer;
}

@injectable
class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(
    this._flow,
    this._repository,
    @factoryParam QuesstionBlocParams params,
  ) : super(
        QuestionState(
          question: params.question,
          selected: params.preselectedAnswer,
        ),
      ) {
    on<QuestionEvent>(
      (event, emit) => event.when(
        select: (answer) => _onSelect(emit, answer),
        submit: () => _onSubmit(emit),
        next: () => _onNext(),
      ),
    );
  }

  final FeatureFlowController<QuestionarrieState> _flow;
  final QuestionsRepository _repository;

  void _onSelect(Emitter<QuestionState> emit, Answer answer) =>
      emit(state.copyWith(selected: answer));

  Future<void> _onNext() async {
    if (state.selected case final selected?) {
      _flow.update((s) => s.saveAnswer(selected));
    }
  }

  Future<void> _onSubmit(Emitter<QuestionState> emit) async {
    final selected = state.selected;
    if (selected == null) {
      return;
    }

    final navState = _flow.state.saveAnswer(selected);
    final result = await _repository.submit(navState.answerIds);

    result.fold(
      (isCorrect) =>
          _flow.update((_) => navState.copyWith(isCorrect: isCorrect)),
      (e) => emit(state.copyWith(presentation: Presentation.error(e))),
    );
  }
}
