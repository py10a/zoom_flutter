import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoom_flutter/features/auth/services/auth_service.dart';

class EmailAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final providerType = AuthProviderType.email;

  @override
  Future<bool> signIn(
      AuthProviderType provider, Map<String, dynamic> credentials) async {
    try {
      if (provider != providerType) {
        throw UnimplementedError(
            'This service only supports email authentication.');
      }

      final String email = credentials['email'];
      final String password = credentials['password'];

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('SignIn Error: $e');
      return false;
    }
  }

  @override
  Future<bool> signUp(
      AuthProviderType provider, Map<String, dynamic> credentials) async {
    try {
      if (provider != providerType) {
        throw UnimplementedError(
            'This service only supports email authentication.');
      }

      final String email = credentials['email'];
      final String password = credentials['password'];

      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print('SignUp Error: $e');
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print('SignOut Error: $e');
      return false;
    }
  }
}
