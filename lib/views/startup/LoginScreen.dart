import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/common/app_textbox.dart';
import 'package:travello/common/loading_widget.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../appBlocs/authBloc/auth_bloc.dart';
import '../../appBlocs/authBloc/auth_event.dart';
import '../../appBlocs/authBloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  final int? count = 0;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isLoading = false;

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
    final authBloc = BlocProvider.of<AuthBloc>(context);
    bool showHidePassword = ShowHidePasswordState().showHidePassword;
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
                "Sign In",
                style: h3(AppColors.textDark),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wolcome to Travello",
                      style: h4(AppColors.textDark),
                    ),
                    Text(
                      "Enter username and password \nand explore the world!",
                      style: normalText2(AppColors.textLight),
                    ),
                  ],
                ),
              ),
              AppTextBox(
                  label: "Username",
                  hintText: "Enter username",
                  controller: usernameController,
                  obscureText: false,
                  isSuffixIcon: true,
                  customWidget: Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      "assets/icons/mail.svg",
                      width: 20,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return AppTextBox(
                      label: "Password",
                      hintText: "Enter password",
                      controller: passwordController,
                      obscureText: ShowHidePasswordState().showHidePassword,
                      isSuffixIcon: true,
                      //iconName:
                      customWidget: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            print(showHidePassword);
                            if (ShowHidePasswordState().showHidePassword) {
                              authBloc.add(ShowHidePasswordEvent(false));
                            } else {
                              authBloc.add(ShowHidePasswordEvent(true));
                            }
                          },
                          child: SvgPicture.asset(
                            showHidePassword
                                ? "assets/icons/password-show.svg"
                                : "assets/icons/password-hidden.svg",
                            width: 20,
                          ),
                        ),
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  child: AppButton(
                      state: isLoading ? ButtonState.loading : ButtonState.idle,
                      gradiant: const [
                        AppColors.primaryColor,
                        AppColors.primaryColor
                      ],
                      buttonRadius: 30,
                      title: isLoading ? "Loading..." : "Login",
                      titleColor: AppColors.textWhite,
                      leadingIcon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.textWhite,
                      ),
                      onTap: () async {
                        // setState(() {
                        //   isLoading = !isLoading;
                        // });

                        String name = usernameController.text.toString();
                        String pass = passwordController.text.toString();
                        if (name.isNotEmpty && pass.isNotEmpty) {
                          authBloc.add(LoginEvent(name, pass));
                        } else {
                          Fluttertoast.showToast(
                              msg: 'All fields are mandatory');
                        }
                      })),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  "OR",
                  style: smallText2(AppColors.textDark.withOpacity(.5)),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/icons/facebook.png"),
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage("assets/icons/google.png"),
                    width: 35,
                  ),
                ],
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Container(
                        height: 40, width: 40, child: LoadingWidget());
                  } else if (state is AuthFailure) {
                    return Text(
                      state.error,
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    );
                  } else {
                    return const Text('');
                  }
                },
                listener: (BuildContext context, AuthState state) {
                  if (state is AuthSuccess) {
                    // Navigator.of(context).pushNamedAndRemoveUntil(homeRoute , (route)=>false);
                    Navigator.of(context).pushReplacementNamed(homeRoute);
                  }
                },
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(signupRoute);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Don't have an account? ",
                      style: normalText2(AppColors.textDark)),
                  const SizedBox(width: 8),
                  Text("Sign Up",
                      style: normalText2Bold(AppColors.primaryColor)),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
