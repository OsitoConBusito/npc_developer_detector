import 'package:flutter/material.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({required this.result, super.key});

  final QuizResult result;

  Color _tierColor() {
    switch (result.tier) {
      case ResultTier.npc:
        return NpcColors.npcRed;
      case ResultTier.borderline:
        return NpcColors.borderlineYellow;
      case ResultTier.dangerous:
        return NpcColors.dangerousGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _tierColor();

    // Instagram story aspect ratio: 1080x1920 (9:16)
    return Container(
      width: 1080,
      height: 1920,
      decoration: BoxDecoration(
        color: NpcColors.background,
        border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
      ),
      child: Stack(
        children: [
          // Matrix-style grid lines
          ...List.generate(
            20,
            (i) => Positioned(
              left: 0,
              right: 0,
              top: i * 96.0,
              child: Container(
                height: 1,
                color: NpcColors.matrixGreen.withValues(alpha: 0.05),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Terminal prompt
                Text(
                  '> npc_detector --scan',
                  style: NpcTypography.bodyMedium.copyWith(
                    color: NpcColors.matrixGreen.withValues(alpha: 0.6),
                    fontSize: 28,
                  ),
                ),

                const SizedBox(height: 60),

                // Score
                Text(
                  '${result.score}%',
                  style: NpcTypography.scoreDisplay.copyWith(
                    color: color,
                    fontSize: 160,
                    shadows: [
                      Shadow(
                        color: color.withValues(alpha: 0.5),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Label
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: color.withValues(alpha: 0.5)),
                    borderRadius: BorderRadius.circular(8),
                    color: color.withValues(alpha: 0.1),
                  ),
                  child: Text(
                    result.label,
                    style: NpcTypography.label.copyWith(
                      color: color,
                      fontSize: 32,
                      letterSpacing: 4,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Message
                Text(
                  '"${result.message}"',
                  style: NpcTypography.bodyLarge.copyWith(
                    color: NpcColors.textPrimary,
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 2),

                // Footer
                Text(
                  t.share.storySubtext,
                  style: NpcTypography.bodySmall.copyWith(
                    color: NpcColors.textMuted,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Branding
                Text(
                  'npc developer detector',
                  style: NpcTypography.label.copyWith(
                    color: NpcColors.matrixGreen.withValues(alpha: 0.4),
                    fontSize: 22,
                    letterSpacing: 3,
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
