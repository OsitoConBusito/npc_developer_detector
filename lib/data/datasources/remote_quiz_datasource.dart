import 'package:npc_developer_detector/data/datasources/quiz_datasource.dart';
import 'package:npc_developer_detector/models/models.dart';

/// Remote API implementation of QuizDataSource
/// Template for future API integration
class RemoteQuizDataSource implements QuizDataSource {
  @override
  List<QuizQuestion> getQuestions() {
    throw UnimplementedError('Remote data source not implemented yet');
  }

  @override
  QuizResult calculateResult(List<int> answers) {
    throw UnimplementedError('Remote data source not implemented yet');
  }
}
