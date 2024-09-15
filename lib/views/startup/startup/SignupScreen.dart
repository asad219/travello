import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../appBlocs/authBloc/auth_bloc.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/common/loading_widget.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../../appBlocs/authBloc/auth_event.dart';
import '../../../appBlocs/authBloc/auth_state.dart';

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
              const SizedBox(height: 40,),
              TextFormField(
                validator: (value) {},
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.primaryBackground,
                  hintStyle: TextStyle(color: AppColors.textDark),
                  hintText: "Username ",
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
              const SizedBox(height: 10,),
              TextFormField(
                validator: (value) {},
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.primaryBackground,
                  hintStyle: TextStyle(color: AppColors.textDark),
                  hintText: "Password ",
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
              const SizedBox(height: 10,),
              TextFormField(
                validator: (value) {},
                keyboardType: TextInputType.text,
                controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.primaryBackground,
                  hintStyle: TextStyle(color: AppColors.textDark),
                  hintText: "Mobile ",
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
              const SizedBox(height: 10,),
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
              const SizedBox(height: 40,),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * .85,
                  child: AppButton(

                      gradiant: const [
                        AppColors.primaryColor,
                        AppColors.primaryColor
                      ],
                      buttonRadius: 10,
                      title:  "Signup",
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
                        if(name.isNotEmpty && pass.isNotEmpty && email.isNotEmpty && phone.isNotEmpty){

                          authBloc.add(SignupEvent(name, pass,email,phone));

                        }else{
                          Fluttertoast.showToast(msg: 'All fields are mandatory');
                        }





                      })),

              const SizedBox(height: 25,),
              BlocConsumer<AuthBloc,AuthState>(
                builder:(context, state) {
                  if (state is AuthLoading) {
                    return Container(
                        height: 40,
                        width: 40,
                        child: LoadingWidget());
                  } else if (state is AuthFailure) {
                    return Text(
                      state.error, style: const TextStyle(color: Colors
                        .red, fontSize: 15),);
                  } else {
                    return const Text('');
                  }
                },
                listener: (BuildContext context, AuthState state) {
                  if(state is AuthSuccess){
                    // Navigator.of(context).pushNamedAndRemoveUntil(homeRoute , (route)=>false);
                    Navigator.of(context).pop();
                  }
                },

              ),


            ]),
          ),
        ),
      ),
      bottomNavigationBar:

      GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
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
                      style: normalText1(AppColors.textDark)),
                  const  SizedBox(width: 8),
                  Text("Login", style: h4(AppColors.textDark)),
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
