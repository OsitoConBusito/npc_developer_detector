part of '../ds.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = LocaleSettings.currentLocale;
    final label = currentLocale == AppLocale.en ? 'ES' : 'EN';

    return GestureDetector(
      onTap: () {
        final next =
            currentLocale == AppLocale.en ? AppLocale.es : AppLocale.en;
        LocaleSettings.setLocale(next);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: NpcSpacing.sm,
          vertical: NpcSpacing.xs,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: NpcColors.border),
          borderRadius: BorderRadius.circular(NpcSpacing.radiusXs),
          color: NpcColors.surface,
        ),
        child: Text(
          label,
          style: NpcTypography.label.copyWith(
            color: NpcColors.matrixGreenDim,
          ),
        ),
      ),
    );
  }
}
