import 'package:cellula_task1/data/data_sources/firebase_auth_data_source.dart';
import 'package:cellula_task1/domain/repositories/auth_repository.dart';
import 'package:cellula_task1/data/repositories/auth_repository_impl.dart';
import 'package:cellula_task1/domain/use_cases/sign_in.dart';
import 'package:cellula_task1/domain/use_cases/sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(FirebaseAuthDataSource());
});

final signUpProvider = Provider<SignUp>((ref) {
  return SignUp(ref.read(authRepositoryProvider));
});

final loginProvider = Provider<SignIn>((ref) {
  return SignIn(ref.read(authRepositoryProvider));
});