import 'package:npc_developer_detector/data/datasources/quiz_datasource.dart';
import 'package:npc_developer_detector/models/models.dart';

/// Repository for quiz data
/// Acts as a single source of truth and abstracts the data source
class QuizRepository {
  QuizRepository(this._dataSource);

  final QuizDataSource _dataSource;

  List<QuizQuestion> getQuestions() {
    return _dataSource.getQuestions();
  }

  QuizResult calculateResult(List<int> answers) {
    return _dataSource.calculateResult(answers);
  }

  int getTotalQuestions() {
    return getQuestions().length;
  }
}
