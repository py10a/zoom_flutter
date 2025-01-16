import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'auth_buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(theme),
        backgroundColor: theme.primary,
        body: buildBody(theme, mediaQuery),
        bottomSheet: buildBottomSheet(theme, mediaQuery));
  }

  Widget? buildBody(theme, MediaQueryData mediaQuery) {
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

  AppBar buildAppBar(ColorScheme theme) {
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

  BottomSheet buildBottomSheet(ColorScheme theme, MediaQueryData mediaQuery) {
    return BottomSheet(
        enableDrag: false,
        backgroundColor: theme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: mediaQuery.size.height * 0.4,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 32),
                  Column(
                    spacing: 4,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: theme.onPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Get started by creating an account',
                        style: TextStyle(
                          color: theme.onPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Column(
                    spacing: 14,
                    children: [
                      JoinMeetingButton(onPressed: () {}),
                      SignUpButton(onPressed: () {}),
                      SignInButton(onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
