abstract interface class AuthService {
  Future<bool> signIn();
  Future<bool> signUp();
  Future<bool> signOut();
}
