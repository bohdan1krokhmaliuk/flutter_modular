// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompletedEvent {







@override
String toString() {
  return 'CompletedEvent()';
}


}




/// Adds pattern-matching-related methods to [CompletedEvent].
extension CompletedEventPatterns on CompletedEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CongratsEvent value)?  congrats,TResult Function( _CloseEvent value)?  close,TResult Function( _RetryEvent value)?  retry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CongratsEvent() when congrats != null:
return congrats(_that);case _CloseEvent() when close != null:
return close(_that);case _RetryEvent() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CongratsEvent value)  congrats,required TResult Function( _CloseEvent value)  close,required TResult Function( _RetryEvent value)  retry,}){
final _that = this;
switch (_that) {
case _CongratsEvent():
return congrats(_that);case _CloseEvent():
return close(_that);case _RetryEvent():
return retry(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CongratsEvent value)?  congrats,TResult? Function( _CloseEvent value)?  close,TResult? Function( _RetryEvent value)?  retry,}){
final _that = this;
switch (_that) {
case _CongratsEvent() when congrats != null:
return congrats(_that);case _CloseEvent() when close != null:
return close(_that);case _RetryEvent() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  congrats,TResult Function()?  close,TResult Function()?  retry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CongratsEvent() when congrats != null:
return congrats();case _CloseEvent() when close != null:
return close();case _RetryEvent() when retry != null:
return retry();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  congrats,required TResult Function()  close,required TResult Function()  retry,}) {final _that = this;
switch (_that) {
case _CongratsEvent():
return congrats();case _CloseEvent():
return close();case _RetryEvent():
return retry();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  congrats,TResult? Function()?  close,TResult? Function()?  retry,}) {final _that = this;
switch (_that) {
case _CongratsEvent() when congrats != null:
return congrats();case _CloseEvent() when close != null:
return close();case _RetryEvent() when retry != null:
return retry();case _:
  return null;

}
}

}

/// @nodoc


class _CongratsEvent implements CompletedEvent {
  const _CongratsEvent();
  








@override
String toString() {
  return 'CompletedEvent.congrats()';
}


}




/// @nodoc


class _CloseEvent implements CompletedEvent {
  const _CloseEvent();
  








@override
String toString() {
  return 'CompletedEvent.close()';
}


}




/// @nodoc


class _RetryEvent implements CompletedEvent {
  const _RetryEvent();
  








@override
String toString() {
  return 'CompletedEvent.retry()';
}


}




/// @nodoc
mixin _$CompletedState {

 bool get isCorrect; Presentation? get presentation;
/// Create a copy of CompletedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletedStateCopyWith<CompletedState> get copyWith => _$CompletedStateCopyWithImpl<CompletedState>(this as CompletedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletedState&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,presentation);

@override
String toString() {
  return 'CompletedState(isCorrect: $isCorrect, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $CompletedStateCopyWith<$Res>  {
  factory $CompletedStateCopyWith(CompletedState value, $Res Function(CompletedState) _then) = _$CompletedStateCopyWithImpl;
@useResult
$Res call({
 bool isCorrect, Presentation? presentation
});




}
/// @nodoc
class _$CompletedStateCopyWithImpl<$Res>
    implements $CompletedStateCopyWith<$Res> {
  _$CompletedStateCopyWithImpl(this._self, this._then);

  final CompletedState _self;
  final $Res Function(CompletedState) _then;

/// Create a copy of CompletedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? presentation = freezed,}) {
  return _then(_self.copyWith(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompletedState].
extension CompletedStatePatterns on CompletedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompletedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompletedState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompletedState value)  $default,){
final _that = this;
switch (_that) {
case _CompletedState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompletedState value)?  $default,){
final _that = this;
switch (_that) {
case _CompletedState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isCorrect,  Presentation? presentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompletedState() when $default != null:
return $default(_that.isCorrect,_that.presentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isCorrect,  Presentation? presentation)  $default,) {final _that = this;
switch (_that) {
case _CompletedState():
return $default(_that.isCorrect,_that.presentation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isCorrect,  Presentation? presentation)?  $default,) {final _that = this;
switch (_that) {
case _CompletedState() when $default != null:
return $default(_that.isCorrect,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _CompletedState implements CompletedState {
  const _CompletedState({required this.isCorrect, this.presentation});
  

@override final  bool isCorrect;
@override final  Presentation? presentation;

/// Create a copy of CompletedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedStateCopyWith<_CompletedState> get copyWith => __$CompletedStateCopyWithImpl<_CompletedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletedState&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isCorrect,presentation);

@override
String toString() {
  return 'CompletedState(isCorrect: $isCorrect, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$CompletedStateCopyWith<$Res> implements $CompletedStateCopyWith<$Res> {
  factory _$CompletedStateCopyWith(_CompletedState value, $Res Function(_CompletedState) _then) = __$CompletedStateCopyWithImpl;
@override @useResult
$Res call({
 bool isCorrect, Presentation? presentation
});




}
/// @nodoc
class __$CompletedStateCopyWithImpl<$Res>
    implements _$CompletedStateCopyWith<$Res> {
  __$CompletedStateCopyWithImpl(this._self, this._then);

  final _CompletedState _self;
  final $Res Function(_CompletedState) _then;

/// Create a copy of CompletedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? presentation = freezed,}) {
  return _then(_CompletedState(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}


}

// dart format on
