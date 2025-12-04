import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mock_user/mock_user.dart'; // A package for creating mock user objects
import 'package:zoom_flutter/features/auth/auth.dart';

import 'package.dart';

class MockAuthService implements AuthService {
  // Use a StreamController to manage the auth state stream
  final _authStateController = StreamController<User?>.broadcast();
  User? _currentUser;

  @override
  Stream<User?> authStateChanges() => _authStateController.stream;

  @override
  Future<bool> signIn(
      AuthProviderType provider, Map<String, dynamic> credentials) async {
    // Simulate a successful sign-in
    _currentUser = MockUser(
      isAnonymous: false,
      uid: 'mock_uid',
      email: 'mock_user@example.com',
      displayName: 'Mock User',
    );
    _authStateController.add(_currentUser);
    return true; // Indicate success
  }

  @override
  Future<bool> signOut() async {
    // Simulate a sign-out
    _currentUser = null;
    _authStateController.add(null);
    return true; // Indicate success
  }

  @override
  Future<bool> signUp(
      AuthProviderType provider, Map<String, dynamic> credentials) async {
    // For many tests, signUp can behave similarly to signIn
    return signIn(provider, credentials);
  }

  // It's good practice to close the stream controller in dispose
  @override
  void dispose() {
    _authStateController.close();
  }

  // The rest of the methods can often be ignored for basic tests
  // or implemented with minimal logic if needed.
  @override
  void addListener(VoidCallback listener) {}

  @override
  bool get hasListeners => false;

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}
}
