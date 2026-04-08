import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npc_developer_detector/data/providers/repository_providers.dart';
import 'package:npc_developer_detector/data/repositories/quiz_repository.dart';
import 'package:npc_developer_detector/models/models.dart';

/// Quiz ViewModel State
class QuizViewState {
  const QuizViewState({
    this.currentQuestion = 0,
    this.answers = const [],
    this.result,
    this.isLoading = false,
    this.totalQuestions = 6,
  });

  final int currentQuestion;
  final List<int> answers;
  final QuizResult? result;
  final bool isLoading;
  final int totalQuestions;
  double get progress => (currentQuestion + 1) / totalQuestions;
  bool get hasAnsweredCurrent => currentQuestion < answers.length;
  bool get isLastQuestion => currentQuestion >= totalQuestions - 1;

  QuizViewState copyWith({
    int? currentQuestion,
    List<int>? answers,
    QuizResult? result,
    bool? isLoading,
    int? totalQuestions,
  }) {
    return QuizViewState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      answers: answers ?? this.answers,
      result: result ?? this.result,
      isLoading: isLoading ?? this.isLoading,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }
}

/// Quiz ViewModel
class QuizViewModel extends StateNotifier<QuizViewState> {
  QuizViewModel(this._repository)
    : super(QuizViewState(totalQuestions: _repository.getTotalQuestions()));

  final QuizRepository _repository;

  void startQuiz() {
    state = QuizViewState(totalQuestions: _repository.getTotalQuestions());
  }

  void selectAnswer(int optionIndex) {
    final newAnswers = List<int>.from(state.answers);
    if (state.currentQuestion < newAnswers.length) {
      newAnswers[state.currentQuestion] = optionIndex;
    } else {
      newAnswers.add(optionIndex);
    }
    state = state.copyWith(answers: newAnswers);
  }

  void nextQuestion() {
    if (!state.hasAnsweredCurrent) {
      return;
    }

    if (state.isLastQuestion) {
      final result = _repository.calculateResult(state.answers);
      state = state.copyWith(result: result);
    } else {
      state = state.copyWith(currentQuestion: state.currentQuestion + 1);
    }
  }

  void restart() {
    state = QuizViewState(totalQuestions: _repository.getTotalQuestions());
  }

  List<QuizQuestion> getQuestions() => _repository.getQuestions();
}

/// Quiz ViewModel Provider
final quizViewModelProvider =
    StateNotifierProvider<QuizViewModel, QuizViewState>((ref) {
      final repository = ref.watch(quizRepositoryProvider);
      return QuizViewModel(repository);
    });
