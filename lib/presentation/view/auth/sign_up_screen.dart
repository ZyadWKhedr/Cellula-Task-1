import 'package:cellula_task1/core/const/app_colors.dart';
import 'package:cellula_task1/core/const/dimensions.dart';
import 'package:cellula_task1/core/routes/app_routes.dart';
import 'package:cellula_task1/core/widgets/custom_text_widget.dart';
import 'package:cellula_task1/presentation/view/auth/widgets/custom_button.dart';
import 'package:cellula_task1/presentation/view/auth/widgets/custom_text_field.dart';
import 'package:cellula_task1/presentation/view_model.dart/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Dimensions.screenWidth(context),
          height: Dimensions.screenHeight(context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'SIGN UP',
                fontSize: Dimensions.font50(context) * 1.3,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'CREATE AN ACCOUNT TO MAKE SDFSDF',
                color: Colors.white54,
              ),
              SizedBox(
                height: Dimensions.height50(context),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240, bottom: 10),
                child: CustomText(
                  text: 'FULL NAME',
                  color: Colors.white,
                  fontSize: Dimensions.font20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                textColor: Colors.white,
                backgroundColor: Colors.white38,
                controller: _nameController,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 290, bottom: 10, top: 15),
                child: CustomText(
                  text: 'Email',
                  color: Colors.white,
                  fontSize: Dimensions.font20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                textColor: Colors.white,
                backgroundColor: Colors.white38,
                controller: _emailController,
              ),
              SizedBox(height: Dimensions.height20(context)),
              Padding(
                padding: const EdgeInsets.only(right: 250, bottom: 10),
                child: CustomText(
                  text: 'Password',
                  color: Colors.white,
                  fontSize: Dimensions.font20(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextField(
                textColor: Colors.white,
                backgroundColor: Colors.white38,
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(
                height: Dimensions.height50(context),
              ),
              CustomButton(
                  text: 'Next',
                  width: Dimensions.screenWidth(context) / 1.35,
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (authState.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(authState.error!),
                              backgroundColor: Colors.red),
                        );
                      }
                      if (authState.message != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(authState.message!),
                              backgroundColor: Colors.green),
                        );
                        context.go(AppRoutes.home);
                      }
                    });
                    authViewModel.signUp(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim(),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: CustomText(
                    text: 'HAVE AN ACCOUNT ?',
                    color: Colors.blueAccent,
                    fontSize: Dimensions.font14(context),
                  ),
                  onTap: () => context.go(AppRoutes.signin),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
