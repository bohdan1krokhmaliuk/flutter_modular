// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeEvent {







@override
String toString() {
  return 'WelcomeEvent()';
}


}




/// Adds pattern-matching-related methods to [WelcomeEvent].
extension WelcomeEventPatterns on WelcomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ProceedEvent value)?  proceed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProceedEvent() when proceed != null:
return proceed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ProceedEvent value)  proceed,}){
final _that = this;
switch (_that) {
case _ProceedEvent():
return proceed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ProceedEvent value)?  proceed,}){
final _that = this;
switch (_that) {
case _ProceedEvent() when proceed != null:
return proceed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  proceed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProceedEvent() when proceed != null:
return proceed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  proceed,}) {final _that = this;
switch (_that) {
case _ProceedEvent():
return proceed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  proceed,}) {final _that = this;
switch (_that) {
case _ProceedEvent() when proceed != null:
return proceed();case _:
  return null;

}
}

}

/// @nodoc


class _ProceedEvent implements WelcomeEvent {
  const _ProceedEvent();
  








@override
String toString() {
  return 'WelcomeEvent.proceed()';
}


}




/// @nodoc
mixin _$WelcomeState {

 bool get isLoading; Presentation? get presentation;
/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeStateCopyWith<WelcomeState> get copyWith => _$WelcomeStateCopyWithImpl<WelcomeState>(this as WelcomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,presentation);

@override
String toString() {
  return 'WelcomeState(isLoading: $isLoading, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $WelcomeStateCopyWith<$Res>  {
  factory $WelcomeStateCopyWith(WelcomeState value, $Res Function(WelcomeState) _then) = _$WelcomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Presentation? presentation
});




}
/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res>
    implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._self, this._then);

  final WelcomeState _self;
  final $Res Function(WelcomeState) _then;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? presentation = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeState].
extension WelcomeStatePatterns on WelcomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeState value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeState value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  Presentation? presentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
return $default(_that.isLoading,_that.presentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  Presentation? presentation)  $default,) {final _that = this;
switch (_that) {
case _WelcomeState():
return $default(_that.isLoading,_that.presentation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  Presentation? presentation)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
return $default(_that.isLoading,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _WelcomeState implements WelcomeState {
  const _WelcomeState({this.isLoading = false, this.presentation});
  

@override@JsonKey() final  bool isLoading;
@override final  Presentation? presentation;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeStateCopyWith<_WelcomeState> get copyWith => __$WelcomeStateCopyWithImpl<_WelcomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,presentation);

@override
String toString() {
  return 'WelcomeState(isLoading: $isLoading, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$WelcomeStateCopyWith<$Res> implements $WelcomeStateCopyWith<$Res> {
  factory _$WelcomeStateCopyWith(_WelcomeState value, $Res Function(_WelcomeState) _then) = __$WelcomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Presentation? presentation
});




}
/// @nodoc
class __$WelcomeStateCopyWithImpl<$Res>
    implements _$WelcomeStateCopyWith<$Res> {
  __$WelcomeStateCopyWithImpl(this._self, this._then);

  final _WelcomeState _self;
  final $Res Function(_WelcomeState) _then;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? presentation = freezed,}) {
  return _then(_WelcomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}


}

// dart format on
