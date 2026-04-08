part of '../ds.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({
    required this.progress,
    super.key,
    this.height = 12,
  });
  final double progress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: NpcColors.surfaceLight,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(
          color: NpcColors.border,
          width: NpcSpacing.borderThin,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedContainer(
                duration: NpcDurations.slow,
                curve: NpcCurves.standard,
                width: constraints.maxWidth * progress,
                height: height,
                decoration: BoxDecoration(
                  color: NpcColors.primary,
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
