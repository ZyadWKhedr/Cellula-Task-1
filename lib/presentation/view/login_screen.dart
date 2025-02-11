// presentation/view/login_screen.dart
import 'package:cellula_task1/core/const/app_colors.dart';
import 'package:cellula_task1/presentation/view_model.dart/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.primaryColor,
          AppColors.secondaryColor,
        ])),
      ),
    );
  }
}
