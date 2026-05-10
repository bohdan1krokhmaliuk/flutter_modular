import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:entrypoint/entrypoint.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:state_management/state_management.dart';

import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/entrypoint/{{#snakeCase}}{{name}}{{/snakeCase}}_flow_state.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/navigator/{{#snakeCase}}{{name}}{{/snakeCase}}_navigator.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/src/domain/repository/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_bloc.freezed.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}_event.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}_state.dart';

@injectable
class {{#pascalCase}}{{name}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{name}}{{/pascalCase}}Event, {{#pascalCase}}{{name}}{{/pascalCase}}State> {
  {{#pascalCase}}{{name}}{{/pascalCase}}Bloc(this._repository, this._navigator, this._flow) : super({{#pascalCase}}{{name}}{{/pascalCase}}State.initial()) {
    on<{{#pascalCase}}{{name}}{{/pascalCase}}Event>((event, emit) => event.map(load: (_) => _onLoad(emit)));

    add({{#pascalCase}}{{name}}{{/pascalCase}}Event.load());
  }

  final {{#pascalCase}}{{name}}{{/pascalCase}}Navigator _navigator;
  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository _repository;
  final FeatureFlowController<{{#pascalCase}}{{name}}{{/pascalCase}}FlowState> _flow;

  Future<void> _onLoad(Emitter<{{#pascalCase}}{{name}}{{/pascalCase}}State> emit) async {
    // TODO: add some functionality
  }
}
