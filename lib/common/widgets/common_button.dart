import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.icon,
  });

  const CommonButton.icon({
    super.key,
    required this.icon,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return FilledButton.icon(
      icon: icon,
      style: FilledButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        backgroundColor: backgroundColor ?? theme.primary,
        foregroundColor: foregroundColor ?? theme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      label: child,
    );
  }
}
