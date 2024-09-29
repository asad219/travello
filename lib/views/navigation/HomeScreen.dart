import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travello/theme/styles.dart';
import 'package:travello/views/navigation/home_widgets/cityList.dart';
import 'package:travello/views/navigation/home_widgets/homeBanner.dart';
import 'package:travello/views/navigation/home_widgets/homeHeader.dart';
import 'package:travello/views/navigation/home_widgets/popularTours.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        HomeHeader(),
        HomeBanner(),
        CityList(),
        PopularTours()
      ]),
    ));
  }
}
