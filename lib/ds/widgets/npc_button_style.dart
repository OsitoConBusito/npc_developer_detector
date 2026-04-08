part of '../ds.dart';

abstract class NpcButtonStyle {
  Color getBackgroundColor({required bool isPressed});
  Color getTextColor();
  Border? getBorder();
  List<BoxShadow>? getShadow({required bool isPressed});
}

class PrimaryButtonStyle extends NpcButtonStyle {
  @override
  Color getBackgroundColor({required bool isPressed}) =>
      isPressed ? NpcColors.matrixGreenDim : NpcColors.matrixGreen;

  @override
  Color getTextColor() => NpcColors.background;

  @override
  Border? getBorder() => null;

  @override
  List<BoxShadow>? getShadow({required bool isPressed}) =>
      !isPressed ? NpcShadows.glowGreen(intensity: 0.5) : null;
}

class SecondaryButtonStyle extends NpcButtonStyle {
  @override
  Color getBackgroundColor({required bool isPressed}) =>
      isPressed ? NpcColors.surfaceLight : NpcColors.surface;

  @override
  Color getTextColor() => NpcColors.matrixGreen;

  @override
  Border? getBorder() =>
      Border.all(color: NpcColors.matrixGreen.withValues(alpha: 0.3));

  @override
  List<BoxShadow>? getShadow({required bool isPressed}) => null;
}

class GhostButtonStyle extends NpcButtonStyle {
  @override
  Color getBackgroundColor({required bool isPressed}) => Colors.transparent;

  @override
  Color getTextColor() => NpcColors.textSecondary;

  @override
  Border? getBorder() => null;

  @override
  List<BoxShadow>? getShadow({required bool isPressed}) => null;
}
