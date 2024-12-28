import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return CommonButton(
      onPressed: onPressed,
      backgroundColor: theme.secondary,
      foregroundColor: theme.onSecondary,
      child: Text('Sign in',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return CommonButton(
      onPressed: onPressed,
      backgroundColor: theme.secondary,
      foregroundColor: theme.onSecondary,
      child: Text('Sign up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}

class JoinMeetingButton extends StatelessWidget {
  const JoinMeetingButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return CommonButton(
      onPressed: onPressed,
      backgroundColor: theme.primary,
      foregroundColor: theme.onPrimary,
      child: Text('Join a meeting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
