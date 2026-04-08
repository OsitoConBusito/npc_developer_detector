part of '../ds.dart';

class ThemeToggle extends ConsumerStatefulWidget {
  const ThemeToggle({super.key});

  @override
  ConsumerState<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends ConsumerState<ThemeToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: NpcDurations.normal,
    );
    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: 1.2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: NpcCurves.snap));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = ref.watch(themeModeProvider);

    return AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, child) =>
          Transform.scale(scale: _scaleAnim.value, child: child),
      child: GestureDetector(
        onTap: () {
          ref.read(themeModeProvider.notifier).state = !isDark;
          _controller.forward(from: 0);
        },
        child: Container(
          padding: const EdgeInsets.all(NpcSpacing.sm),
          decoration: BoxDecoration(
            border: Border.all(
              color: NpcColors.border,
              width: NpcSpacing.borderThin,
            ),
            borderRadius: BorderRadius.circular(NpcSpacing.radiusSm),
            color: NpcColors.surface,
            boxShadow: NpcShadows.hardSmall(),
          ),
          child: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            color: NpcColors.textPrimary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
