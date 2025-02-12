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

class LoginScreen extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      body: Container(
        width: Dimensions.screenWidth(context),
        height: Dimensions.screenHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height50(context),
            ),
            CustomText(
              text: 'LOG IN',
              fontSize: Dimensions.font50(context),
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'CREATE AN ACCOUNT TO MAKE SDFSDF',
              fontSize: Dimensions.font16(context),
              color: Colors.white70,
            ),
            SizedBox(height: Dimensions.height10(context)),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.width50(context)),
                        topRight: Radius.circular(Dimensions.width50(context)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.width20(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: 'Email',
                              color: AppColors.primaryColor,
                              fontSize: Dimensions.font20(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextField(
                            controller: _emailController,
                          ),
                          SizedBox(height: Dimensions.height20(context)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: 'Password',
                              color: AppColors.primaryColor,
                              fontSize: Dimensions.font20(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CustomTextField(
                            controller: _passwordController,
                            isPassword: true,
                          ),
                          SizedBox(
                            height: Dimensions.height50(context),
                          ),
                          Center(
                            child: CustomButton(
                                text: 'LOG IN',
                                width: Dimensions.screenWidth(context) / 1.35,
                                onPressed: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (authState.error != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(authState.error!),
                                            backgroundColor: Colors.red),
                                      );
                                    }
                                    if (authState.message != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(authState.message!),
                                            backgroundColor: Colors.green),
                                      );
                                      context.go(AppRoutes.home);
                                    }
                                  });
                                  authViewModel.login(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
