// presentation/viewmodel/auth_viewmodel.dart
import 'package:cellula_task1/domain/use_cases/sign_in.dart';
import 'package:cellula_task1/domain/use_cases/sign_up.dart';
import 'package:cellula_task1/presentation/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AuthViewModel extends StateNotifier<AuthState> {
  final SignIn loginUseCase;
  final SignUp signUpUseCase;

  AuthViewModel({
    required this.loginUseCase,
    required this.signUpUseCase,
  }) : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    state = AuthState.loading();
    try {
      final user = await loginUseCase(email, password);
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.error("Login failed");
      }
    } catch (e) {
      state = AuthState.error("Login failed: $e");
    }
  }

  Future<void> signUp(String email, String password) async {
    state = AuthState.loading();
    try {
      final user = await signUpUseCase(email, password);
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = AuthState.error("Sign-up failed");
      }
    } catch (e) {
      state = AuthState.error("Sign-up failed: $e");
    }
  }
}

// AuthState represents the state of the authentication process
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final User? user;

  AuthState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.user,
  });

  factory AuthState.initial() => AuthState(
        isLoading: false,
        isAuthenticated: false,
      );

  factory AuthState.loading() => AuthState(
        isLoading: true,
        isAuthenticated: false,
      );

  factory AuthState.authenticated(User user) => AuthState(
        isLoading: false,
        isAuthenticated: true,
        user: user,
      );

  factory AuthState.error(String error) => AuthState(
        isLoading: false,
        isAuthenticated: false,
        error: error,
      );
}

// Riverpod Provider for AuthViewModel
final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    loginUseCase: ref.read(loginProvider),
    signUpUseCase: ref.read(signUpProvider),
  );
});