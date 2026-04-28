// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Character {

 int get id; String get name;@JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown) Status get status; String get species;@JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown) Gender get gender; String get image; ShortLocation get origin; ShortLocation get location;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,gender,image,origin,location);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image, origin: $origin, location: $location)';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown) Status status, String species,@JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown) Gender gender, String image, ShortLocation origin, ShortLocation location
});


$ShortLocationCopyWith<$Res> get origin;$ShortLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? gender = null,Object? image = null,Object? origin = null,Object? location = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as ShortLocation,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ShortLocation,
  ));
}
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortLocationCopyWith<$Res> get origin {
  
  return $ShortLocationCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortLocationCopyWith<$Res> get location {
  
  return $ShortLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Character value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Character value)  $default,){
final _that = this;
switch (_that) {
case _Character():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Character value)?  $default,){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown)  Status status,  String species, @JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown)  Gender gender,  String image,  ShortLocation origin,  ShortLocation location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.gender,_that.image,_that.origin,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown)  Status status,  String species, @JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown)  Gender gender,  String image,  ShortLocation origin,  ShortLocation location)  $default,) {final _that = this;
switch (_that) {
case _Character():
return $default(_that.id,_that.name,_that.status,_that.species,_that.gender,_that.image,_that.origin,_that.location);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown)  Status status,  String species, @JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown)  Gender gender,  String image,  ShortLocation origin,  ShortLocation location)?  $default,) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.gender,_that.image,_that.origin,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _Character implements Character {
  const _Character({required this.id, required this.name, @JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown) required this.status, required this.species, @JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown) required this.gender, required this.image, required this.origin, required this.location});
  factory _Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown) final  Status status;
@override final  String species;
@override@JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown) final  Gender gender;
@override final  String image;
@override final  ShortLocation origin;
@override final  ShortLocation location;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,gender,image,origin,location);

@override
String toString() {
  return 'Character(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image, origin: $origin, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(defaultValue: Status.unknown, unknownEnumValue: Status.unknown) Status status, String species,@JsonKey(defaultValue: Gender.unknown, unknownEnumValue: Gender.unknown) Gender gender, String image, ShortLocation origin, ShortLocation location
});


@override $ShortLocationCopyWith<$Res> get origin;@override $ShortLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? gender = null,Object? image = null,Object? origin = null,Object? location = null,}) {
  return _then(_Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as ShortLocation,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ShortLocation,
  ));
}

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortLocationCopyWith<$Res> get origin {
  
  return $ShortLocationCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortLocationCopyWith<$Res> get location {
  
  return $ShortLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$ShortLocation {

 String get name;@UriToIdConverter()@JsonKey(name: 'url') int? get id;
/// Create a copy of ShortLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortLocationCopyWith<ShortLocation> get copyWith => _$ShortLocationCopyWithImpl<ShortLocation>(this as ShortLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'ShortLocation(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $ShortLocationCopyWith<$Res>  {
  factory $ShortLocationCopyWith(ShortLocation value, $Res Function(ShortLocation) _then) = _$ShortLocationCopyWithImpl;
@useResult
$Res call({
 String name,@UriToIdConverter()@JsonKey(name: 'url') int? id
});




}
/// @nodoc
class _$ShortLocationCopyWithImpl<$Res>
    implements $ShortLocationCopyWith<$Res> {
  _$ShortLocationCopyWithImpl(this._self, this._then);

  final ShortLocation _self;
  final $Res Function(ShortLocation) _then;

/// Create a copy of ShortLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShortLocation].
extension ShortLocationPatterns on ShortLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShortLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShortLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShortLocation value)  $default,){
final _that = this;
switch (_that) {
case _ShortLocation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShortLocation value)?  $default,){
final _that = this;
switch (_that) {
case _ShortLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @UriToIdConverter()@JsonKey(name: 'url')  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShortLocation() when $default != null:
return $default(_that.name,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @UriToIdConverter()@JsonKey(name: 'url')  int? id)  $default,) {final _that = this;
switch (_that) {
case _ShortLocation():
return $default(_that.name,_that.id);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @UriToIdConverter()@JsonKey(name: 'url')  int? id)?  $default,) {final _that = this;
switch (_that) {
case _ShortLocation() when $default != null:
return $default(_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _ShortLocation implements ShortLocation {
  const _ShortLocation({required this.name, @UriToIdConverter()@JsonKey(name: 'url') this.id});
  factory _ShortLocation.fromJson(Map<String, dynamic> json) => _$ShortLocationFromJson(json);

@override final  String name;
@override@UriToIdConverter()@JsonKey(name: 'url') final  int? id;

/// Create a copy of ShortLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortLocationCopyWith<_ShortLocation> get copyWith => __$ShortLocationCopyWithImpl<_ShortLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShortLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id);

@override
String toString() {
  return 'ShortLocation(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ShortLocationCopyWith<$Res> implements $ShortLocationCopyWith<$Res> {
  factory _$ShortLocationCopyWith(_ShortLocation value, $Res Function(_ShortLocation) _then) = __$ShortLocationCopyWithImpl;
@override @useResult
$Res call({
 String name,@UriToIdConverter()@JsonKey(name: 'url') int? id
});




}
/// @nodoc
class __$ShortLocationCopyWithImpl<$Res>
    implements _$ShortLocationCopyWith<$Res> {
  __$ShortLocationCopyWithImpl(this._self, this._then);

  final _ShortLocation _self;
  final $Res Function(_ShortLocation) _then;

/// Create a copy of ShortLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = freezed,}) {
  return _then(_ShortLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
