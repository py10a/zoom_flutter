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
      style: ButtonStyle(
        elevation: WidgetStateProperty<double?>.fromMap(
          <WidgetStatesConstraint, double>{
            WidgetState.disabled: 0,
            WidgetState.hovered: 2,
            WidgetState.pressed: 6,
            WidgetState.any: 1,
          },
        ),
        minimumSize: WidgetStateProperty.all(
          Size(double.infinity, 48),
        ),
        backgroundColor: WidgetStateProperty<Color>.fromMap(
          backgroundColor != null
              ? <WidgetStatesConstraint, Color>{
                  WidgetState.any: backgroundColor!,
                  WidgetState.disabled: backgroundColor!.withAlpha(122),
                  WidgetState.hovered: backgroundColor!.withAlpha(200),
                  WidgetState.pressed: backgroundColor!.withAlpha(220),
                }
              : <WidgetStatesConstraint, Color>{
                  WidgetState.any: theme.primary,
                  WidgetState.disabled: theme.primary.withAlpha(122),
                  WidgetState.hovered: theme.primary.withAlpha(200),
                  WidgetState.pressed: theme.primary.withAlpha(220),
                },
        ),
        foregroundColor: WidgetStateProperty<Color>.fromMap(
          foregroundColor != null
              ? <WidgetStatesConstraint, Color>{
                  WidgetState.any: foregroundColor!,
                  WidgetState.disabled: foregroundColor!.withAlpha(122),
                  WidgetState.hovered: foregroundColor!.withAlpha(200),
                  WidgetState.pressed: foregroundColor!.withAlpha(220),
                }
              : <WidgetStatesConstraint, Color>{
                  WidgetState.any: theme.onPrimary,
                  WidgetState.disabled: theme.onPrimary.withAlpha(122),
                  WidgetState.hovered: theme.onPrimary.withAlpha(200),
                  WidgetState.pressed: theme.onPrimary.withAlpha(220),
                },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: onPressed,
      label: child,
    );
  }
}
