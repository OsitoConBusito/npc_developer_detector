part of 'ds.dart';

class NpcShadows {
  NpcShadows._();

  /// Neo-brutal hard drop shadow (no blur, solid offset)
  static List<BoxShadow> hard({Color? color, double offset = 4}) => [
    BoxShadow(
      color: color ?? NpcColors.border,
      offset: Offset(offset, offset),
    ),
  ];

  static List<BoxShadow> hardSmall({Color? color}) =>
      hard(color: color, offset: 2);

  static List<BoxShadow> hardLarge({Color? color}) =>
      hard(color: color, offset: 6);

  // Tier glows (kept for result screen emphasis, but as hard shadows)
  static List<BoxShadow> glowRed({double intensity = 1.0}) =>
      hard(color: NpcColors.coral.withValues(alpha: 0.6 * intensity));

  static List<BoxShadow> glowYellow({double intensity = 1.0}) =>
      hard(color: NpcColors.yellow.withValues(alpha: 0.6 * intensity));

  static List<BoxShadow> glowGreen({double intensity = 1.0}) =>
      hard(color: NpcColors.turquoise.withValues(alpha: 0.6 * intensity));
}
