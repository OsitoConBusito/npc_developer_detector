part of 'ds.dart';

class NpcDurations {
  NpcDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
  static const Duration dramatic = Duration(milliseconds: 1200);

  // Screen-specific
  static const Duration pulse = Duration(milliseconds: 2000);
  static const Duration scoreReveal = Duration(milliseconds: 1500);

  // Staggered animations
  static const Duration staggerBase = Duration(milliseconds: 300);
  static const Duration staggerStep = Duration(milliseconds: 100);
}
