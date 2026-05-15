import 'package:entrypoint/entrypoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presenter/presenter.dart';
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart';
import 'package:state_management/state_management.dart';

part 'completed_bloc.freezed.dart';
part 'completed_event.dart';
part 'completed_state.dart';

@injectable
class CompletedBloc extends Bloc<CompletedEvent, CompletedState> {
  CompletedBloc(this._flow, @factoryParam bool isCorrect)
    : super(CompletedState(isCorrect: isCorrect)) {
    on<CompletedEvent>(
      (event, emit) => event.when(
        retry: () => _onRetry(),
        close: () => _onClose(),
        congrats: () => _onCongrats(emit),
      ),
    );

    if (state.isCorrect) {
      add(const CompletedEvent.congrats());
    }
  }

  final FeatureFlowController<QuestionnaireState> _flow;

  void _onRetry() => _flow.update((s) => s.reset());
  void _onClose() => _flow.complete(state.isCorrect);
  void _onCongrats(Emitter<CompletedState> emit) =>
      emit(state.copyWith(presentation: Presentation.confetti()));
}
