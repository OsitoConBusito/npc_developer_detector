import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npc_developer_detector/data/datasources/local_quiz_datasource.dart';
import 'package:npc_developer_detector/data/datasources/quiz_datasource.dart';
import 'package:npc_developer_detector/data/repositories/quiz_repository.dart';

final quizDataSourceProvider = Provider<QuizDataSource>((ref) {
  return LocalQuizDataSource();
});

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final QuizDataSource dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
});
