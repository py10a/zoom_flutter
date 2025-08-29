enum AuthProviderType {
  email,
  google,
  apple,
  // Add more providers as needed
}

abstract interface class AuthService {
  Future<bool> signIn(
      AuthProviderType provider, Map<String, dynamic> credentials);

  Future<bool> signUp(
      AuthProviderType provider, Map<String, dynamic> credentials);

  Future<bool> signOut();
}
