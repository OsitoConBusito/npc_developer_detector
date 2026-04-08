import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npc_developer_detector/ds/ds.dart';
import 'package:npc_developer_detector/firebase_options.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocaleSettings.setLocale(AppLocale.en);
  runApp(ProviderScope(child: TranslationProvider(child: const NpcApp())));
}

class NpcApp extends ConsumerWidget {
  const NpcApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final bool isDark = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'NPC Developer Detector',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: npcTheme(isDark: isDark),
    );
  }
}
