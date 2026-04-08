part of '../ds.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({
    required this.text,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.index,
    super.key,
  });

  final String text;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: NpcDurations.fast);
    _scaleAnim = Tween<double>(
      begin: 1,
      end: NpcCurves.pressScaleCard,
    ).animate(CurvedAnimation(parent: _controller, curve: NpcCurves.standard));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isSelected
        ? NpcColors.matrixGreen
        : NpcColors.border;
    final bgColor = widget.isSelected
        ? NpcColors.matrixGreenSubtle
        : NpcColors.surface;
    final labelColor = widget.isSelected
        ? NpcColors.matrixGreen
        : NpcColors.textMuted;

    return AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, child) =>
          Transform.scale(scale: _scaleAnim.value, child: child),
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) {
          _controller.reverse();
          widget.onTap();
        },
        onTapCancel: () => _controller.reverse(),
        child: AnimatedContainer(
          duration: NpcDurations.normal,
          curve: NpcCurves.standard,
          width: double.infinity,
          padding: NpcSpacing.optionCardPadding,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(NpcSpacing.radiusMd),
            border: Border.all(
              color: borderColor,
              width: widget.isSelected ? 1.5 : 1,
            ),
            boxShadow: widget.isSelected
                ? NpcShadows.glowGreen(intensity: 0.3)
                : null,
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: NpcDurations.normal,
                width: NpcSpacing.optionLabelSize,
                height: NpcSpacing.optionLabelSize,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? NpcColors.matrixGreen.withValues(alpha: 0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(NpcSpacing.radiusSm),
                  border: Border.all(color: labelColor),
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: NpcTypography.bodySmall.copyWith(
                      color: labelColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: NpcSpacing.sm + NpcSpacing.xs),
              Expanded(
                child: Text(
                  widget.text.toLowerCase(),
                  style: NpcTypography.optionText.copyWith(
                    color: widget.isSelected
                        ? NpcColors.textPrimary
                        : NpcColors.textSecondary,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: NpcDurations.normal,
                opacity: widget.isSelected ? 1.0 : 0.0,
                child: const Icon(
                  Icons.check_circle,
                  color: NpcColors.matrixGreen,
                  size: NpcSpacing.iconSm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
