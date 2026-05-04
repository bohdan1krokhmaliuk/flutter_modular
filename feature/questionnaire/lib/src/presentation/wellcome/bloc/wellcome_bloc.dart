import 'package:entrypoint/entrypoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/domain/repository/questions_repository.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart';
import 'package:state_management/state_management.dart';

part 'wellcome_bloc.freezed.dart';
part 'wellcome_event.dart';
part 'wellcome_state.dart';

@injectable
class WellcomeBloc extends Bloc<WellcomeEvent, WellcomeState> {
  WellcomeBloc(this._flow, this._repository) : super(const WellcomeState()) {
    on<WellcomeEvent>(
      (event, emit) => event.map(proceed: (_) => _onProceed(emit)),
    );
  }

  final FeatureFlowController<QuestionarrieState> _flow;
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
