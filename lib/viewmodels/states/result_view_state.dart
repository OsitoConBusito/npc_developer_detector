import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_view_state.freezed.dart';

@freezed
abstract class ResultViewState with _$ResultViewState {
  const factory ResultViewState({
    @Default(false) bool isSharing,
    String? error,
  }) = _ResultViewState;
}
