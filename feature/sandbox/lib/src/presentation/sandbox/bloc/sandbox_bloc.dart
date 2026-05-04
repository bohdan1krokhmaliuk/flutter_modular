import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:presenter/presenter.dart';
import 'package:sandbox/src/configurator/sandbox_configurator.dart';
import 'package:sandbox/src/domain/repository/sandbox_repository.dart';
import 'package:sandbox/src/navigator/sandbox_navigator.dart';
import 'package:sandbox/src/presentation/presentations.dart';
import 'package:state_management/state_management.dart';

part 'sandbox_bloc.freezed.dart';
part 'sandbox_event.dart';
part 'sandbox_state.dart';

@injectable
class SandboxBloc extends Bloc<SandboxEvent, SandboxState> {
  SandboxBloc(this._repository, this._configurator, this._navigator)
    : super(const SandboxState.loading()) {
    on<SandboxEvent>(
      (event, emit) => event.map(
        load: (_) => _onLoad(emit),
        openRickAndMory: (_) => _onOpenRickAndMorty(),
        openQuestionnaire: (_) => _onOpenQuestionnaire(emit),
        tirggerDefaultExceptionPresentation: (_) => _onDefaultException(emit),
        tirggerCustomExceptionPresentation: (_) => _onCustomPresentation(emit),
      ),
    );

    add(SandboxEvent.load());
  }

  final SandboxNavigator _navigator;
  final SandboxRepository _repository;
  final SandboxConfigurator _configurator;

  Future<void> _onLoad(Emitter<SandboxState> emit) async {
    final (isRMAvailable, isQAvailable) = await (
      _configurator.isRickAndMortyAvailable(),
      _configurator.isQuestionnaireAvailable(),
    ).wait;

    emit(
      SandboxState.content(
        isRickAndMortyAvailable: isRMAvailable,
        isQuestionnaireAvailable: isQAvailable,
      ),
    );
  }

  void _onOpenRickAndMorty() => _navigator.openRickAndMorty();

  Future<void> _onOpenQuestionnaire(Emitter<SandboxState> emit) async {
    final result = await _navigator.openQuestionnaire();
    if (result == null) {
      return;
    }

    emit(state.copyWith(presentation: result ? Congrats() : Oops()));
  }

  Future<void> _onDefaultException(Emitter<SandboxState> emit) async {
    final result = await _repository.callInvalidUri();
    result.swap().forEach(
      (e) => emit(state.copyWith(presentation: Presentation.error(e))),
    );
  }

  Future<void> _onCustomPresentation(Emitter<SandboxState> emit) async {
    final result = await _repository.callCustomException();
    result.swap().forEach(
      (e) => emit(state.copyWith(presentation: Presentation.error(e))),
    );
  }
}
