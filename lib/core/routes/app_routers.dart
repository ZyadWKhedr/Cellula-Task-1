import 'package:cellula_task1/presentation/view/auth/login_screen.dart';
import 'package:cellula_task1/presentation/view/home/home_screen.dart';
import 'package:cellula_task1/presentation/view/signup_or_login_screen.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.signupOrLogin,
      builder: (context, state) {
        return SignupOrLoginScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.signin,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
  ],
);
