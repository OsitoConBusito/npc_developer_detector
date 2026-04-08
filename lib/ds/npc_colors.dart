part of 'ds.dart';

class NpcColors {
  NpcColors._();

  // ── Light mode ──
  static const Color lightBackground = Color(0xFFFFF8F0);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceLight = Color(0xFFF5F0EB);
  static const Color lightBorder = Color(0xFF1A1A2E);
  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF4A4A5A);
  static const Color lightTextMuted = Color(0xFF8A8A9A);

  // ── Dark mode ──
  static const Color darkBackground = Color(0xFF121218);
  static const Color darkSurface = Color(0xFF1C1C26);
  static const Color darkSurfaceLight = Color(0xFF262633);
  static const Color darkBorder = Color(0xFF4A4A5A);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFD0D0E0);
  static const Color darkTextMuted = Color(0xFF9090A0);

  // ── Shared accent palette ──
  static const Color primary = Color(0xFF7C5CFC);
  static const Color primaryDim = Color(0xFF6A4CE0);
  static const Color yellow = Color(0xFFFFD600);
  static const Color yellowDim = Color(0xFFE6C000);
  static const Color coral = Color(0xFFFF6B6B);
  static const Color coralDim = Color(0xFFE05555);
  static const Color turquoise = Color(0xFF4ECDC4);
  static const Color turquoiseDim = Color(0xFF3AB5AD);
  static const Color pink = Color(0xFFFF8ED4);
  static const Color lime = Color(0xFFC4F06E);

  // ── Pastel card backgrounds ──
  static const Color pastelYellow = Color(0xFFFFF9C4);
  static const Color pastelGreen = Color(0xFFE0FDDB);
  static const Color pastelPink = Color(0xFFFFE0F0);
  static const Color pastelBlue = Color(0xFFE0F4FD);
  static const Color pastelPurple = Color(0xFFEDE0FD);

  // Dark mode pastel (more muted)
  static const Color pastelYellowDark = Color(0xFF3D3A20);
  static const Color pastelGreenDark = Color(0xFF1E3D1E);
  static const Color pastelPinkDark = Color(0xFF3D1E2E);
  static const Color pastelBlueDark = Color(0xFF1E2E3D);
  static const Color pastelPurpleDark = Color(0xFF2E1E3D);

  // ── Tier colors (shared) ──
  static const Color npcRed = Color(0xFFFF6B6B);
  static const Color borderlineYellow = Color(0xFFFFD600);
  static const Color dangerousGreen = Color(0xFF4ECDC4);

  // ── Legacy aliases (for backward compat during migration) ──
  static Color get background => _isDark ? darkBackground : lightBackground;
  static Color get surface => _isDark ? darkSurface : lightSurface;
  static Color get surfaceLight => _isDark ? darkSurfaceLight : lightSurfaceLight;
  static Color get border => _isDark ? darkBorder : lightBorder;
  static Color get textPrimary => _isDark ? darkTextPrimary : lightTextPrimary;
  static Color get textSecondary => _isDark ? darkTextSecondary : lightTextSecondary;
  static Color get textMuted => _isDark ? darkTextMuted : lightTextMuted;

  // ── Theme state ──
  static bool _isDark = false;
  static bool get isDark => _isDark;
  static set isDark(bool value) => _isDark = value;
}
