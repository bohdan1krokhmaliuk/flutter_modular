// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sandbox_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SandboxEvent {







@override
String toString() {
  return 'SandboxEvent()';
}


}




/// Adds pattern-matching-related methods to [SandboxEvent].
extension SandboxEventPatterns on SandboxEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadEvent value)?  load,TResult Function( _OpenRickAndMortyEvent value)?  openRickAndMorty,TResult Function( _OpenQuestionnaireEvent value)?  openQuestionnaire,TResult Function( _DefaultExceptionEvent value)?  triggerDefaultExceptionPresentation,TResult Function( _CustomExceptionEvent value)?  triggerCustomExceptionPresentation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that);case _OpenRickAndMortyEvent() when openRickAndMorty != null:
return openRickAndMorty(_that);case _OpenQuestionnaireEvent() when openQuestionnaire != null:
return openQuestionnaire(_that);case _DefaultExceptionEvent() when triggerDefaultExceptionPresentation != null:
return triggerDefaultExceptionPresentation(_that);case _CustomExceptionEvent() when triggerCustomExceptionPresentation != null:
return triggerCustomExceptionPresentation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadEvent value)  load,required TResult Function( _OpenRickAndMortyEvent value)  openRickAndMorty,required TResult Function( _OpenQuestionnaireEvent value)  openQuestionnaire,required TResult Function( _DefaultExceptionEvent value)  triggerDefaultExceptionPresentation,required TResult Function( _CustomExceptionEvent value)  triggerCustomExceptionPresentation,}){
final _that = this;
switch (_that) {
case _LoadEvent():
return load(_that);case _OpenRickAndMortyEvent():
return openRickAndMorty(_that);case _OpenQuestionnaireEvent():
return openQuestionnaire(_that);case _DefaultExceptionEvent():
return triggerDefaultExceptionPresentation(_that);case _CustomExceptionEvent():
return triggerCustomExceptionPresentation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadEvent value)?  load,TResult? Function( _OpenRickAndMortyEvent value)?  openRickAndMorty,TResult? Function( _OpenQuestionnaireEvent value)?  openQuestionnaire,TResult? Function( _DefaultExceptionEvent value)?  triggerDefaultExceptionPresentation,TResult? Function( _CustomExceptionEvent value)?  triggerCustomExceptionPresentation,}){
final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load(_that);case _OpenRickAndMortyEvent() when openRickAndMorty != null:
return openRickAndMorty(_that);case _OpenQuestionnaireEvent() when openQuestionnaire != null:
return openQuestionnaire(_that);case _DefaultExceptionEvent() when triggerDefaultExceptionPresentation != null:
return triggerDefaultExceptionPresentation(_that);case _CustomExceptionEvent() when triggerCustomExceptionPresentation != null:
return triggerCustomExceptionPresentation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  openRickAndMorty,TResult Function()?  openQuestionnaire,TResult Function()?  triggerDefaultExceptionPresentation,TResult Function()?  triggerCustomExceptionPresentation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load();case _OpenRickAndMortyEvent() when openRickAndMorty != null:
return openRickAndMorty();case _OpenQuestionnaireEvent() when openQuestionnaire != null:
return openQuestionnaire();case _DefaultExceptionEvent() when triggerDefaultExceptionPresentation != null:
return triggerDefaultExceptionPresentation();case _CustomExceptionEvent() when triggerCustomExceptionPresentation != null:
return triggerCustomExceptionPresentation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  openRickAndMorty,required TResult Function()  openQuestionnaire,required TResult Function()  triggerDefaultExceptionPresentation,required TResult Function()  triggerCustomExceptionPresentation,}) {final _that = this;
switch (_that) {
case _LoadEvent():
return load();case _OpenRickAndMortyEvent():
return openRickAndMorty();case _OpenQuestionnaireEvent():
return openQuestionnaire();case _DefaultExceptionEvent():
return triggerDefaultExceptionPresentation();case _CustomExceptionEvent():
return triggerCustomExceptionPresentation();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  openRickAndMorty,TResult? Function()?  openQuestionnaire,TResult? Function()?  triggerDefaultExceptionPresentation,TResult? Function()?  triggerCustomExceptionPresentation,}) {final _that = this;
switch (_that) {
case _LoadEvent() when load != null:
return load();case _OpenRickAndMortyEvent() when openRickAndMorty != null:
return openRickAndMorty();case _OpenQuestionnaireEvent() when openQuestionnaire != null:
return openQuestionnaire();case _DefaultExceptionEvent() when triggerDefaultExceptionPresentation != null:
return triggerDefaultExceptionPresentation();case _CustomExceptionEvent() when triggerCustomExceptionPresentation != null:
return triggerCustomExceptionPresentation();case _:
  return null;

}
}

}

/// @nodoc


class _LoadEvent implements SandboxEvent {
  const _LoadEvent();
  








@override
String toString() {
  return 'SandboxEvent.load()';
}


}




/// @nodoc


class _OpenRickAndMortyEvent implements SandboxEvent {
  const _OpenRickAndMortyEvent();
  








@override
String toString() {
  return 'SandboxEvent.openRickAndMorty()';
}


}




/// @nodoc


class _OpenQuestionnaireEvent implements SandboxEvent {
  const _OpenQuestionnaireEvent();
  








@override
String toString() {
  return 'SandboxEvent.openQuestionnaire()';
}


}




/// @nodoc


class _DefaultExceptionEvent implements SandboxEvent {
  const _DefaultExceptionEvent();
  








@override
String toString() {
  return 'SandboxEvent.triggerDefaultExceptionPresentation()';
}


}




