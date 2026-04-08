part of '../ds.dart';

class NpcPageLayout extends StatelessWidget {
  const NpcPageLayout({
    required this.child,
    this.showLanguageSwitcher = false,
    this.showThemeToggle = false,
    super.key,
  });

  final Widget child;
  final bool showLanguageSwitcher;
  final bool showThemeToggle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: NpcSpacing.maxContentWidth,
              ),
              child: Padding(
                padding: NpcSpacing.screenPadding,
                child: child,
              ),
            ),
          ),
          if (showThemeToggle || showLanguageSwitcher)
            Positioned(
              top: NpcSpacing.sm,
              right: NpcSpacing.md,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showLanguageSwitcher) const LanguageSwitcher(),
                  if (showLanguageSwitcher && showThemeToggle)
                    const SizedBox(width: NpcSpacing.sm),
                  if (showThemeToggle) const ThemeToggle(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
