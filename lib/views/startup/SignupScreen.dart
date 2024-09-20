import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travello/appBlocs/showHideBloc/bloc/show_hide_bloc.dart';
import 'package:travello/appBlocs/showHideBloc/bloc/show_hide_event.dart';
import 'package:travello/appBlocs/showHideBloc/bloc/show_hide_state.dart';
import 'package:travello/common/app_textbox.dart';

import '../../appBlocs/authBloc/auth_bloc.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/common/loading_widget.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../appBlocs/authBloc/auth_event.dart';
import '../../appBlocs/authBloc/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    bool isLoading = false;
    final authBloc = BlocProvider.of<AuthBloc>(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                "Signup",
                style: h4(AppColors.textDark),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: h4(AppColors.textDark),
                    ),
                    Text(
                      "Enter your details for \nSign up!",
                      style: normalText2(AppColors.textLight),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
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
                      "assets/icons/user.svg",
                      width: 20,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ShowHideBloc, ShowHideState>(
                builder: (context, state) {
                  return AppTextBox(
                      label: "Password",
                      hintText: "Enter password",
                      controller: passwordController,
                      obscureText: state.isShow,
                      isSuffixIcon: true,
                      //iconName:
                      customWidget: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<ShowHideBloc>()
                                .add(ShowHidePasswordEvent(!state.isShow));
                          },
                          child: SvgPicture.asset(
                            state.isShow
                                ? "assets/icons/password-show.svg"
                                : "assets/icons/password-hidden.svg",
                            width: 20,
                          ),
                        ),
                      ));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextBox(
                  label: "Mobie/Phone",
                  hintText: "Enter Mobile/Phone Number",
                  controller: phoneController,
                  obscureText: false,
                  isSuffixIcon: true,
                  customWidget: Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      "assets/icons/mobile-phone.svg",
                      width: 20,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              AppTextBox(
                  label: "Email",
                  hintText: "Enter Email Address",
                  controller: emailController,
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
                      title: isLoading ? "Loading..." : "Sign up",
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
                    Navigator.of(context).pop();
                  }
                },
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(loginRoute);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Already have an account? ",
                      style: normalText2(AppColors.textDark)),
                  const SizedBox(width: 8),
                  Text("Sign In",
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
