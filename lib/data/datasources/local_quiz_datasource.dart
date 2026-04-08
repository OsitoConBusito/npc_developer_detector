import 'dart:math';

import 'package:npc_developer_detector/data/datasources/quiz_datasource.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';

class LocalQuizDataSource implements QuizDataSource {
  @override
  List<QuizQuestion> getQuestions() {
    return [
      QuizQuestion(
        getTitle: () => t.quiz.q1.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q1.a,
            type: AnswerType.npc,
            weight: 20,
          ),
          QuizOption(
            getText: () => t.quiz.q1.b,
            type: AnswerType.npc,
            weight: 20,
          ),
          QuizOption(
            getText: () => t.quiz.q1.c,
            type: AnswerType.builder,
            weight: -20,
          ),
          QuizOption(
            getText: () => t.quiz.q1.d,
            type: AnswerType.npc,
            weight: 10,
          ),
        ],
      ),
      QuizQuestion(
        getTitle: () => t.quiz.q2.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q2.a,
            type: AnswerType.npc,
            weight: 20,
          ),
          QuizOption(
            getText: () => t.quiz.q2.b,
            type: AnswerType.npc,
            weight: 15,
          ),
          QuizOption(
            getText: () => t.quiz.q2.c,
            type: AnswerType.builder,
            weight: -20,
          ),
          QuizOption(
            getText: () => t.quiz.q2.d,
            type: AnswerType.npc,
            weight: 20,
          ),
        ],
      ),
      QuizQuestion(
        getTitle: () => t.quiz.q3.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q3.a,
            type: AnswerType.npc,
            weight: 20,
          ),
          QuizOption(
            getText: () => t.quiz.q3.b,
            type: AnswerType.builder,
            weight: -15,
          ),
          QuizOption(
            getText: () => t.quiz.q3.c,
            type: AnswerType.npc,
            weight: 15,
          ),
          QuizOption(
            getText: () => t.quiz.q3.d,
            type: AnswerType.builder,
            weight: -10,
          ),
        ],
      ),
      QuizQuestion(
        getTitle: () => t.quiz.q4.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q4.a,
            type: AnswerType.npc,
            weight: 15,
          ),
          QuizOption(
            getText: () => t.quiz.q4.b,
            type: AnswerType.npc,
            weight: 10,
          ),
          QuizOption(
            getText: () => t.quiz.q4.c,
            type: AnswerType.builder,
            weight: -20,
          ),
          QuizOption(
            getText: () => t.quiz.q4.d,
            type: AnswerType.npc,
            weight: 20,
          ),
        ],
      ),
      QuizQuestion(
        getTitle: () => t.quiz.q5.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q5.a,
            type: AnswerType.npc,
            weight: 10,
          ),
          QuizOption(
            getText: () => t.quiz.q5.b,
            type: AnswerType.npc,
            weight: 15,
          ),
          QuizOption(
            getText: () => t.quiz.q5.c,
            type: AnswerType.builder,
            weight: -20,
          ),
          QuizOption(
            getText: () => t.quiz.q5.d,
            type: AnswerType.npc,
            weight: 20,
          ),
        ],
      ),
      QuizQuestion(
        getTitle: () => t.quiz.q6.title,
        options: [
          QuizOption(
            getText: () => t.quiz.q6.a,
            type: AnswerType.npc,
            weight: 20,
          ),
          QuizOption(
            getText: () => t.quiz.q6.b,
            type: AnswerType.npc,
            weight: 15,
          ),
          QuizOption(
            getText: () => t.quiz.q6.c,
            type: AnswerType.builder,
            weight: -20,
          ),
          QuizOption(
            getText: () => t.quiz.q6.d,
            type: AnswerType.npc,
            weight: 10,
          ),
        ],
      ),
    ];
  }

  @override
  QuizResult calculateResult(List<int> answers) {
    final List<QuizQuestion> questions = getQuestions();
    // Start at midpoint
    int rawScore = 50;

    for (int i = 0; i < answers.length; i++) {
      if (i < questions.length && answers[i] < questions[i].options.length) {
        rawScore += questions[i].options[answers[i]].weight;
      }
    }

    final int score = rawScore.clamp(0, 100);
    final ResultTier tier = ResultTier.fromScore(score);
    final Random random = Random();

    String label;
    String message;
    switch (tier) {
      case ResultTier.npc:
        label = t.result.tierNpc.label;
        final List<String> msgs = t.result.tierNpc.messages;
        message = msgs[random.nextInt(msgs.length)];
      case ResultTier.borderline:
        label = t.result.tierBorderline.label;
        final List<String> borderlineMsgs = t.result.tierBorderline.messages;
        message = borderlineMsgs[random.nextInt(borderlineMsgs.length)];
      case ResultTier.dangerous:
        label = t.result.tierDangerous.label;
        final List<String> dangerousMsgs = t.result.tierDangerous.messages;
        message = dangerousMsgs[random.nextInt(dangerousMsgs.length)];
    }

    return QuizResult(score: score, tier: tier, label: label, message: message);
  }
}
