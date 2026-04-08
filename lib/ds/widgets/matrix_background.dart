part of '../ds.dart';

class MatrixBackground extends StatefulWidget {
  const MatrixBackground({required this.child, super.key});

  final Widget child;

  @override
  State<MatrixBackground> createState() => _MatrixBackgroundState();
}

class _MatrixBackgroundState extends State<MatrixBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: NpcDurations.matrixLoop,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: NpcColors.background),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => CustomPaint(
            painter: _MatrixRainPainter(progress: _controller.value),
            size: MediaQuery.sizeOf(context),
          ),
        ),
        // Gradient overlay for readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                NpcColors.background.withValues(alpha: 0.7),
                NpcColors.background.withValues(alpha: 0.9),
                NpcColors.background.withValues(alpha: 0.95),
              ],
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _MatrixRainPainter extends CustomPainter {
  _MatrixRainPainter({required this.progress});

  final double progress;

  static const String _chars =
      r'abcdefghijklmnopqrstuvwxyz0123456789{}[]<>/\|@#$%^&*';

  @override
  void paint(Canvas canvas, Size size) {
    final columns = (size.width / 18).floor();
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (var col = 0; col < columns; col++) {
      final colRandom = Random(col * 7 + 3);
      final speed = 0.3 + colRandom.nextDouble() * 0.7;
      final offset = colRandom.nextDouble();
      final yProgress = ((progress * speed + offset) % 1.2) * size.height;

      for (var row = 0; row < 15; row++) {
        final y = yProgress - row * 20;
        if (y < -20 || y > size.height + 20) {
          continue;
        }

        final opacity = (1.0 - row / 15) * 0.15;
        if (opacity <= 0) {
          continue;
        }

        final charIndex = (col + row + (progress * 50).floor()) % _chars.length;
        final char = _chars[charIndex];

        textPainter
          ..text = TextSpan(
            text: char,
            style: TextStyle(
              fontFamily: 'SpaceMono',
              fontSize: 14,
              color: NpcColors.matrixGreen.withValues(alpha: opacity),
            ),
          )
          ..layout()
          ..paint(canvas, Offset(col * 18, y));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _MatrixRainPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
