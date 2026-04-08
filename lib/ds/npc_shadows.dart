part of 'ds.dart';

class NpcShadows {
  NpcShadows._();

  static List<BoxShadow> glowGreen({double intensity = 1.0}) => [
    BoxShadow(
      color: NpcColors.matrixGreen.withValues(alpha: 0.3 * intensity),
      blurRadius: 12 * intensity,
      spreadRadius: 2 * intensity,
    ),
    BoxShadow(
      color: NpcColors.matrixGreen.withValues(alpha: 0.1 * intensity),
      blurRadius: 30 * intensity,
      spreadRadius: 5 * intensity,
    ),
  ];

  static List<BoxShadow> glowRed({double intensity = 1.0}) => [
    BoxShadow(
      color: NpcColors.npcRed.withValues(alpha: 0.3 * intensity),
      blurRadius: 12 * intensity,
      spreadRadius: 2 * intensity,
    ),
  ];

  static List<BoxShadow> glowYellow({double intensity = 1.0}) => [
    BoxShadow(
      color: NpcColors.borderlineYellow.withValues(alpha: 0.3 * intensity),
      blurRadius: 12 * intensity,
      spreadRadius: 2 * intensity,
    ),
  ];
}
