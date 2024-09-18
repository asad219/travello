import 'package:flutter/material.dart';
import 'package:travello/common/app_button.dart';
import 'package:travello/routes/route_constants.dart';
import 'package:travello/theme/styles.dart';
import 'package:travello/views/startup/startup/LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

//Define Variables
bool isLoading = false;

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: const Image(
            image: AssetImage("assets/images/splashbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage("assets/images/travello-logo.png"),
                          width: 100,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Find your best place for...",
                          style: h4(AppColors.textWhite),
                        )
                      ],
                    ),
                  )),
              Column(
                children: [
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
                          title: "Get Started",
                          titleColor: AppColors.textWhite,
                          leadingIcon: const Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.textWhite,
                          ),
                          onTap: () async {
                            setState(() {
                              isLoading = !isLoading;
                            });
                            // Navigator.of(context).pushNamedAndRemoveUntil(
                            //     loginRoute, (route) => false,
                            //     arguments: ({
                            //       'email': 'asad219@hotmail.com',
                            //       'name': 'Asad Khan'
                            //     }));
                            Navigator.of(context)
                                .pushReplacementNamed(loginRoute);
                          }))
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ]),
    );
  }
}
