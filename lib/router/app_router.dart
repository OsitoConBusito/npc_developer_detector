import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/screens/landing_screen.dart';
import 'package:npc_developer_detector/screens/quiz_screen.dart';
import 'package:npc_developer_detector/screens/result_screen.dart';

/// Route paths
abstract class AppRoutes {
  static const String landing = '/';
  static const String quiz = '/quiz';
  static const String result = '/result';
}

/// GoRouter configuration provider
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.landing,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.landing,
        name: 'landing',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LandingScreen(),
          transitionsBuilder: _fadeSlideTransition,
        ),
      ),
      GoRoute(
        path: AppRoutes.quiz,
        name: 'quiz',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const QuizScreenView(),
          transitionsBuilder: _fadeSlideTransition,
        ),
      ),
      GoRoute(
        path: AppRoutes.result,
        name: 'result',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ResultScreen(),
          transitionsBuilder: _fadeSlideTransition,
        ),
      ),
    ],
  );
});

/// Custom fade + slide transition
Widget _fadeSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(0, 0.02);
  const end = Offset.zero;
  const curve = Curves.easeOutCubic;

  final tween = Tween(begin: begin, end: end).chain(
    CurveTween(curve: curve),
  );

  return FadeTransition(
    opacity: animation,
    child: SlideTransition(
      position: animation.drive(tween),
      child: child,
    ),
  );
}
