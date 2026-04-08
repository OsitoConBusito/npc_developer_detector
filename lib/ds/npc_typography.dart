part of 'ds.dart';

class NpcTypography {
  NpcTypography._();

  static TextStyle _spaceMono({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontFamily: 'SpaceMono',
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? NpcColors.textPrimary,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle ?? FontStyle.normal,
    );
  }

  // Headlines
  static final TextStyle displayLarge = _spaceMono(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: NpcColors.matrixGreen,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static TextStyle displayMedium = _spaceMono(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: NpcColors.matrixGreen,
    height: 1.15,
    letterSpacing: -1,
  );

  static TextStyle displaySmall = _spaceMono(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    height: 1.2,
  );

  // Score display
  static TextStyle scoreDisplay = _spaceMono(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    color: NpcColors.matrixGreen,
    height: 1,
    letterSpacing: -2,
  );

  // Body
  static TextStyle bodyLarge = _spaceMono(
    fontSize: 16,
    color: NpcColors.textSecondary,
    height: 1.5,
  );

  static TextStyle bodyMedium = _spaceMono(
    fontSize: 14,
    color: NpcColors.textSecondary,
    height: 1.5,
  );

  static TextStyle bodySmall = _spaceMono(
    fontSize: 12,
    color: NpcColors.textMuted,
    height: 1.4,
  );

  // Buttons
  static TextStyle buttonLarge = _spaceMono(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: NpcColors.background,
    letterSpacing: 1,
  );

  static TextStyle buttonMedium = _spaceMono(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    letterSpacing: 0.5,
  );

  // Labels
  static final TextStyle label = _spaceMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: NpcColors.textMuted,
    letterSpacing: 1,
  );

  static TextStyle optionText = _spaceMono(
    fontSize: 14,
    color: NpcColors.textPrimary,
    height: 1.3,
  );
}
