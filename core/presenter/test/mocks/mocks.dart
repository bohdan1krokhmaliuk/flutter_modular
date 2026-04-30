import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presenter/presenter.dart';

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
  FakeFeatureBloc() : super(FakeState(null)) {
    on<MockEvent>((event, emit) => emit(FakeState(event.presentation)));
  }
}

class FakePresentation implements Presentation {
  const FakePresentation();
}
