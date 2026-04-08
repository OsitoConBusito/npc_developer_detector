part of 'models.dart';

enum AnswerType { npc, builder }

enum ResultTier { npc, borderline, dangerous }

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

class QuizQuestion {
  const QuizQuestion({required this.getTitle, required this.options});

  final String Function() getTitle;
  final List<QuizOption> options;
}

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

ResultTier getTierFromScore(int score) {
  if (score >= 61) {
    return ResultTier.npc;
  }
  if (score >= 31) {
    return ResultTier.borderline;
  }
  return ResultTier.dangerous;
}
