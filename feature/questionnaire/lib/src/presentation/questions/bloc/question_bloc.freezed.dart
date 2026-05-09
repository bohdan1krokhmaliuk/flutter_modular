// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionEvent {







@override
String toString() {
  return 'QuestionEvent()';
}


}




/// Adds pattern-matching-related methods to [QuestionEvent].
extension QuestionEventPatterns on QuestionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SelectEvent value)?  select,TResult Function( _NextEvent value)?  next,TResult Function( _SubmitEvent value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectEvent() when select != null:
return select(_that);case _NextEvent() when next != null:
return next(_that);case _SubmitEvent() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SelectEvent value)  select,required TResult Function( _NextEvent value)  next,required TResult Function( _SubmitEvent value)  submit,}){
final _that = this;
switch (_that) {
case _SelectEvent():
return select(_that);case _NextEvent():
return next(_that);case _SubmitEvent():
return submit(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SelectEvent value)?  select,TResult? Function( _NextEvent value)?  next,TResult? Function( _SubmitEvent value)?  submit,}){
final _that = this;
switch (_that) {
case _SelectEvent() when select != null:
return select(_that);case _NextEvent() when next != null:
return next(_that);case _SubmitEvent() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Answer answer)?  select,TResult Function()?  next,TResult Function()?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectEvent() when select != null:
return select(_that.answer);case _NextEvent() when next != null:
return next();case _SubmitEvent() when submit != null:
return submit();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Answer answer)  select,required TResult Function()  next,required TResult Function()  submit,}) {final _that = this;
switch (_that) {
case _SelectEvent():
return select(_that.answer);case _NextEvent():
return next();case _SubmitEvent():
return submit();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Answer answer)?  select,TResult? Function()?  next,TResult? Function()?  submit,}) {final _that = this;
switch (_that) {
case _SelectEvent() when select != null:
return select(_that.answer);case _NextEvent() when next != null:
return next();case _SubmitEvent() when submit != null:
return submit();case _:
  return null;

}
}

}

/// @nodoc


class _SelectEvent implements QuestionEvent {
  const _SelectEvent(this.answer);
  

 final  Answer answer;






@override
String toString() {
  return 'QuestionEvent.select(answer: $answer)';
}


}




/// @nodoc


class _NextEvent implements QuestionEvent {
  const _NextEvent();
  








@override
String toString() {
  return 'QuestionEvent.next()';
}


}




/// @nodoc


class _SubmitEvent implements QuestionEvent {
  const _SubmitEvent();
  








@override
String toString() {
  return 'QuestionEvent.submit()';
}


}




/// @nodoc
mixin _$QuestionState {

 Question get question; Answer? get selected; Presentation? get presentation;
/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionStateCopyWith<QuestionState> get copyWith => _$QuestionStateCopyWithImpl<QuestionState>(this as QuestionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionState&&(identical(other.question, question) || other.question == question)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,question,selected,presentation);

@override
String toString() {
  return 'QuestionState(question: $question, selected: $selected, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class $QuestionStateCopyWith<$Res>  {
  factory $QuestionStateCopyWith(QuestionState value, $Res Function(QuestionState) _then) = _$QuestionStateCopyWithImpl;
@useResult
$Res call({
 Question question, Answer? selected, Presentation? presentation
});


$QuestionCopyWith<$Res> get question;$AnswerCopyWith<$Res>? get selected;

}
/// @nodoc
class _$QuestionStateCopyWithImpl<$Res>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._self, this._then);

  final QuestionState _self;
  final $Res Function(QuestionState) _then;

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? selected = freezed,Object? presentation = freezed,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Answer?,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}
/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnswerCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $AnswerCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuestionState].
extension QuestionStatePatterns on QuestionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionState value)  $default,){
final _that = this;
switch (_that) {
case _QuestionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Question question,  Answer? selected,  Presentation? presentation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
return $default(_that.question,_that.selected,_that.presentation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Question question,  Answer? selected,  Presentation? presentation)  $default,) {final _that = this;
switch (_that) {
case _QuestionState():
return $default(_that.question,_that.selected,_that.presentation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Question question,  Answer? selected,  Presentation? presentation)?  $default,) {final _that = this;
switch (_that) {
case _QuestionState() when $default != null:
return $default(_that.question,_that.selected,_that.presentation);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionState implements QuestionState {
  const _QuestionState({required this.question, this.selected, this.presentation});
  

@override final  Question question;
@override final  Answer? selected;
@override final  Presentation? presentation;

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionStateCopyWith<_QuestionState> get copyWith => __$QuestionStateCopyWithImpl<_QuestionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionState&&(identical(other.question, question) || other.question == question)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.presentation, presentation) || other.presentation == presentation));
}


@override
int get hashCode => Object.hash(runtimeType,question,selected,presentation);

@override
String toString() {
  return 'QuestionState(question: $question, selected: $selected, presentation: $presentation)';
}


}

/// @nodoc
abstract mixin class _$QuestionStateCopyWith<$Res> implements $QuestionStateCopyWith<$Res> {
  factory _$QuestionStateCopyWith(_QuestionState value, $Res Function(_QuestionState) _then) = __$QuestionStateCopyWithImpl;
@override @useResult
$Res call({
 Question question, Answer? selected, Presentation? presentation
});


@override $QuestionCopyWith<$Res> get question;@override $AnswerCopyWith<$Res>? get selected;

}
/// @nodoc
class __$QuestionStateCopyWithImpl<$Res>
    implements _$QuestionStateCopyWith<$Res> {
  __$QuestionStateCopyWithImpl(this._self, this._then);

  final _QuestionState _self;
  final $Res Function(_QuestionState) _then;

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? selected = freezed,Object? presentation = freezed,}) {
  return _then(_QuestionState(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Answer?,presentation: freezed == presentation ? _self.presentation : presentation // ignore: cast_nullable_to_non_nullable
as Presentation?,
  ));
}

/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of QuestionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnswerCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $AnswerCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
