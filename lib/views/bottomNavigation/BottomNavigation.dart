import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travello/appBlocs/bottomNavigationBloc/bloc/bottom_navigation_bloc.dart';
import 'package:travello/theme/styles.dart';
import 'package:travello/views/navigation/HomeScreen.dart';
import 'package:travello/views/navigation/InboxScreen.dart';
import 'package:travello/views/navigation/ProfileScreen.dart';
import 'package:travello/views/navigation/SavedScreen.dart';
import 'package:travello/views/navigation/TripsScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        List screens = [
          const Homescreen(),
          const TripsScreen(),
          const SavedScreen(),
          const InboxScreen(),
          const ProfileScreen()
        ];
        return Scaffold(
          body: screens[state.currentIndex],
          bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              currentIndex: state.currentIndex,
              onTap: (index) {
                print(index);
                context
                    .read<BottomNavigationBloc>()
                    .add(ChangePageIndexEvent(index));
              },
              backgroundColor: AppColors.primaryColor,
              selectedItemColor: AppColors.primaryColor,
              selectedLabelStyle: smallText2(AppColors.textDark),
              unselectedLabelStyle: smallText2(AppColors.primaryColor),
              unselectedItemColor: Colors.grey,
              elevation: 8.0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/explore.svg",
                      height: 20,
                    ),
                    label: "EXPLORE"),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset("assets/icons/trips.svg", height: 20),
                    label: "TRIPS"),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset("assets/icons/saved.svg", height: 20),
                    label: "SAVED"),
                BottomNavigationBarItem(
                    icon:
                        SvgPicture.asset("assets/icons/inbox.svg", height: 20),
                    label: "INBOX"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/user.svg", height: 20),
                    label: "PROFILE")
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, BottomNavigationState state) {},
    );
  }
}
