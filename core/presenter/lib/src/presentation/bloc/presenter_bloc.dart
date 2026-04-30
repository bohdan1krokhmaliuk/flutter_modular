import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:state_management/state_management.dart';

part 'presenter_bloc.freezed.dart';
part 'presenter_event.dart';

@injectable
class PresenterBloc extends Bloc<PresenterEvent, void> {
  PresenterBloc() : super(null) {
    on<PresenterEvent>((event, emit) {});
  }
}
