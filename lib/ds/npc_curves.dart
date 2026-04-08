part of 'ds.dart';

class NpcCurves {
  NpcCurves._();

  static const Curve standard = Curves.easeOutCubic;
  static const Curve bounce = Curves.elasticOut;
  static const Curve dramatic = Curves.easeInOutCubic;
  static const Curve snap = Curves.easeOutBack;

  // Press scale factors
  static const double pressScaleButton = 0.95;
  static const double pressScaleCard = 0.98;

  // Slide offsets
  static const double slideOffsetHorizontalSm = 0.05;
  static const double slideDistanceSm = 20;
  static const double slideDistanceMd = 30;
}
