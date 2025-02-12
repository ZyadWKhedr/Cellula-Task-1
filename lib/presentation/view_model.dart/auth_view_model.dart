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
    if (!_validateInputs(email, password)) return;

    state = AuthState.loading();
    try {
      final user = await loginUseCase(email, password);
      if (user != null) {
        state = AuthState.authenticated(user, message: "Login successful");
      } else {
        state = AuthState.error("Invalid email or password");
      }
    } catch (e) {
      state = AuthState.error("Login failed: $e");
    }
  }

  Future<void> signUp(String email, String password, String fullName) async {
    if (!_validateInputs(email, password, fullName)) return;

    state = AuthState.loading();
    try {
      final user = await signUpUseCase(email, password);
      if (user != null) {
        await user.updateDisplayName(fullName); // ✅ Set full name in Firebase
        state = AuthState.authenticated(user, message: "Sign-up successful");
      } else {
        state = AuthState.error("Sign-up failed");
      }
    } catch (e) {
      state = AuthState.error("Sign-up failed: $e");
    }
  }

  bool _validateInputs(String email, String password, [String? fullName]) {
    if (email.isEmpty) {
      state = AuthState.error("Email cannot be empty");
      return false;
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      state = AuthState.error("Invalid email format");
      return false;
    }

    if (password.isEmpty) {
      state = AuthState.error("Password cannot be empty");
      return false;
    }
    if (!RegExp(r"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password)) {
      state = AuthState.error(
          "Weak password. Must be at least 8 characters, include an uppercase letter, a number, and a special character");
      return false;
    }

    // Full name validation (only for sign-up)
    if (fullName != null && fullName.isEmpty) {
      state = AuthState.error("Full name cannot be empty");
      return false;
    }

    return true;
  }
}

// AuthState represents the state of authentication
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final User? user;

  AuthState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
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

  factory AuthState.authenticated(User user, {String? message}) => AuthState(
        isLoading: false,
        isAuthenticated: true,
        user: user,
        message: message,
      );

  factory AuthState.error(String error) => AuthState(
        isLoading: false,
        isAuthenticated: false,
        error: error,
      );
}

// Riverpod Provider for AuthViewModel
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    loginUseCase: ref.read(loginProvider),
    signUpUseCase: ref.read(signUpProvider),
  );
});