/// @nodoc


class _CustomExceptionEvent implements SandboxEvent {
  const _CustomExceptionEvent();
  








@override
String toString() {
  return 'SandboxEvent.triggerCustomExceptionPresentation()';
}


}




/// @nodoc
mixin _$SandboxState {

 Presentation? get presentation;
/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SandboxStateCopyWith<SandboxState> get copyWith => _$SandboxStateCopyWithImpl<SandboxState>(this as SandboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SandboxState&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,presentation);

@override
String toString() {
  return 'SandboxState(presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $SandboxStateCopyWith<$Res>  {
  factory $SandboxStateCopyWith(SandboxState value, $Res Function(SandboxState) _then) = _$SandboxStateCopyWithImpl;
@useResult
$Res call({
 Presentation? presentation
});




}
/// @nodoc
class _$SandboxStateCopyWithImpl<$Res>
    implements $SandboxStateCopyWith<$Res> {
  _$SandboxStateCopyWithImpl(this._self, this._then);

  final SandboxState _self;
  final $Res Function(SandboxState) _then;

/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? presentation = freezed,}) {
  return _then(_self.copyWith(
presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}

}


/// Adds pattern-matching-related methods to [SandboxState].
extension SandboxStatePatterns on SandboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadingState value)?  loading,TResult Function( _State value)?  content,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _State() when content != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadingState value)  loading,required TResult Function( _State value)  content,}){
final _that = this;
switch (_that) {
case _LoadingState():
return loading(_that);case _State():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadingState value)?  loading,TResult? Function( _State value)?  content,}){
final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that);case _State() when content != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Presentation? presentation)?  loading,TResult Function( bool isRickAndMortyAvailable,  bool isQuestionnaireAvailable,  Presentation? presentation)?  content,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that.presentation);case _State() when content != null:
return content(_that.isRickAndMortyAvailable,_that.isQuestionnaireAvailable,_that.presentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Presentation? presentation)  loading,required TResult Function( bool isRickAndMortyAvailable,  bool isQuestionnaireAvailable,  Presentation? presentation)  content,}) {final _that = this;
switch (_that) {
case _LoadingState():
return loading(_that.presentation);case _State():
return content(_that.isRickAndMortyAvailable,_that.isQuestionnaireAvailable,_that.presentation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Presentation? presentation)?  loading,TResult? Function( bool isRickAndMortyAvailable,  bool isQuestionnaireAvailable,  Presentation? presentation)?  content,}) {final _that = this;
switch (_that) {
case _LoadingState() when loading != null:
return loading(_that.presentation);case _State() when content != null:
return content(_that.isRickAndMortyAvailable,_that.isQuestionnaireAvailable,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _LoadingState implements SandboxState {
  const _LoadingState({this.presentation});
  

@override final  Presentation? presentation;

/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingStateCopyWith<_LoadingState> get copyWith => __$LoadingStateCopyWithImpl<_LoadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,presentation);

@override
String toString() {
  return 'SandboxState.loading(presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$LoadingStateCopyWith<$Res> implements $SandboxStateCopyWith<$Res> {
  factory _$LoadingStateCopyWith(_LoadingState value, $Res Function(_LoadingState) _then) = __$LoadingStateCopyWithImpl;
@override @useResult
$Res call({
 Presentation? presentation
});




}
/// @nodoc
class __$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateCopyWith<$Res> {
  __$LoadingStateCopyWithImpl(this._self, this._then);

  final _LoadingState _self;
  final $Res Function(_LoadingState) _then;

/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? presentation = freezed,}) {
  return _then(_LoadingState(
presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}


}

/// @nodoc


class _State implements SandboxState {
  const _State({this.isRickAndMortyAvailable = false, this.isQuestionnaireAvailable = false, this.presentation});
  

@JsonKey() final  bool isRickAndMortyAvailable;
@JsonKey() final  bool isQuestionnaireAvailable;
@override final  Presentation? presentation;

/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateCopyWith<_State> get copyWith => __$StateCopyWithImpl<_State>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _State&&(identical(other.isRickAndMortyAvailable, isRickAndMortyAvailable) || other.isRickAndMortyAvailable == isRickAndMortyAvailable)&&(identical(other.isQuestionnaireAvailable, isQuestionnaireAvailable) || other.isQuestionnaireAvailable == isQuestionnaireAvailable)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,isRickAndMortyAvailable,isQuestionnaireAvailable,presentation);

@override
String toString() {
  return 'SandboxState.content(isRickAndMortyAvailable: $isRickAndMortyAvailable, isQuestionnaireAvailable: $isQuestionnaireAvailable, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$StateCopyWith<$Res> implements $SandboxStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) _then) = __$StateCopyWithImpl;
@override @useResult
$Res call({
 bool isRickAndMortyAvailable, bool isQuestionnaireAvailable, Presentation? presentation
});




}
/// @nodoc
class __$StateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(this._self, this._then);

  final _State _self;
  final $Res Function(_State) _then;

/// Create a copy of SandboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRickAndMortyAvailable = null,Object? isQuestionnaireAvailable = null,Object? presentation = freezed,}) {
  return _then(_State(
isRickAndMortyAvailable: null == isRickAndMortyAvailable ? _self.isRickAndMortyAvailable : isRickAndMortyAvailable // ignore: cast_nullable_to_non_nullable
as bool,isQuestionnaireAvailable: null == isQuestionnaireAvailable ? _self.isQuestionnaireAvailable : isQuestionnaireAvailable // ignore: cast_nullable_to_non_nullable
as bool,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}


}

// dart format on
