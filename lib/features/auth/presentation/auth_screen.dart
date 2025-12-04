import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

import 'auth_buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      backgroundColor: theme.primary,
      body: buildBody(context),
      bottomSheet: buildBottomSheet(context),
    );
  }

  void _joinMeeting(BuildContext context) {
    context.pushNamed('join-meeting');
  }

  void _signUp(BuildContext context) {
    context.pushNamed('sign-up');
  }

  void _signIn(BuildContext context) {
    context.pushNamed('sign-in');
  }

  Widget? buildBody(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      height: mediaQuery.size.height * 0.6,
      child: Center(
        child: SvgPicture.asset(
          'assets/svg/zoom_logo.svg',
          colorFilter: ColorFilter.mode(theme.onPrimary, BlendMode.srcIn),
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            color: theme.onPrimary,
          )),
    );
  }

  BottomSheet buildBottomSheet(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);

    return BottomSheet(
        enableDrag: false,
        backgroundColor: theme.surface,
        constraints: BoxConstraints(
          minHeight: mediaQuery.size.height * 0.4,
          minWidth: mediaQuery.size.width,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  spacing: 4,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: theme.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Get started by creating an account',
                      style: TextStyle(
                        color: theme.onSurface,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 14,
                  children: [
                    JoinMeetingButton(onPressed: () => _joinMeeting(context)),
                    SignUpButton(onPressed: () => _signUp(context)),
                    SignInButton(onPressed: () => _signIn(context)),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
