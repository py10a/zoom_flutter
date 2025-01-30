import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zoom_flutter/constants/constants.dart';
import 'package:zoom_flutter/features/auth/services/auth_service.dart';
import 'package:zoom_flutter/features/auth/services/google_auth_service.dart';
import 'package:zoom_flutter/firebase_options.dart';
import 'package:zoom_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.instance.registerSingleton<AuthService>(
    GoogleAuthService(),
  );

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
