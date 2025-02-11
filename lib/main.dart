import 'package:cellula_task1/presentation/view/login_screen.dart';
import 'package:cellula_task1/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the app
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth with Clean Architecture + MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Set the initial screen to LoginScreen
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(), // Add your sign-up screen
      },
    );
  }
}