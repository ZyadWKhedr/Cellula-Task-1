// data/repositories/auth_repository_impl.dart
import 'package:cellula_task1/data/data_sources/firebase_auth_data_source.dart';
import 'package:cellula_task1/domain/repositories/auth_repository.dart';
import 'package:cellula_task1/domain/use_cases/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<User?> signUp(String email, String password) async {
    return _dataSource.signUp(email, password);
  }

  @override
  Future<User?> signIn(String email, String password) async {
    return _dataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return _dataSource.logout();
  }

}