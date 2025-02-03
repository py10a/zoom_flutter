abstract interface class AuthService {
  Future signIn(AuthServiceProvider provider);
  Future signUp();
  Future signOut();
  Stream authStateChanges();
}

enum AuthServiceProvider {
  google,
  email,
}
