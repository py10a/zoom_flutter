import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthProviderType {
  email,
  google,
  apple,
  // Add more providers as needed
}

///
/// Firebase Authentication Service
/// Provides methods for signing in, signing up, and signing out users.
///
interface class AuthService
    with ChangeNotifier
    implements LoginService, SignUpService, SignOutService {
  // Singleton instance
  static AuthService? instance;

  // Private constructor to prevent instantiation from outside
  AuthService._();

  factory AuthService() {
    instance ??= AuthService._();
    return instance!;
  }

  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  @override
  Future<bool> signIn(
      AuthProviderType provider, Map<String, dynamic> credentials) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(
      AuthProviderType provider, Map<String, dynamic> credentials) {
    throw UnimplementedError();
  }
}

abstract interface class LoginService {
  Future<bool> signIn(
      AuthProviderType provider, Map<String, dynamic> credentials);
}

abstract interface class SignUpService {
  Future<bool> signUp(
      AuthProviderType provider, Map<String, dynamic> credentials);
}

abstract interface class SignOutService {
  Future<bool> signOut();
}
