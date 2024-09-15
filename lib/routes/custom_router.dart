import 'package:flutter/material.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/views/startup/startup/HomeScreen.dart';
import 'package:travello/views/startup/startup/LoginScreen.dart';
import 'package:travello/views/startup/startup/SignupScreen.dart';
import 'package:travello/views/startup/startup/SplashScreen.dart';
import 'package:travello/views/startup/startup/WelcomeScreen.dart';

class CustomRouter {
  static Route<dynamic>? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
    return null;
  }
}

//https://medium.com/@betulcihan/passing-data-to-a-named-route-with-flutter-346c5d387e64
