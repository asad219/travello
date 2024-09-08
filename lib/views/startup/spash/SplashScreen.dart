import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: const Image(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/travello-logo.png"),
                          width: 100,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Find your best place for...",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .85,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 6,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
