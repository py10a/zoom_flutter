import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoom_flutter/features/auth/auth.dart';

class AuthRepository implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignInDataSource googleSignIn;

  AuthRepository({
    required this.googleSignIn,
  });

  @override
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  @override
  Future<bool> signIn(AuthServiceProvider provider) async {
    switch (provider) {
      case AuthServiceProvider.google:
        return await googleSignIn.signIn();
      case AuthServiceProvider.email:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Future<bool> signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
    return true;
  }

  @override
  Future<bool> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
