import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npc_developer_detector/data/datasources/local_quiz_datasource.dart';
import 'package:npc_developer_detector/data/datasources/quiz_datasource.dart';
import 'package:npc_developer_detector/data/repositories/quiz_repository.dart';

/// Provider for QuizDataSource
final quizDataSourceProvider = Provider<QuizDataSource>((ref) {
  return LocalQuizDataSource();
});

/// Provider for QuizRepository
final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final dataSource = ref.watch(quizDataSourceProvider);
  return QuizRepository(dataSource);
});
