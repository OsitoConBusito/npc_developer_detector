part of '../ds.dart';

class GlitchText extends StatefulWidget {
  const GlitchText({
    required this.text,
    required this.style,
    super.key,
    this.glitchInterval = const Duration(seconds: 3),
    this.enabled = true,
  });

  final String text;
  final TextStyle style;
  final Duration glitchInterval;
  final bool enabled;

  @override
  State<GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> {
  bool _isGlitching = false;
  Timer? _timer;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      _startGlitchLoop();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGlitchLoop() {
    _timer = Timer.periodic(widget.glitchInterval, (_) {
      if (!mounted) {
        return;
      }
      setState(() => _isGlitching = true);
      Future.delayed(NpcDurations.glitchFlash, () {
        if (mounted) {
          setState(() => _isGlitching = false);
        }
      });
    });
  }

  String _glitchedText() {
    const glitchChars = r'@#$%&*!?<>{}[]';
    return String.fromCharCodes(
      widget.text.runes.map((r) {
        if (_random.nextDouble() > 0.7 && String.fromCharCode(r) != '\n') {
          return glitchChars.codeUnitAt(_random.nextInt(glitchChars.length));
        }
        return r;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: NpcDurations.fast,
      child: Text(
        _isGlitching ? _glitchedText() : widget.text,
        key: ValueKey(_isGlitching),
        style: widget.style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
