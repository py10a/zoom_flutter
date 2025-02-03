import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zoom_flutter/constants/constants.dart';
import 'package:zoom_flutter/features/auth/auth.dart';
import 'package:zoom_flutter/features/home/home.dart';
import 'package:zoom_flutter/firebase_options.dart';
import 'package:zoom_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetItInit.init();
  BlocInit.init();

  runApp(ZoomApp());
}

class ZoomApp extends StatelessWidget {
  const ZoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GetIt.I.get<AuthService>().authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return MaterialApp.router(
            title: 'Zoom',
            theme: lightTheme,
            darkTheme: darkTheme,
            routerConfig:
                homeRouter // snapshot.hasData ? homeRouter : authRouter,
            );
      },
    );
  }
}

class BlocInit {
  static void init() {
    Bloc.observer = BottomNavObserver();
  }
}

class GetItInit {
  static void init() {
    GetIt.I.registerSingleton<AuthService>(
      AuthRepository(
        googleSignIn: GoogleSignInDataSource(),
      ),
    );
  }
}
