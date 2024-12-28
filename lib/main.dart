import 'package:flutter/material.dart';
import 'package:zoom_flutter/constants/constants.dart';
import 'package:zoom_flutter/features/onboarding/onboarding.dart';

void main() {
  runApp(ZoomApp());
}

class ZoomApp extends StatelessWidget {
  const ZoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: OnboardingScreen(),
    );
  }
}
