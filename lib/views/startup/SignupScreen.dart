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
import '../../appBlocs/showHideBlocInvd/show_hide_bloc.dart';
import '../../appBlocs/showHideBlocInvd/show_hide_event.dart';
import '../../appBlocs/showHideBlocInvd/show_hide_state.dart';

class SignupScreen extends StatefulWidget {
  final int? count = 0;
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
bool isLoading = false;

class _SignupScreenState extends State<SignupScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 16),
              Text(
                "Sign Up",
                style: h3(AppColors.textDark),
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
                      "Enter your personal information \nand explore the world!",
                      style: normalText2(AppColors.textLight),
                    ),
                  ],
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Container(
                        height: 40, width: 40, child: LoadingWidget());
                  } else if (state is AuthFailure) {
                    return SizedBox(
                      height: 40,
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    );
                  } else {
                    return const SizedBox(height: 40);
                  }
                },
                listener: (BuildContext context, AuthState state) {
                  if (state is AuthSuccess) {
                    // Navigator.of(context).pushNamedAndRemoveUntil(homeRoute , (route)=>false);
                    Navigator.of(context).pushReplacementNamed(homeRoute);
                  }
                },
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
                height: 20,
              ),
              BlocBuilder<ShowHideBloc, ShowHideStateI>(
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
                height: 20,
              ),
              AppTextBox(
                  label: "Mobile/Phone",
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
                height: 20,
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
                height: 20,
              ),
              SizedBox(
                  child: AppButton(
                      state: isLoading ? ButtonState.loading : ButtonState.idle,
                      gradiant: const [
                        AppColors.primaryColor,
                        AppColors.primaryColor
                      ],
                      buttonRadius: 30,
                      title: isLoading ? "Loading..." : "Sign Up",
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
                        String email = emailController.text.toString();
                        String phone = phoneController.text.toString();
                        if (name.isNotEmpty &&
                            pass.isNotEmpty &&
                            email.isNotEmpty &&
                            phone.isNotEmpty) {
                          authBloc.add(SignupEvent(name, pass, email, phone));
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
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
