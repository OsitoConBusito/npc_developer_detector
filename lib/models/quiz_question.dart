import 'package:npc_developer_detector/models/quiz_option.dart';

class QuizQuestion {
  const QuizQuestion({required this.getTitle, required this.options});

  final String Function() getTitle;
  final List<QuizOption> options;
}
