import 'package:npc_developer_detector/models/models.dart';

abstract class QuizDataSource {
  List<QuizQuestion> getQuestions();
  QuizResult calculateResult(List<int> answers);
}
