// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty_characters/src/domain/api/characters_api.dart'
    as _i187;
import 'package:rick_and_morty_characters/src/domain/repository/characters_repository.dart'
    as _i268;
import 'package:rick_and_morty_characters/src/presentation/characters/bloc/characters_bloc.dart'
    as _i602;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i187.CharactersApi>(() => _i187.CharactersApi(gh<_i361.Dio>()));
    gh.factory<_i268.CharactersRepository>(
      () => _i268.CharactersRepository(gh<_i187.CharactersApi>()),
    );
    gh.factory<_i602.CharactersBloc>(
      () => _i602.CharactersBloc(gh<_i268.CharactersRepository>()),
    );
    return this;
  }
}
