import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presenter/src/presentation/models/presentation.dart';
import 'package:presenter/src/presentation/models/presenting_state.dart';

class FakeState implements PresentingState {
  const FakeState(this.presentation);

  @override
  final Presentation? presentation;
}

class MockEvent {
  const MockEvent(this.presentation);

  final Presentation presentation;
}

class FakeFeatureBloc extends Bloc<MockEvent, FakeState> {
  FakeFeatureBloc() : super(const FakeState(null)) {
    on<MockEvent>((event, emit) => emit(FakeState(event.presentation)));
  }
}

class FakePresentation extends Presentation {
  FakePresentation();
}
