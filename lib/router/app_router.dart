import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:npc_developer_detector/screens/landing_screen.dart';
import 'package:npc_developer_detector/screens/quiz_screen.dart';
import 'package:npc_developer_detector/screens/result_screen.dart';

abstract class AppRoutes {
  static const String landing = '/';
  static const String quiz = '/quiz';
  static const String result = '/result';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.landing,
    routes: [
      GoRoute(
        path: AppRoutes.landing,
        name: 'landing',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RepaintBoundary(child: LandingScreen()),
          transitionsBuilder: _fadeSlideTransition,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ),
      GoRoute(
        path: AppRoutes.quiz,
        name: 'quiz',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RepaintBoundary(child: QuizScreenView()),
          transitionsBuilder: _fadeSlideTransition,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ),
      GoRoute(
        path: AppRoutes.result,
        name: 'result',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RepaintBoundary(child: ResultScreen()),
          transitionsBuilder: _fadeSlideTransition,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ),
    ],
  );
});

Widget _fadeSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const Offset begin = Offset(0, 0.015);
  const Offset end = Offset.zero;
  const Curve curve = Curves.easeOutCubic;

  final Tween<Offset> slideTween = Tween(begin: begin, end: end);
  final CurveTween curveTween = CurveTween(curve: curve);
  final Animation<Offset> slideAnimation = animation.drive(
    slideTween.chain(curveTween),
  );

  final CurveTween fadeCurve = CurveTween(curve: Curves.easeIn);
  final Animation<double> fadeAnimation = animation.drive(fadeCurve);

  return SlideTransition(
    position: slideAnimation,
    child: FadeTransition(opacity: fadeAnimation, child: child),
  );
}
