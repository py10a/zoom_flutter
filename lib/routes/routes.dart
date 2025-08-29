import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_flutter/features/auth/auth.dart';
import 'package:zoom_flutter/features/home/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      name: 'sign-up',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: const SignUpScreen(),
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
    ),
  ],
);
