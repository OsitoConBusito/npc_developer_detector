part of '../ds.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({
    required this.progress,
    super.key,
    this.height = 3,
  });
  final double progress; // 0.0 to 1.0
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: NpcColors.surfaceLight,
        borderRadius: BorderRadius.circular(height / 2),
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
                  color: NpcColors.matrixGreen,
                  borderRadius: BorderRadius.circular(height / 2),
                  boxShadow: NpcShadows.glowGreen(intensity: 0.4),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
