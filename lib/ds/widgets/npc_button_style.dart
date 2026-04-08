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
      isPressed ? NpcColors.primaryDim : NpcColors.primary;

  @override
  Color getTextColor() => Colors.white;

  @override
  Border? getBorder() =>
      Border.all(color: NpcColors.border, width: NpcSpacing.borderThin);

  @override
  List<BoxShadow>? getShadow({required bool isPressed}) =>
      isPressed ? null : NpcShadows.hard();
}

class SecondaryButtonStyle extends NpcButtonStyle {
  @override
  Color getBackgroundColor({required bool isPressed}) =>
      isPressed ? NpcColors.surfaceLight : NpcColors.surface;

  @override
  Color getTextColor() => NpcColors.textPrimary;

  @override
  Border? getBorder() =>
      Border.all(color: NpcColors.border, width: NpcSpacing.borderThin);

  @override
  List<BoxShadow>? getShadow({required bool isPressed}) =>
      isPressed ? null : NpcShadows.hardSmall();
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
