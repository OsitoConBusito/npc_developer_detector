import 'package:npc_developer_detector/models/models.dart';

/// Abstract DataSource for quiz data
abstract class QuizDataSource {
  List<QuizQuestion> getQuestions();
  QuizResult calculateResult(List<int> answers);
}
