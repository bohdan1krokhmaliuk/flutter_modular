// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionnaireState {

 List<Question> get questions; List<Answer> get selected; Question? get next; bool? get isCorrect;
/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnaireStateCopyWith<QuestionnaireState> get copyWith => _$QuestionnaireStateCopyWithImpl<QuestionnaireState>(this as QuestionnaireState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionnaireState&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.selected, selected)&&(identical(other.next, next) || other.next == next)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(selected),next,isCorrect);

@override
String toString() {
  return 'QuestionnaireState(questions: $questions, selected: $selected, next: $next, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $QuestionnaireStateCopyWith<$Res>  {
  factory $QuestionnaireStateCopyWith(QuestionnaireState value, $Res Function(QuestionnaireState) _then) = _$QuestionnaireStateCopyWithImpl;
@useResult
$Res call({
 List<Question> questions, List<Answer> selected, Question? next, bool? isCorrect
});


$QuestionCopyWith<$Res>? get next;

}
/// @nodoc
class _$QuestionnaireStateCopyWithImpl<$Res>
    implements $QuestionnaireStateCopyWith<$Res> {
  _$QuestionnaireStateCopyWithImpl(this._self, this._then);

  final QuestionnaireState _self;
  final $Res Function(QuestionnaireState) _then;

/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,Object? selected = null,Object? next = freezed,Object? isCorrect = freezed,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as List<Answer>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as Question?,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $QuestionCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuestionnaireState].
extension QuestionnaireStatePatterns on QuestionnaireState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _State value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _State() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _State value)  $default,){
final _that = this;
switch (_that) {
case _State():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _State value)?  $default,){
final _that = this;
switch (_that) {
case _State() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Question> questions,  List<Answer> selected,  Question? next,  bool? isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _State() when $default != null:
return $default(_that.questions,_that.selected,_that.next,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Question> questions,  List<Answer> selected,  Question? next,  bool? isCorrect)  $default,) {final _that = this;
switch (_that) {
case _State():
return $default(_that.questions,_that.selected,_that.next,_that.isCorrect);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Question> questions,  List<Answer> selected,  Question? next,  bool? isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _State() when $default != null:
return $default(_that.questions,_that.selected,_that.next,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc


class _State implements QuestionnaireState {
  const _State({final  List<Question> questions = const [], final  List<Answer> selected = const [], this.next, this.isCorrect}): _questions = questions,_selected = selected;
  

 final  List<Question> _questions;
@override@JsonKey() List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<Answer> _selected;
@override@JsonKey() List<Answer> get selected {
  if (_selected is EqualUnmodifiableListView) return _selected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selected);
}

@override final  Question? next;
@override final  bool? isCorrect;

/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateCopyWith<_State> get copyWith => __$StateCopyWithImpl<_State>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _State&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._selected, _selected)&&(identical(other.next, next) || other.next == next)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_selected),next,isCorrect);

@override
String toString() {
  return 'QuestionnaireState(questions: $questions, selected: $selected, next: $next, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$StateCopyWith<$Res> implements $QuestionnaireStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) _then) = __$StateCopyWithImpl;
@override @useResult
$Res call({
 List<Question> questions, List<Answer> selected, Question? next, bool? isCorrect
});


@override $QuestionCopyWith<$Res>? get next;

}
/// @nodoc
class __$StateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(this._self, this._then);

  final _State _self;
  final $Res Function(_State) _then;

/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? selected = null,Object? next = freezed,Object? isCorrect = freezed,}) {
  return _then(_State(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,selected: null == selected ? _self._selected : selected // ignore: cast_nullable_to_non_nullable
as List<Answer>,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as Question?,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of QuestionnaireState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res>? get next {
    if (_self.next == null) {
    return null;
  }

  return $QuestionCopyWith<$Res>(_self.next!, (value) {
    return _then(_self.copyWith(next: value));
  });
}
}

// dart format on
