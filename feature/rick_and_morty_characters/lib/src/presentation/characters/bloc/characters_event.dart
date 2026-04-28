part of 'characters_bloc.dart';

@blocEvent
sealed class CharactersEvent with _$CharactersEvent {
  const factory CharactersEvent.load({@Default(false) bool reload}) =
      _LoadEvent;

  const factory CharactersEvent.loadMore() = _LoadMoreEvent;
}
