// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:entrypoint/entrypoint.dart' as _i185;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:questionnaire/src/domain/api/questionnaire_api.dart' as _i663;
import 'package:questionnaire/src/domain/repository/questions_repository.dart'
    as _i998;
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart' as _i702;
import 'package:questionnaire/src/presentation/completed/bloc/completed_bloc.dart'
    as _i902;
import 'package:questionnaire/src/presentation/questions/bloc/question_bloc.dart'
    as _i398;
import 'package:questionnaire/src/presentation/welcome/bloc/welcome_bloc.dart'
    as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factoryParam<_i902.CompletedBloc, bool, dynamic>(
      (isCorrect, _) => _i902.CompletedBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionnaireState>>(),
        isCorrect,
      ),
    );
    gh.factory<_i663.QuestionnaireApi>(
      () => _i663.QuestionnaireApi(gh<_i361.Dio>()),
    );
    gh.factory<_i998.QuestionsRepository>(
      () => _i998.QuestionsRepository(gh<_i663.QuestionnaireApi>()),
    );
    gh.factory<_i460.WelcomeBloc>(
      () => _i460.WelcomeBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionnaireState>>(),
        gh<_i998.QuestionsRepository>(),
      ),
    );
    gh.factoryParam<_i398.QuestionBloc, _i398.QuestionBlocParams, dynamic>(
      (params, _) => _i398.QuestionBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionnaireState>>(),
        gh<_i998.QuestionsRepository>(),
        params,
      ),
    );
    return this;
  }
}
