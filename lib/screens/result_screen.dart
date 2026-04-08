import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';
import 'package:npc_developer_detector/router/app_router.dart';
import 'package:npc_developer_detector/viewmodels/quiz_viewmodel.dart';
import 'package:npc_developer_detector/viewmodels/result_viewmodel.dart';
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

  Color _tierColor(ResultTier tier) {
    switch (tier) {
      case ResultTier.npc:
        return NpcColors.npcRed;
      case ResultTier.borderline:
        return NpcColors.borderlineYellow;
      case ResultTier.dangerous:
        return NpcColors.dangerousGreen;
    }
  }

  List<BoxShadow> _tierGlow(ResultTier tier) {
    switch (tier) {
      case ResultTier.npc:
        return NpcShadows.glowRed();
      case ResultTier.borderline:
        return NpcShadows.glowYellow();
      case ResultTier.dangerous:
        return NpcShadows.glowGreen();
    }
  }

  Future<void> _shareResult(QuizResult result) async {
    final viewModel = ref.read(resultViewModelProvider.notifier);
    await viewModel.shareResult(
      result: result,
      storyCard: StoryCard(result: result),
      context: context,
    );
  }

  Future<void> _openCourse() async {
    final viewModel = ref.read(resultViewModelProvider.notifier);
    await viewModel.openCourse();
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizViewModelProvider);
    final viewModel = ref.read(quizViewModelProvider.notifier);
    final result = quizState.result;
    final t = Translations.of(context);

    if (result == null) {
      return const SizedBox.shrink();
    }

    final tierColor = _tierColor(result.tier);
    final tierGlow = _tierGlow(result.tier);

    return MatrixBackground(
      child: NpcPageLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Spacer(flex: 2),

              // "you are" label
              FadeTransition(
                opacity: _fadeAnim,
                child: Text(t.result.title, style: NpcTypography.bodyLarge),
              ),

              const SizedBox(height: NpcSpacing.md),

              // Animated score
              AnimatedBuilder(
                animation: _scoreFillAnim,
                builder: (context, _) {
                  final displayScore = (_scoreFillAnim.value * result.score)
                      .round();
                  return DecoratedBox(
                    decoration: BoxDecoration(boxShadow: tierGlow),
                    child: Text(
                      '$displayScore%',
                      style: NpcTypography.scoreDisplay.copyWith(
                        color: tierColor,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: NpcSpacing.sm),

              // Tier label
              FadeTransition(
                opacity: _fadeAnim,
                child: Container(
                  padding: NpcSpacing.tierLabelPadding,
                  decoration: BoxDecoration(
                    border: Border.all(color: tierColor.withValues(alpha: 0.5)),
                    borderRadius: BorderRadius.circular(NpcSpacing.radiusXs),
                    color: tierColor.withValues(alpha: 0.1),
                  ),
                  child: Text(
                    result.label,
                    style: NpcTypography.label.copyWith(
                      color: tierColor,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: NpcSpacing.xl),

              // Random message
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

              // Share button
              NpcButton(
                text: t.result.shareButton,
                onPressed: () => _shareResult(result),
              ),

              const SizedBox(height: NpcSpacing.sm),

              // CTA to course
              NpcButton(
                text: t.result.ctaButton,
                variant: NpcButtonVariant.secondary,
                onPressed: _openCourse,
              ),

              const SizedBox(height: NpcSpacing.xs),

              Text(t.result.ctaSubtitle, style: NpcTypography.bodySmall),

              const SizedBox(height: NpcSpacing.md),

              // Retry
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
    );
  }
}
