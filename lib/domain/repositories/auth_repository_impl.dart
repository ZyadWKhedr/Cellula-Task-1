import 'package:cellula_task1/data/data_sources/firebase_auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl {
  final FirebaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<User?> signUp(String email, String password) async {
    return _dataSource.signUp(email, password);
  }

  @override
  Future<User?> login(String email, String password) async {
    return _dataSource.signIn(email, password);
  }

  @override
  Future<void> logout() async {
    return _dataSource.logout();
  }
}
