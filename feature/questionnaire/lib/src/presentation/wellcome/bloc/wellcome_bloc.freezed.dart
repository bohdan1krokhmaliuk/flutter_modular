// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellcome_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WellcomeEvent {







@override
String toString() {
  return 'WellcomeEvent()';
}


}




/// Adds pattern-matching-related methods to [WellcomeEvent].
extension WellcomeEventPatterns on WellcomeEvent {
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


class _ProceedEvent implements WellcomeEvent {
  const _ProceedEvent();
  








@override
String toString() {
  return 'WellcomeEvent.proceed()';
}


}




/// @nodoc
mixin _$WellcomeState {

 bool get isLoading; Presentation? get presentation;
/// Create a copy of WellcomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WellcomeStateCopyWith<WellcomeState> get copyWith => _$WellcomeStateCopyWithImpl<WellcomeState>(this as WellcomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WellcomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,presentation);

@override
String toString() {
  return 'WellcomeState(isLoading: $isLoading, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $WellcomeStateCopyWith<$Res>  {
  factory $WellcomeStateCopyWith(WellcomeState value, $Res Function(WellcomeState) _then) = _$WellcomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Presentation? presentation
});




}
/// @nodoc
class _$WellcomeStateCopyWithImpl<$Res>
    implements $WellcomeStateCopyWith<$Res> {
  _$WellcomeStateCopyWithImpl(this._self, this._then);

  final WellcomeState _self;
  final $Res Function(WellcomeState) _then;

/// Create a copy of WellcomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? presentation = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}

}


/// Adds pattern-matching-related methods to [WellcomeState].
extension WellcomeStatePatterns on WellcomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WellcomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WellcomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WellcomeState value)  $default,){
final _that = this;
switch (_that) {
case _WellcomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WellcomeState value)?  $default,){
final _that = this;
switch (_that) {
case _WellcomeState() when $default != null:
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
case _WellcomeState() when $default != null:
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
case _WellcomeState():
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
case _WellcomeState() when $default != null:
return $default(_that.isLoading,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _WellcomeState implements WellcomeState {
  const _WellcomeState({this.isLoading = false, this.presentation});
  

@override@JsonKey() final  bool isLoading;
@override final  Presentation? presentation;

/// Create a copy of WellcomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WellcomeStateCopyWith<_WellcomeState> get copyWith => __$WellcomeStateCopyWithImpl<_WellcomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WellcomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,presentation);

@override
String toString() {
  return 'WellcomeState(isLoading: $isLoading, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$WellcomeStateCopyWith<$Res> implements $WellcomeStateCopyWith<$Res> {
  factory _$WellcomeStateCopyWith(_WellcomeState value, $Res Function(_WellcomeState) _then) = __$WellcomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Presentation? presentation
});




}
/// @nodoc
class __$WellcomeStateCopyWithImpl<$Res>
    implements _$WellcomeStateCopyWith<$Res> {
  __$WellcomeStateCopyWithImpl(this._self, this._then);

  final _WellcomeState _self;
  final $Res Function(_WellcomeState) _then;

/// Create a copy of WellcomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? presentation = freezed,}) {
  return _then(_WellcomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}


}

// dart format on
