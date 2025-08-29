import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';
import 'package:zoom_flutter/features/auth/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  buildEmailSignUp(context),
                  buildOrDivider(context),
                  buildSignUpWithServices(context),
                ],
              ),
              const SizedBox(height: 32),
              buildTermsAndConditions(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _signUp(
    BuildContext context,
    AuthProviderType provider,
    Map<String, dynamic> credentials,
  ) async {
    final success =
        await GetIt.instance<AuthService>().signUp(provider, credentials);
    if (success && context.mounted) {
      context.pushReplacementNamed('home');
    }
    return success;
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

  Column buildEmailSignUp(BuildContext context) {
    return Column(
      children: [
        EmailTextField(controller: emailController),
        const SizedBox(height: 16),
        PasswordTextField(controller: passwordController),
        const SizedBox(height: 24),
        SignUpButton(
          onPressed: () {
            final email = emailController.text.trim();
            final password = passwordController.text;
            _signUp(
              context,
              AuthProviderType.email,
              {'email': email, 'password': password},
            );
          },
        )
      ],
    );
  }

  Row buildOrDivider(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Row(
      spacing: 8,
      children: [
        Expanded(child: Divider(color: theme.outline)),
        Text('or', style: TextStyle(color: theme.outline)),
        Expanded(child: Divider(color: theme.outline)),
      ],
    );
  }

  Widget buildSignUpWithServices(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        GoogleSignInButton(
          onPressed: () => _signUp(context, AuthProviderType.google, {}),
        ),
        AppleSignInButton(
          onPressed: () => _signUp(context, AuthProviderType.apple, {}),
        ),
      ],
    );
  }

  Widget buildTermsAndConditions(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

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
            recognizer: TapGestureRecognizer()..onTap = _openTermsAndConditions,
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              color: theme.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = _openPrivacyPolicy,
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  void _openTermsAndConditions() async {
    final url = Uri.parse('https://www.zoom.com/en/trust/terms/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  void _openPrivacyPolicy() async {
    final url =
        Uri.parse('https://explore.zoom.us/docs/ent/privacy-and-legal.html');
    debugPrint('Opening $url');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
