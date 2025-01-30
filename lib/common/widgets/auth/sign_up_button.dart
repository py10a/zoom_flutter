import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CommonButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? theme.secondary,
      foregroundColor: foregroundColor ?? theme.onSecondary,
      child: Text('Sign up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
