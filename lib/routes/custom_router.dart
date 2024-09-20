import 'package:flutter/material.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/views/bottomNavigation/BottomNavigation.dart';
import 'package:travello/views/navigation/HomeScreen.dart';
import 'package:travello/views/startup/LoginScreen.dart';
import 'package:travello/views/startup/SignupScreen.dart';
import 'package:travello/views/startup/SplashScreen.dart';
import 'package:travello/views/startup/WelcomeScreen.dart';

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
        //return MaterialPageRoute(builder: (_) => const Homescreen());
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Homescreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case bottomNavigation:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BottomNavigationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
    }
    return null;
  }
}

//https://medium.com/@betulcihan/passing-data-to-a-named-route-with-flutter-346c5d387e64
