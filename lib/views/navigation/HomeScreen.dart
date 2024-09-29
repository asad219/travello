import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travello/appBlocs/homeBloc/home_bloc.dart';
import 'package:travello/appBlocs/homeBloc/home_event.dart';
import 'package:travello/theme/styles.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {

    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .3,
          child: const Image(
            image: AssetImage("assets/images/rome-banner.jpg"),
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
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: AppColors.whiteColor.withOpacity(.5),
                            ),
                            Icon(Icons.search,
                                color: AppColors.whiteColor.withOpacity(.5)),
                          ],
                        )
                      ],
                    ),
                  )),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        homeBloc.add(GetPlacesEvent("All"));
                      },
                      child: const Text("Get Places")),
                  Text('ok')

                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ]),
    );
  }
}
