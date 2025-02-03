import 'package:zoom_flutter/features/auth/auth.dart';

class MockDataSource implements DataSource {
  @override
  Future<bool> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
