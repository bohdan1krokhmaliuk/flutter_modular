// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:entrypoint/entrypoint.dart' as _i185;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:questionnaire/src/domain/api/questions_api.dart' as _i434;
import 'package:questionnaire/src/domain/repository/questions_repository.dart'
    as _i998;
import 'package:questionnaire/src/entrypoint/questionnaire_state.dart' as _i702;
import 'package:questionnaire/src/presentation/completed/bloc/completed_bloc.dart'
    as _i902;
import 'package:questionnaire/src/presentation/questions/bloc/question_bloc.dart'
    as _i398;
import 'package:questionnaire/src/presentation/wellcome/bloc/wellcome_bloc.dart'
    as _i612;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i434.QuestionnaireApi>(() => const _i434.QuestionnaireApi());
    gh.factory<_i998.QuestionsRepository>(
      () => _i998.QuestionsRepository(gh<_i434.QuestionnaireApi>()),
    );
    gh.factory<_i612.WellcomeBloc>(
      () => _i612.WellcomeBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionarrieState>>(),
        gh<_i998.QuestionsRepository>(),
      ),
    );
    gh.factoryParam<_i398.QuestionBloc, _i398.QuesstionBlocParams, dynamic>(
      (params, _) => _i398.QuestionBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionarrieState>>(),
        gh<_i998.QuestionsRepository>(),
        params,
      ),
    );
    gh.factoryParam<_i902.CompletedBloc, bool, dynamic>(
      (isCorrect, _) => _i902.CompletedBloc(
        gh<_i185.FeatureFlowController<_i702.QuestionarrieState>>(),
        isCorrect,
      ),
    );
    return this;
  }
}
