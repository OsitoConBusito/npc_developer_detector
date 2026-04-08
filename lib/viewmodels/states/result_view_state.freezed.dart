// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultViewState {

 bool get isSharing; String? get error;
/// Create a copy of ResultViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultViewStateCopyWith<ResultViewState> get copyWith => _$ResultViewStateCopyWithImpl<ResultViewState>(this as ResultViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultViewState&&(identical(other.isSharing, isSharing) || other.isSharing == isSharing)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSharing,error);

@override
String toString() {
  return 'ResultViewState(isSharing: $isSharing, error: $error)';
}


}

/// @nodoc
abstract mixin class $ResultViewStateCopyWith<$Res>  {
  factory $ResultViewStateCopyWith(ResultViewState value, $Res Function(ResultViewState) _then) = _$ResultViewStateCopyWithImpl;
@useResult
$Res call({
 bool isSharing, String? error
});




}
/// @nodoc
class _$ResultViewStateCopyWithImpl<$Res>
    implements $ResultViewStateCopyWith<$Res> {
  _$ResultViewStateCopyWithImpl(this._self, this._then);

  final ResultViewState _self;
  final $Res Function(ResultViewState) _then;

/// Create a copy of ResultViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSharing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isSharing: null == isSharing ? _self.isSharing : isSharing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultViewState].
extension ResultViewStatePatterns on ResultViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultViewState value)  $default,){
final _that = this;
switch (_that) {
case _ResultViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ResultViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSharing,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultViewState() when $default != null:
return $default(_that.isSharing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSharing,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ResultViewState():
return $default(_that.isSharing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSharing,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ResultViewState() when $default != null:
return $default(_that.isSharing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ResultViewState implements ResultViewState {
  const _ResultViewState({this.isSharing = false, this.error});
  

@override@JsonKey() final  bool isSharing;
@override final  String? error;

/// Create a copy of ResultViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultViewStateCopyWith<_ResultViewState> get copyWith => __$ResultViewStateCopyWithImpl<_ResultViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultViewState&&(identical(other.isSharing, isSharing) || other.isSharing == isSharing)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSharing,error);

@override
String toString() {
  return 'ResultViewState(isSharing: $isSharing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ResultViewStateCopyWith<$Res> implements $ResultViewStateCopyWith<$Res> {
  factory _$ResultViewStateCopyWith(_ResultViewState value, $Res Function(_ResultViewState) _then) = __$ResultViewStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSharing, String? error
});




}
/// @nodoc
class __$ResultViewStateCopyWithImpl<$Res>
    implements _$ResultViewStateCopyWith<$Res> {
  __$ResultViewStateCopyWithImpl(this._self, this._then);

  final _ResultViewState _self;
  final $Res Function(_ResultViewState) _then;

/// Create a copy of ResultViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSharing = null,Object? error = freezed,}) {
  return _then(_ResultViewState(
isSharing: null == isSharing ? _self.isSharing : isSharing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
