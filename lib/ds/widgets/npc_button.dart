part of '../ds.dart';

enum NpcButtonVariant { primary, secondary, ghost }

class NpcButton extends StatefulWidget {
  const NpcButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.variant = NpcButtonVariant.primary,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final NpcButtonVariant variant;
  final bool isLoading;

  @override
  State<NpcButton> createState() => _NpcButtonState();
}

class _NpcButtonState extends State<NpcButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late NpcButtonStyle _style;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _style = _getStyleForVariant(widget.variant);
    _controller = AnimationController(vsync: this, duration: NpcDurations.fast);
    _scaleAnim = Tween<double>(
      begin: 1,
      end: NpcCurves.pressScaleButton,
    ).animate(CurvedAnimation(parent: _controller, curve: NpcCurves.standard));
  }

  NpcButtonStyle _getStyleForVariant(NpcButtonVariant variant) {
    switch (variant) {
      case NpcButtonVariant.primary:
        return PrimaryButtonStyle();
      case NpcButtonVariant.secondary:
        return SecondaryButtonStyle();
      case NpcButtonVariant.ghost:
        return GhostButtonStyle();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, child) =>
          Transform.scale(scale: _scaleAnim.value, child: child),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          _controller.forward();
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _controller.reverse();
          widget.onPressed();
        },
        onTapCancel: () {
          setState(() => _isPressed = false);
          _controller.reverse();
        },
        child: AnimatedContainer(
          duration: NpcDurations.fast,
          width: double.infinity,
          padding: NpcSpacing.buttonPadding,
          decoration: BoxDecoration(
            color: _style.getBackgroundColor(isPressed: _isPressed),
            borderRadius: BorderRadius.circular(NpcSpacing.radiusMd),
            border: _style.getBorder(),
            boxShadow: _style.getShadow(isPressed: _isPressed),
          ),
          child: Center(
            child: widget.isLoading
                ? SizedBox(
                    height: NpcSpacing.iconSm,
                    width: NpcSpacing.iconSm,
                    child: CircularProgressIndicator(
                      strokeWidth: NpcSpacing.xs / 2,
                      color: _style.getTextColor(),
                    ),
                  )
                : Text(
                    widget.text,
                    style: NpcTypography.buttonLarge.copyWith(
                      color: _style.getTextColor(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
