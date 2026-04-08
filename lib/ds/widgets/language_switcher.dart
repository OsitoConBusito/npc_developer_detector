part of '../ds.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
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

  void _toggleLocale() {
    final AppLocale current = LocaleSettings.currentLocale;
    final AppLocale next = current == AppLocale.en ? AppLocale.es : AppLocale.en;
    LocaleSettings.setLocale(next);
    _controller.forward(from: 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final String label =
        LocaleSettings.currentLocale == AppLocale.en ? 'ES' : 'EN';

    return AnimatedBuilder(
      animation: _scaleAnim,
      builder: (context, child) =>
          Transform.scale(scale: _scaleAnim.value, child: child),
      child: GestureDetector(
        onTap: _toggleLocale,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: NpcSpacing.sm + NpcSpacing.xs,
            vertical: NpcSpacing.xs + 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: NpcColors.border,
              width: NpcSpacing.borderThin,
            ),
            borderRadius: BorderRadius.circular(NpcSpacing.radiusSm),
            color: NpcColors.surface,
            boxShadow: NpcShadows.hardSmall(),
          ),
          child: Text(
            label,
            style: NpcTypography.label.copyWith(
              color: NpcColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
