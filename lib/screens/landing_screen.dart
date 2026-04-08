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
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;
  late Animation<double> _slideAnim;

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

    _slideAnim = Tween<double>(begin: NpcCurves.slideDistanceMd, end: 0)
        .animate(
          CurvedAnimation(
            parent: _fadeController,
            curve: const Interval(0.1, 0.7, curve: NpcCurves.standard),
          ),
        );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Force rebuild on theme change so text colors update
    ref.watch(themeModeProvider);
    final Translations t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DoodleBackground(
        child: NpcPageLayout(
          showLanguageSwitcher: true,
          showThemeToggle: true,
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

                // Emoji/icon header
                Text(
                  '🤖',
                  style: TextStyle(fontSize: 64, color: NpcColors.textPrimary),
                ),

                const SizedBox(height: NpcSpacing.lg),

                Text(
                  t.landing.title,
                  style: NpcTypography.displayLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: NpcSpacing.md),

                Text(
                  t.landing.subtitle,
                  style: NpcTypography.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 3),

                NpcButton(
                  text: t.landing.startButton,
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
      ),
    );
  }
}
