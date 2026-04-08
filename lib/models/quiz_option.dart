import 'package:npc_developer_detector/models/answer_type.dart';

class QuizOption {
  const QuizOption({
    required this.getText,
    required this.type,
    required this.weight,
  });

  final String Function() getText;
  final AnswerType type;
  final int weight;
}
