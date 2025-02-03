import 'package:flutter/material.dart';

class HomeScreenMeetingButtons extends StatelessWidget {
  const HomeScreenMeetingButtons({
    super.key,
    required this.title,
    required this.iconData,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String title;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        InkWell(
          onTap: onTap,
          splashFactory: NoSplash.splashFactory,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x802C76FF),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              iconData,
              size: 32,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
