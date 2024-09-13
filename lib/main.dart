import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travello/helper/Utils.dart';
import 'package:travello/routes/custom_router.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';
import 'package:travello/views/startup/login/LoginScreen.dart';
import 'package:travello/views/startup/signup/SignupScreen.dart';
import 'package:travello/views/startup/welcome/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
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
          fontFamily: 'Montserrat',
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: splashRoute,
        builder: EasyLoading.init());
  }
}



 // routes: {
        //   "/": (context) => SplashScreen(),
        //   "/login": (context) => LoginScreen(),
        //   "/signup": (context) => SignupScreen()
        // }

        //,
        //home: const SplashScreen(),