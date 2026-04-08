// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizViewState {

 int get currentQuestion; List<int> get answers; QuizResult? get result; bool get isLoading; int get totalQuestions;
/// Create a copy of QuizViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizViewStateCopyWith<QuizViewState> get copyWith => _$QuizViewStateCopyWithImpl<QuizViewState>(this as QuizViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizViewState&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.result, result) || other.result == result)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,currentQuestion,const DeepCollectionEquality().hash(answers),result,isLoading,totalQuestions);

@override
String toString() {
  return 'QuizViewState(currentQuestion: $currentQuestion, answers: $answers, result: $result, isLoading: $isLoading, totalQuestions: $totalQuestions)';
}


}

/// @nodoc
abstract mixin class $QuizViewStateCopyWith<$Res>  {
  factory $QuizViewStateCopyWith(QuizViewState value, $Res Function(QuizViewState) _then) = _$QuizViewStateCopyWithImpl;
@useResult
$Res call({
 int currentQuestion, List<int> answers, QuizResult? result, bool isLoading, int totalQuestions
});




}
/// @nodoc
class _$QuizViewStateCopyWithImpl<$Res>
    implements $QuizViewStateCopyWith<$Res> {
  _$QuizViewStateCopyWithImpl(this._self, this._then);

  final QuizViewState _self;
  final $Res Function(QuizViewState) _then;

/// Create a copy of QuizViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentQuestion = null,Object? answers = null,Object? result = freezed,Object? isLoading = null,Object? totalQuestions = null,}) {
  return _then(_self.copyWith(
currentQuestion: null == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizViewState].
extension QuizViewStatePatterns on QuizViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizViewState value)  $default,){
final _that = this;
switch (_that) {
case _QuizViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizViewState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentQuestion,  List<int> answers,  QuizResult? result,  bool isLoading,  int totalQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizViewState() when $default != null:
return $default(_that.currentQuestion,_that.answers,_that.result,_that.isLoading,_that.totalQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentQuestion,  List<int> answers,  QuizResult? result,  bool isLoading,  int totalQuestions)  $default,) {final _that = this;
switch (_that) {
case _QuizViewState():
return $default(_that.currentQuestion,_that.answers,_that.result,_that.isLoading,_that.totalQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentQuestion,  List<int> answers,  QuizResult? result,  bool isLoading,  int totalQuestions)?  $default,) {final _that = this;
switch (_that) {
case _QuizViewState() when $default != null:
return $default(_that.currentQuestion,_that.answers,_that.result,_that.isLoading,_that.totalQuestions);case _:
  return null;

}
}

}

/// @nodoc


class _QuizViewState extends QuizViewState {
  const _QuizViewState({this.currentQuestion = 0, final  List<int> answers = const [], this.result, this.isLoading = false, this.totalQuestions = 6}): _answers = answers,super._();
  

@override@JsonKey() final  int currentQuestion;
 final  List<int> _answers;
@override@JsonKey() List<int> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  QuizResult? result;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int totalQuestions;

/// Create a copy of QuizViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizViewStateCopyWith<_QuizViewState> get copyWith => __$QuizViewStateCopyWithImpl<_QuizViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizViewState&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.result, result) || other.result == result)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,currentQuestion,const DeepCollectionEquality().hash(_answers),result,isLoading,totalQuestions);

@override
String toString() {
  return 'QuizViewState(currentQuestion: $currentQuestion, answers: $answers, result: $result, isLoading: $isLoading, totalQuestions: $totalQuestions)';
}


}

/// @nodoc
abstract mixin class _$QuizViewStateCopyWith<$Res> implements $QuizViewStateCopyWith<$Res> {
  factory _$QuizViewStateCopyWith(_QuizViewState value, $Res Function(_QuizViewState) _then) = __$QuizViewStateCopyWithImpl;
@override @useResult
$Res call({
 int currentQuestion, List<int> answers, QuizResult? result, bool isLoading, int totalQuestions
});




}
/// @nodoc
class __$QuizViewStateCopyWithImpl<$Res>
    implements _$QuizViewStateCopyWith<$Res> {
  __$QuizViewStateCopyWithImpl(this._self, this._then);

  final _QuizViewState _self;
  final $Res Function(_QuizViewState) _then;

/// Create a copy of QuizViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentQuestion = null,Object? answers = null,Object? result = freezed,Object? isLoading = null,Object? totalQuestions = null,}) {
  return _then(_QuizViewState(
currentQuestion: null == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
