import 'package:cellula_task1/core/const/app_colors.dart';
import 'package:cellula_task1/core/const/dimensions.dart';
import 'package:cellula_task1/core/routes/app_routes.dart';
import 'package:cellula_task1/presentation/view/auth/widgets/custom_button.dart';
import 'package:cellula_task1/presentation/view/auth/widgets/middle_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupOrLoginScreen extends StatelessWidget {
  const SignupOrLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: MiddleCurveClipper(
              curveHeight: Dimensions.height50(context) * 1.5,
            ),
            child: Container(
              width: double.infinity,
              height: Dimensions.height50(context) * 8,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.height50(context) *
                  1.5, 
              left: Dimensions.width50(context) * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  text: 'Sign up',
                  width: Dimensions.screenWidth(context) / 1.35,
                  onPressed: () => context.go(AppRoutes.signin),
                ),
                SizedBox(
                  height: Dimensions.height20(context), 
                ),
                CustomButton(
                  text: 'Log in',
                  width: Dimensions.screenWidth(context) / 1.35,
                  color: Colors.white,
                  textColor: AppColors.primaryColor,
                  onPressed: () => context.go(AppRoutes.signin),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
