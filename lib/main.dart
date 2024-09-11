import 'package:flutter/material.dart';
import 'package:travello/helper/Utils.dart';
import 'package:travello/views/startup/login/LoginScreen.dart';
import 'package:travello/views/startup/signup/SignupScreen.dart';
import 'package:travello/views/startup/spash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Utils.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const SplashScreen(),
          "/login": (context) => const LoginScreen(),
          "/signup": (context) => const SignupScreen()
        }
        //,
        //home: const SplashScreen(),
        );
  }
}
