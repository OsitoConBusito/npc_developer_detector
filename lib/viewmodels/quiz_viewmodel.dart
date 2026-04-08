import 'package:npc_developer_detector/data/providers/repository_providers.dart';
import 'package:npc_developer_detector/data/repositories/quiz_repository.dart';
import 'package:npc_developer_detector/models/models.dart';
import 'package:npc_developer_detector/viewmodels/states/quiz_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_viewmodel.g.dart';

@riverpod
class QuizViewModel extends _$QuizViewModel {
  @override
  QuizViewState build() {
    final QuizRepository repository = ref.watch(quizRepositoryProvider);
    return QuizViewState(totalQuestions: repository.getTotalQuestions());
  }

  QuizRepository get _repository => ref.read(quizRepositoryProvider);

  void startQuiz() {
    state = QuizViewState(totalQuestions: _repository.getTotalQuestions());
  }

  void selectAnswer(int optionIndex) {
    final List<int> newAnswers = List<int>.from(state.answers);
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
      final QuizResult result = _repository.calculateResult(state.answers);
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
