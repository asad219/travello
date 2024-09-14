import 'package:flutter/material.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/views/startup/login/LoginScreen.dart';
import 'package:travello/views/startup/signup/SignupScreen.dart';
import 'package:travello/views/startup/spash/SplashScreen.dart';
import 'package:travello/views/startup/welcome/WelcomeScreen.dart';

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
    }
    return null;
  }
}

//https://medium.com/@betulcihan/passing-data-to-a-named-route-with-flutter-346c5d387e64
