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

  static const List<Color> _pastelColors = [
    NpcColors.pastelYellow,
    NpcColors.pastelPink,
    NpcColors.pastelBlue,
    NpcColors.pastelPurple,
  ];

  static const List<Color> _pastelColorsDark = [
    NpcColors.pastelYellowDark,
    NpcColors.pastelGreenDark,
    NpcColors.pastelBlueDark,
    NpcColors.pastelPurpleDark,
  ];

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
    final List<Color> pastels = NpcColors.isDark
        ? OptionCard._pastelColorsDark
        : OptionCard._pastelColors;
    final Color pastelBg = pastels[widget.index % pastels.length];
    final Color borderColor = NpcColors.border;

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
            color: widget.isSelected ? pastelBg : NpcColors.surface,
            borderRadius: BorderRadius.circular(NpcSpacing.radiusMd),
            border: Border.all(
              color: borderColor,
              width: widget.isSelected
                  ? NpcSpacing.borderThick
                  : NpcSpacing.borderThin,
            ),
            boxShadow: widget.isSelected
                ? NpcShadows.hard()
                : NpcShadows.hardSmall(),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: NpcDurations.normal,
                width: NpcSpacing.optionLabelSize,
                height: NpcSpacing.optionLabelSize,
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? NpcColors.primary
                      : NpcColors.surfaceLight,
                  borderRadius: BorderRadius.circular(NpcSpacing.radiusSm),
                  border: Border.all(
                    color: borderColor,
                    width: NpcSpacing.borderThin,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.label,
                    style: NpcTypography.bodySmall.copyWith(
                      color: widget.isSelected
                          ? Colors.white
                          : NpcColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: NpcSpacing.sm + NpcSpacing.xs),
              Expanded(
                child: Text(
                  widget.text,
                  style: NpcTypography.optionText.copyWith(
                    color: NpcColors.textPrimary,
                    fontWeight: widget.isSelected ? FontWeight.w700 : null,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: NpcDurations.normal,
                opacity: widget.isSelected ? 1.0 : 0.0,
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: NpcColors.primary,
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
