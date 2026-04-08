import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/router/app_router.dart';
import 'package:npc_developer_detector/viewmodels/quiz_viewmodel.dart';

class QuizScreenView extends ConsumerStatefulWidget {
  const QuizScreenView({super.key});

  @override
  ConsumerState<QuizScreenView> createState() => _QuizScreenViewState();
}

class _QuizScreenViewState extends ConsumerState<QuizScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController _transitionController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  int _displayedQuestion = 0;

  @override
  void initState() {
    super.initState();
    _transitionController = AnimationController(
      vsync: this,
      duration: NpcDurations.slow,
    );
    _fadeAnim = CurvedAnimation(
      parent: _transitionController,
      curve: NpcCurves.standard,
    );
    _slideAnim = Tween<Offset>(begin: const Offset(NpcCurves.slideOffsetHorizontalSm, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _transitionController,
            curve: NpcCurves.standard,
          ),
        );
    _transitionController.forward();
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  void _animateToNextQuestion(int nextIndex) {
    _transitionController.reverse().then((_) {
      setState(() => _displayedQuestion = nextIndex);
      _transitionController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizViewModelProvider);
    final viewModel = ref.read(quizViewModelProvider.notifier);
    final questions = viewModel.getQuestions();
    final t = Translations.of(context);

    // Animate when question changes
    if (_displayedQuestion != quizState.currentQuestion) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _animateToNextQuestion(quizState.currentQuestion);
      });
    }

    final question = questions[_displayedQuestion];
    final labels = ['a', 'b', 'c', 'd'];
    final selectedIndex = _displayedQuestion < quizState.answers.length
        ? quizState.answers[_displayedQuestion]
        : -1;

    return MatrixBackground(
      child: NpcPageLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(height: NpcSpacing.md),

              // Progress bar
              AnimatedProgressBar(progress: quizState.progress),

              const SizedBox(height: NpcSpacing.sm),

              // Question counter
              Text(
                t.quiz.questionOf(
                  current: (quizState.currentQuestion + 1).toString(),
                  total: quizState.totalQuestions.toString(),
                ),
                style: NpcTypography.label,
              ),

              const SizedBox(height: NpcSpacing.xxl),

              // Question title
              FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Text(
                    question.getTitle(),
                    style: NpcTypography.displayMedium,
                  ),
                ),
              ),

              const SizedBox(height: NpcSpacing.xl),

              // Options
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: ListView.separated(
                      itemCount: question.options.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: NpcSpacing.sm),
                      itemBuilder: (context, index) {
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: NpcDurations.staggerBase + NpcDurations.staggerStep * index,
                          curve: NpcCurves.standard,
                          builder: (context, value, child) => Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, NpcCurves.slideDistanceSm * (1 - value)),
                              child: child,
                            ),
                          ),
                          child: OptionCard(
                            text: question.options[index].getText(),
                            label: labels[index],
                            isSelected: selectedIndex == index,
                            index: index,
                            onTap: () => viewModel.selectAnswer(index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: NpcSpacing.md),

              // Next / Show Result button
              AnimatedOpacity(
                duration: NpcDurations.normal,
                opacity: quizState.hasAnsweredCurrent ? 1.0 : 0.3,
                child: NpcButton(
                  text: quizState.isLastQuestion
                      ? t.quiz.showResult
                      : t.quiz.nextButton,
                  onPressed: quizState.hasAnsweredCurrent
                      ? () {
                          viewModel.nextQuestion();
                          if (quizState.isLastQuestion) {
                            context.go(AppRoutes.result);
                          }
                        }
                      : () {},
                ),
              ),

            const SizedBox(height: NpcSpacing.lg),
          ],
        ),
      ),
    );
  }
}
