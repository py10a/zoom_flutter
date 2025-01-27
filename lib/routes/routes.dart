import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_flutter/features/auth/auth.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: const SignUpScreen(),
        );
      },
    ),
  ],
);
