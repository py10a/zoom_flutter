import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_flutter/features/auth/auth.dart';
import 'package:zoom_flutter/features/home/home.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/loading',
    debugLogDiagnostics: true,
    refreshListenable: AuthService.instance,
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const CircularProgressIndicator(),
        redirect: (context, state) =>
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        // TODO: add auth guard
        path: '/sign-in',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        // TODO: add auth guard
        path: '/join-meeting',
        builder: (context, state) => const Placeholder(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) =>
        AuthService.instance.isLoggedIn ? state.path : '/auth',
  );
}
