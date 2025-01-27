import 'package:flutter/material.dart';
import 'package:zoom_flutter/constants/constants.dart';
import 'package:zoom_flutter/routes/routes.dart';

void main() {
  runApp(ZoomApp());
}

class ZoomApp extends StatelessWidget {
  const ZoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zoom',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
