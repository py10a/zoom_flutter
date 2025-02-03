abstract interface class DataSource {
  Future<bool> signIn();
  Future<bool> signUp();
  Future<bool> signOut();
}
