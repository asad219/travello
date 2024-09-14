import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/theme/styles.dart';

class LoginScreen extends StatefulWidget {
  final int? count = 0;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args['email']);
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 16),
              Image(
                image: AssetImage("assets/images/travello-logo-splash.png"),
                height: 100,
              ),
              SizedBox(height: 16),
              Text(
                "Welcome,",
                style: h4(AppColors.textDark),
              ),
              TextFormField(
                validator: (value) {},
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.primaryBackground,
                  hintStyle: TextStyle(color: AppColors.textDark),
                  hintText: "Email ",
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  // labelText: 'Username',
                  // labelStyle: TextStyle(color: gt.primaryColor),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Don't have an account? ",
                    style: normalText1(AppColors.textDark)),
                SizedBox(width: 8),
                Text("Sign Up", style: h4(AppColors.textDark)),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
