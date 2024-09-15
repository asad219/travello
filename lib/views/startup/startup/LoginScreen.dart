import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/common/loading_widget.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../appBlocs/authBloc/auth_bloc.dart';
import '../../../appBlocs/authBloc/auth_event.dart';
import '../../../appBlocs/authBloc/auth_state.dart';

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
                  const SizedBox(height: 15,),
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
                  const SizedBox(height: 40,),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * .85,
                      child: AppButton(
                          state: isLoading
                              ? ButtonState.loading
                              : ButtonState.idle,
                          gradiant: const [
                            AppColors.primaryColor,
                            AppColors.primaryColor
                          ],
                          buttonRadius: 10,
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
                            if(name.isNotEmpty && pass.isNotEmpty){

                              authBloc.add(LoginEvent(name, pass));

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
                          Navigator.of(context).pushReplacementNamed(homeRoute);
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
                      style: normalText1(AppColors.textDark)),
                 const  SizedBox(width: 8),
                  Text("Sign Up", style: h4(AppColors.textDark)),
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
