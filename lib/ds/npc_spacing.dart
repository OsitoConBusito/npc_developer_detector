part of 'ds.dart';

class NpcSpacing {
  NpcSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 24);

  // Responsive
  static const double maxContentWidth = 480;

  // Border radii
  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 16;
  static const double radiusLg = 24;

  // Border widths
  static const double borderThin = 2;
  static const double borderThick = 3;

  // Component sizes
  static const double iconSm = 20;
  static const double optionLabelSize = 32;

  // Component paddings
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 18);
  static const EdgeInsets optionCardPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 14);
  static const EdgeInsets tierLabelPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}
