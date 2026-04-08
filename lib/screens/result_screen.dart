import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';
import 'package:npc_developer_detector/router/app_router.dart';
import 'package:npc_developer_detector/viewmodels/quiz_viewmodel.dart';
import 'package:npc_developer_detector/viewmodels/result_viewmodel.dart';
import 'package:npc_developer_detector/viewmodels/states/quiz_view_state.dart';
import 'package:npc_developer_detector/widgets/story_card.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _scoreController;
  late Animation<double> _fadeAnim;
  late Animation<double> _scoreFillAnim;
  late Animation<double> _messageAnim;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: NpcDurations.dramatic,
    );

    _fadeAnim = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0, 0.4, curve: NpcCurves.standard),
    );

    _scoreController = AnimationController(
      vsync: this,
      duration: NpcDurations.scoreReveal,
    );

    _scoreFillAnim = CurvedAnimation(
      parent: _scoreController,
      curve: NpcCurves.dramatic,
    );

    _messageAnim = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.5, 1, curve: NpcCurves.standard),
    );

    _entryController.forward();
    Future.delayed(NpcDurations.slow, () {
      if (mounted) {
        _scoreController.forward();
      }
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  Future<void> _shareResult(QuizResult result) async {
    final ResultViewModel viewModel = ref.read(
      resultViewModelProvider.notifier,
    );
    final Translations t = Translations.of(context);
    await viewModel.shareResult(
      result: result,
      storyCard: StoryCard(result: result),
      shareMessage: t.share.shareMessage(score: result.score.toString()),
    );
  }

  Future<void> _openCourse() async {
    final ResultViewModel viewModel = ref.read(
      resultViewModelProvider.notifier,
    );
    await viewModel.openCourse();
  }

  @override
  Widget build(BuildContext context) {
    final QuizViewState quizState = ref.watch(quizViewModelProvider);
    final QuizViewModel viewModel = ref.read(quizViewModelProvider.notifier);
    final QuizResult? result = quizState.result;
    final Translations t = Translations.of(context);

    if (result == null) {
      return const SizedBox.shrink();
    }

    final Color tierColor = result.tier.color;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DoodleBackground(
        child: NpcPageLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              FadeTransition(
                opacity: _fadeAnim,
                child: Text(t.result.title, style: NpcTypography.bodyLarge),
              ),

              const SizedBox(height: NpcSpacing.md),

              AnimatedBuilder(
                animation: _scoreFillAnim,
                builder: (context, _) {
                  final int displayScore = (_scoreFillAnim.value * result.score)
                      .round();
                  return Text(
                    '$displayScore%',
                    style: NpcTypography.scoreDisplay.copyWith(
                      color: tierColor,
                    ),
                  );
                },
              ),

              const SizedBox(height: NpcSpacing.md),

              FadeTransition(
                opacity: _fadeAnim,
                child: Container(
                  padding: NpcSpacing.tierLabelPadding,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tierColor,
                      width: NpcSpacing.borderThick,
                    ),
                    borderRadius: BorderRadius.circular(NpcSpacing.radiusMd),
                    color: tierColor.withValues(alpha: 0.15),
                    boxShadow: NpcShadows.hard(color: tierColor.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    result.label,
                    style: NpcTypography.label.copyWith(
                      color: tierColor,
                      letterSpacing: 3,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: NpcSpacing.xxl),

              FadeTransition(
                opacity: _messageAnim,
                child: Text(
                  '"${result.message}"',
                  style: NpcTypography.bodyLarge.copyWith(
                    color: NpcColors.textPrimary,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(flex: 2),

              NpcButton(text: t.result.ctaButton, onPressed: _openCourse),

              const SizedBox(height: NpcSpacing.md),

              NpcButton(
                text: t.result.shareButton,
                variant: NpcButtonVariant.secondary,
                onPressed: () => _shareResult(result),
              ),

              const SizedBox(height: NpcSpacing.md),

              NpcButton(
                text: t.result.retryButton,
                variant: NpcButtonVariant.ghost,
                onPressed: () {
                  viewModel.restart();
                  context.go(AppRoutes.landing);
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
