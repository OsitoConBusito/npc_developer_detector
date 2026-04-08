part of '../ds.dart';

class TypingText extends StatefulWidget {
  const TypingText({
    required this.text,
    required this.style,
    super.key,
    this.charDuration = const Duration(milliseconds: 40),
    this.onComplete,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final TextStyle style;
  final Duration charDuration;
  final VoidCallback? onComplete;
  final TextAlign textAlign;

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _displayed = '';
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.charDuration, (timer) {
      if (_index >= widget.text.length) {
        timer.cancel();
        widget.onComplete?.call();
        return;
      }
      setState(() {
        _displayed = widget.text.substring(0, _index + 1);
        _index++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayed, style: widget.style, textAlign: widget.textAlign);
  }
}
