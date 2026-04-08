import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/router/app_router.dart';
import 'package:npc_developer_detector/viewmodels/quiz_viewmodel.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnim;
  late Animation<double> _slideAnim;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: NpcDurations.dramatic,
    );

    _fadeAnim = CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0, 0.6, curve: NpcCurves.standard),
    );

    _slideAnim = Tween<double>(begin: NpcCurves.slideDistanceMd, end: 0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.1, 0.7, curve: NpcCurves.standard),
      ),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: NpcDurations.pulse,
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 0.6, end: 1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return MatrixBackground(
      child: NpcPageLayout(
        child: AnimatedBuilder(
            animation: _fadeController,
            builder: (context, child) => Opacity(
              opacity: _fadeAnim.value,
              child: Transform.translate(
                offset: Offset(0, _slideAnim.value),
                child: child,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Terminal cursor blink effect
                AnimatedBuilder(
                  animation: _pulseAnim,
                  builder: (context, _) => Opacity(
                    opacity: _pulseAnim.value,
                    child: Text(
                      '> _',
                      style: NpcTypography.label.copyWith(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: NpcSpacing.lg),

                // Main title with glitch
                GlitchText(
                  text: t.landing.title,
                  style: NpcTypography.displayLarge,
                ),

                const SizedBox(height: NpcSpacing.md),

                // Subtitle with typing effect
                TypingText(
                  text: t.landing.subtitle,
                  style: NpcTypography.bodyLarge,
                ),

                const Spacer(flex: 3),

                // Primary CTA
                NpcButton(
                  text: t.landing.startButton,
                  onPressed: () {
                    ref.read(quizViewModelProvider.notifier).startQuiz();
                    context.go(AppRoutes.quiz);
                  },
                ),

                const SizedBox(height: NpcSpacing.md),

                // Ghost CTA
                NpcButton(
                  text: t.landing.skipButton,
                  variant: NpcButtonVariant.ghost,
                  onPressed: () {
                    ref.read(quizViewModelProvider.notifier).startQuiz();
                    context.go(AppRoutes.quiz);
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
