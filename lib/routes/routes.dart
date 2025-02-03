import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_flutter/features/auth/auth.dart';
import 'package:zoom_flutter/features/home/home.dart';

final GoRouter authRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: const AuthScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'sign-up',
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: const SignUpScreen(),
            );
          },
        ),
      ],
    ),
  ],
);

final GoRouter homeRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
    ),
  ],
);
