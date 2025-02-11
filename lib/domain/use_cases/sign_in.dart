import 'package:cellula_task1/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<User?> call(String email, String password) async {
    return repository.signIn(email, password);
  }
}