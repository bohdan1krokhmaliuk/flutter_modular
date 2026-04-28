part of 'characters_bloc.dart';

@blocState
sealed class CharactersState with _$CharactersState {
  const factory CharactersState.loading() = _LoadingState;
  const factory CharactersState.error() = _ErrorState;
  const factory CharactersState.content({
    required List<Character> characters,
    @Default(true) bool hasNextPage,
    @Default(false) bool isLoadingNextPage,
    @Default(false) bool hasNextPageError,
  }) = _ContentState;
}
