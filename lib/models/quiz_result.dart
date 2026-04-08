import 'package:npc_developer_detector/models/result_tier.dart';

class QuizResult {
  const QuizResult({
    required this.score,
    required this.tier,
    required this.label,
    required this.message,
  });

  final int score;
  final ResultTier tier;
  final String label;
  final String message;
}
