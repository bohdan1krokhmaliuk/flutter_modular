import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_characters/src/domain/model/character.dart';
import 'package:rick_and_morty_characters/src/domain/repository/characters_repository.dart';
import 'package:state_management/state_management.dart';

part 'characters_bloc.freezed.dart';
part 'characters_event.dart';
part 'characters_state.dart';

@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this._repository) : super(CharactersState.loading()) {
    on<CharactersEvent>((event, emit) async {
      await event.map(
        load: (_) => _onLoad(emit),
        loadMore: (_) => _onLoadMore(emit),
      );
    });

    add(CharactersEvent.load());
  }

  final CharactersRepository _repository;
  int _page = 1;

  Future<void> _onLoad(Emitter<CharactersState> emit) async {
    emit(CharactersState.loading());

    _page = 1;
    final result = await _repository.getCharacters(_page++);
    result.fold(
      (characters) => emit(CharactersState.content(characters: characters)),
      (_) => emit(CharactersState.error()),
    );
  }

  Future<void> _onLoadMore(Emitter<CharactersState> emit) async {
    final content = state.mapOrNull(content: (c) => c);
    if (content == null ||
        content.isLoadingNextPage ||
        content.hasNextPageError) {
      return;
    }

    emit(content.copyWith(isLoadingNextPage: true));
    final result = await _repository.getCharacters(_page++);
    result.fold(
      (characters) => emit(
        content.copyWith(
          isLoadingNextPage: false,
          characters: [...content.characters, ...characters],
        ),
      ),
      (e) {
        _page--;
        emit(
          content.copyWith(
            isLoadingNextPage: false,
            hasNextPage: !e.isNotFoundException,
            hasNextPageError: !e.isNotFoundException,
          ),
        );
      },
    );
  }
}
