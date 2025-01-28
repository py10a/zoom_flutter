import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';
import 'package:zoom_flutter/features/auth/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(),
              const SizedBox(height: 24),
              Column(
                spacing: 24,
                children: [
                  buildEmailSignUp(theme),
                  buildOrDivider(theme),
                  buildSignUpWithServices(),
                ],
              ),
              const SizedBox(height: 32),
              buildTermsAndConditions(theme),
            ],
          ),
        ),
      ),
    );
  }

  Align buildHeader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            'Sign up',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            'Create an account to continue.',
          ),
        ],
      ),
    );
  }

  Column buildEmailSignUp(ColorScheme theme) {
    return Column(
      children: [
        EmailTextField(),
        const SizedBox(height: 16),
        PasswordTextField(),
        const SizedBox(height: 24),
        SignUpButton(onPressed: () {}),
      ],
    );
  }

  Row buildOrDivider(ColorScheme theme) {
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Divider(color: theme.outline)),
        Text('or', style: TextStyle(color: theme.outline)),
        Expanded(child: Divider(color: theme.outline)),
      ],
    );
  }

  Widget buildSignUpWithServices() {
    return Column(
      spacing: 16,
      children: [
        GoogleSignInButton(onPressed: () {}),
        AppleSignInButton(onPressed: () {}),
      ],
    );
  }

  Widget buildTermsAndConditions(ColorScheme theme) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: theme.outline),
        text: 'By continuing you agree to Zoom\'s ',
        children: [
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              color: theme.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Open Terms of Service
              },
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: theme.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Open Privacy Policy
              },
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
