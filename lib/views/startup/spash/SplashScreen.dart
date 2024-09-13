import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:travello/views/startup/welcome/WelcomeScreen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/images/travello-logo-splash.png",
          width: 220,
          height: 59,
        ),
        nextScreen: const WelcomeScreen(),
        splashIconSize: 150,
        duration: 2000,
        //splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        animationDuration: Duration(seconds: 2),
      ),
    );
  }
}
