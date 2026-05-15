import 'package:entrypoint/entrypoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/domain/repository/questions_repository.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart';
import 'package:state_management/state_management.dart';

part 'welcome_bloc.freezed.dart';
part 'welcome_event.dart';
part 'welcome_state.dart';

@injectable
class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc(this._flow, this._repository) : super(const WelcomeState()) {
    on<WelcomeEvent>(
      (event, emit) => event.map(proceed: (_) => _onProceed(emit)),
    );
  }

  final FeatureFlowController<QuestionnaireState> _flow;
  final QuestionsRepository _repository;

  Future<void> _onProceed(Emitter<void> emit) async {
    if (_flow.state.questions.isNotEmpty) {
      return _flow.update((s) => s.setQuestions(s.questions));
    }

    emit(state.copyWith(isLoading: true));
    final result = await _repository.load();

    result.fold(
      (q) => _flow.update((s) => s.setQuestions(q)),
      (e) => emit(state.copyWith(presentation: Presentation.error(e))),
    );
    emit(state.copyWith(isLoading: false));
  }
}
