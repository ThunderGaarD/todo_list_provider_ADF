import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgorPassword(String email);
  Future<User?> googleLogin();
  Future<void> logout();
  Future<void> updateDisplayName(String name);

}
