import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npc_developer_detector/models/models.dart';

part 'quiz_view_state.freezed.dart';

@freezed
abstract class QuizViewState with _$QuizViewState {
  const factory QuizViewState({
    @Default(0) int currentQuestion,
    @Default([]) List<int> answers,
    QuizResult? result,
    @Default(false) bool isLoading,
    @Default(6) int totalQuestions,
  }) = _QuizViewState;

  const QuizViewState._();

  double get progress => (currentQuestion + 1) / totalQuestions;
  bool get hasAnsweredCurrent => currentQuestion < answers.length;
  bool get isLastQuestion => currentQuestion >= totalQuestions - 1;
}
