// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersEvent {







@override
String toString() {
  return 'CharactersEvent()';
}


}




/// Adds pattern-matching-related methods to [CharactersEvent].
extension CharactersEventPatterns on CharactersEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadEvent value)?  load,TResult Function( _LoadMoreEvent value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that);case _LoadMoreEvent() when loadMore != null:
return loadMore(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadEvent value)  load,required TResult Function( _LoadMoreEvent value)  loadMore,}){
final _that = this;
switch (_that) {
case _LoadEvent():
return load(_that);case _LoadMoreEvent():
return loadMore(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadEvent value)?  load,TResult? Function( _LoadMoreEvent value)?  loadMore,}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that);case _LoadMoreEvent() when loadMore != null:
return loadMore(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool reload)?  load,TResult Function()?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that.reload);case _LoadMoreEvent() when loadMore != null:
return loadMore();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool reload)  load,required TResult Function()  loadMore,}) {final _that = this;
switch (_that) {
case _LoadEvent():
return load(_that.reload);case _LoadMoreEvent():
return loadMore();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool reload)?  load,TResult? Function()?  loadMore,}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that.reload);case _LoadMoreEvent() when loadMore != null:
return loadMore();case _:
  return null;

}
}

}

/// @nodoc


class _LoadEvent implements CharactersEvent {
  const _LoadEvent({this.reload = false});
  

@JsonKey() final  bool reload;






@override
String toString() {
  return 'CharactersEvent.load(reload: $reload)';
}


}




/// @nodoc


class _LoadMoreEvent implements CharactersEvent {
  const _LoadMoreEvent();
  








@override
String toString() {
  return 'CharactersEvent.loadMore()';
}


}




/// @nodoc
mixin _$CharactersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState()';
}


}

/// @nodoc
class $CharactersStateCopyWith<$Res>  {
$CharactersStateCopyWith(CharactersState _, $Res Function(CharactersState) __);
}


/// Adds pattern-matching-related methods to [CharactersState].
extension CharactersStatePatterns on CharactersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadingState value)?  loading,TResult Function( _ErrorState value)?  error,TResult Function( _ContentState value)?  content,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _ErrorState() when error != null:
return error(_that);case _ContentState() when content != null:
return content(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadingState value)  loading,required TResult Function( _ErrorState value)  error,required TResult Function( _ContentState value)  content,}){
final _that = this;
switch (_that) {
case _LoadingState():
return loading(_that);case _ErrorState():
return error(_that);case _ContentState():
return content(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadingState value)?  loading,TResult? Function( _ErrorState value)?  error,TResult? Function( _ContentState value)?  content,}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _ErrorState() when error != null:
return error(_that);case _ContentState() when content != null:
return content(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  error,TResult Function( List<Character> characters,  bool hasNextPage,  bool isLoadingNextPage,  bool hasNextPageError)?  content,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading();case _ErrorState() when error != null:
return error();case _ContentState() when content != null:
return content(_that.characters,_that.hasNextPage,_that.isLoadingNextPage,_that.hasNextPageError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  error,required TResult Function( List<Character> characters,  bool hasNextPage,  bool isLoadingNextPage,  bool hasNextPageError)  content,}) {final _that = this;
switch (_that) {
case _LoadingState():
return loading();case _ErrorState():
return error();case _ContentState():
return content(_that.characters,_that.hasNextPage,_that.isLoadingNextPage,_that.hasNextPageError);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  error,TResult? Function( List<Character> characters,  bool hasNextPage,  bool isLoadingNextPage,  bool hasNextPageError)?  content,}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading();case _ErrorState() when error != null:
return error();case _ContentState() when content != null:
return content(_that.characters,_that.hasNextPage,_that.isLoadingNextPage,_that.hasNextPageError);case _:
  return null;

}
}

}

/// @nodoc


class _LoadingState implements CharactersState {
  const _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState.loading()';
}


}




/// @nodoc


class _ErrorState implements CharactersState {
  const _ErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState.error()';
}


}




/// @nodoc


class _ContentState implements CharactersState {
  const _ContentState({required final  List<Character> characters, this.hasNextPage = true, this.isLoadingNextPage = false, this.hasNextPageError = false}): _characters = characters;
  

 final  List<Character> _characters;
 List<Character> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}

@JsonKey() final  bool hasNextPage;
@JsonKey() final  bool isLoadingNextPage;
@JsonKey() final  bool hasNextPageError;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentStateCopyWith<_ContentState> get copyWith => __$ContentStateCopyWithImpl<_ContentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentState&&const DeepCollectionEquality().equals(other._characters, _characters)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage)&&(identical(other.hasNextPageError, hasNextPageError) || other.hasNextPageError == hasNextPageError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters),hasNextPage,isLoadingNextPage,hasNextPageError);

@override
String toString() {
  return 'CharactersState.content(characters: $characters, hasNextPage: $hasNextPage, isLoadingNextPage: $isLoadingNextPage, hasNextPageError: $hasNextPageError)';
}


}

/// @nodoc
abstract mixin class _$ContentStateCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory _$ContentStateCopyWith(_ContentState value, $Res Function(_ContentState) _then) = __$ContentStateCopyWithImpl;
@useResult
$Res call({
 List<Character> characters, bool hasNextPage, bool isLoadingNextPage, bool hasNextPageError
});




}
/// @nodoc
class __$ContentStateCopyWithImpl<$Res>
    implements _$ContentStateCopyWith<$Res> {
  __$ContentStateCopyWithImpl(this._self, this._then);

  final _ContentState _self;
  final $Res Function(_ContentState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? characters = null,Object? hasNextPage = null,Object? isLoadingNextPage = null,Object? hasNextPageError = null,}) {
  return _then(_ContentState(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPageError: null == hasNextPageError ? _self.hasNextPageError : hasNextPageError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
