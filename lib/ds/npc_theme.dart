part of 'ds.dart';

final themeModeProvider = StateProvider<bool>((ref) => false);

ThemeData npcTheme({required bool isDark}) {
  NpcColors.isDark = isDark;
  return ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: NpcColors.background,
    colorScheme: isDark
        ? const ColorScheme.dark(
            surface: NpcColors.darkBackground,
            primary: NpcColors.primary,
          )
        : const ColorScheme.light(
            surface: NpcColors.lightBackground,
            primary: NpcColors.primary,
          ),
  );
}
