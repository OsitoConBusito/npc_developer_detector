part of 'ds.dart';

class NpcTypography {
  NpcTypography._();

  static TextStyle _font({
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

  static TextStyle get displayLarge => _font(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    height: 1.1,
    letterSpacing: -1.5,
  );

  static TextStyle get displayMedium => _font(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    height: 1.15,
    letterSpacing: -1,
  );

  static TextStyle get displaySmall => _font(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    height: 1.2,
  );

  static TextStyle get scoreDisplay => _font(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    color: NpcColors.primary,
    height: 1,
    letterSpacing: -2,
  );

  static TextStyle get bodyLarge => _font(
    fontSize: 16,
    color: NpcColors.textSecondary,
    height: 1.5,
  );

  static TextStyle get bodyMedium => _font(
    fontSize: 14,
    color: NpcColors.textSecondary,
    height: 1.5,
  );

  static TextStyle get bodySmall => _font(
    fontSize: 12,
    color: NpcColors.textMuted,
    height: 1.4,
  );

  static TextStyle get buttonLarge => _font(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: NpcColors.lightBackground,
    letterSpacing: 1,
  );

  static TextStyle get buttonMedium => _font(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: NpcColors.textPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle get label => _font(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: NpcColors.textMuted,
    letterSpacing: 1,
  );

  static TextStyle get optionText => _font(
    fontSize: 14,
    color: NpcColors.textPrimary,
    height: 1.3,
  );
}
