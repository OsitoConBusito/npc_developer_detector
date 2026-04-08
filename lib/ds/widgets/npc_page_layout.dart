part of '../ds.dart';

class NpcPageLayout extends StatelessWidget {
  const NpcPageLayout({
    required this.child,
    this.showLanguageSwitcher = true,
    super.key,
  });

  final Widget child;
  final bool showLanguageSwitcher;

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
          if (showLanguageSwitcher)
            const Positioned(
              top: NpcSpacing.sm,
              right: NpcSpacing.md,
              child: LanguageSwitcher(),
            ),
        ],
      ),
    );
  }
}
