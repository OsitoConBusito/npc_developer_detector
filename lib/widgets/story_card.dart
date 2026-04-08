import 'package:flutter/material.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({required this.result, super.key});

  final QuizResult result;

  @override
  Widget build(BuildContext context) {
    final Color color = result.tier.color;

    // Instagram story aspect ratio: 1080x1920 (9:16)
    return Container(
      width: 1080,
      height: 1920,
      decoration: BoxDecoration(
        color: NpcColors.lightBackground,
        border: Border.all(color: color, width: 6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),

            const Text('🤖', style: TextStyle(fontSize: 80)),

            const SizedBox(height: 40),

            Text(
              '${result.score}%',
              style: NpcTypography.scoreDisplay.copyWith(
                color: color,
                fontSize: 160,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: NpcColors.lightBorder, width: 4),
                borderRadius: BorderRadius.circular(16),
                color: color.withValues(alpha: 0.15),
                boxShadow: [
                  BoxShadow(
                    color: NpcColors.lightBorder,
                    offset: const Offset(6, 6),
                  ),
                ],
              ),
              child: Text(
                result.label,
                style: NpcTypography.label.copyWith(
                  color: NpcColors.lightTextPrimary,
                  fontSize: 32,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 60),

            Text(
              '"${result.message}"',
              style: NpcTypography.bodyLarge.copyWith(
                color: NpcColors.lightTextPrimary,
                fontSize: 32,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(flex: 2),

            Text(
              t.share.storySubtext,
              style: NpcTypography.bodySmall.copyWith(
                color: NpcColors.lightTextMuted,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Text(
              t.share.storyBranding,
              style: NpcTypography.label.copyWith(
                color: NpcColors.primary.withValues(alpha: 0.6),
                fontSize: 22,
                letterSpacing: 3,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
