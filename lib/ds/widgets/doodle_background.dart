part of '../ds.dart';

/// Playful floating shapes background with reactive theme support.
class DoodleBackground extends ConsumerStatefulWidget {
  const DoodleBackground({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<DoodleBackground> createState() => _DoodleBackgroundState();
}

class _DoodleBackgroundState extends ConsumerState<DoodleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = ref.watch(themeModeProvider);

    return Stack(
      children: [
        ColoredBox(
          color: NpcColors.background,
          child: const SizedBox.expand(),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => CustomPaint(
              painter: _DoodlePainter(
                progress: _controller.value,
                isDark: isDark,
              ),
              size: MediaQuery.sizeOf(context),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _DoodlePainter extends CustomPainter {
  _DoodlePainter({required this.progress, required this.isDark});

  final double progress;
  final bool isDark;

  static const List<Color> _lightColors = [
    NpcColors.pastelYellow,
    NpcColors.pastelGreen,
    NpcColors.pastelPink,
    NpcColors.pastelBlue,
    NpcColors.pastelPurple,
  ];

  static const List<Color> _darkColors = [
    NpcColors.pastelYellowDark,
    NpcColors.pastelGreenDark,
    NpcColors.pastelPinkDark,
    NpcColors.pastelBlueDark,
    NpcColors.pastelPurpleDark,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final List<Color> colors = isDark ? _darkColors : _lightColors;
    final double opacity = isDark ? 0.5 : 0.4;
    final Random rng = Random(42);

    for (int i = 0; i < 12; i++) {
      final double baseX = rng.nextDouble() * size.width;
      final double baseY = rng.nextDouble() * size.height;
      final double shapeSize = 20 + rng.nextDouble() * 40;
      final Color color = colors[i % colors.length].withValues(alpha: opacity);
      final int shape = i % 4;

      // Gentle floating motion
      final double dx = sin((progress * 2 * pi) + i * 0.7) * 12;
      final double dy = cos((progress * 2 * pi) + i * 1.1) * 10;

      final Paint paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final Offset center = Offset(baseX + dx, baseY + dy);

      switch (shape) {
        case 0: // Circle
          canvas.drawCircle(center, shapeSize / 2, paint);
        case 1: // Rounded rect
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: center,
                width: shapeSize,
                height: shapeSize * 0.7,
              ),
              const Radius.circular(8),
            ),
            paint,
          );
        case 2: // Small circle
          canvas.drawCircle(center, shapeSize / 3, paint);
        case 3: // Square-ish
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: center,
                width: shapeSize * 0.8,
                height: shapeSize * 0.8,
              ),
              const Radius.circular(6),
            ),
            paint,
          );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DoodlePainter oldDelegate) {
    return progress != oldDelegate.progress || isDark != oldDelegate.isDark;
  }
}
