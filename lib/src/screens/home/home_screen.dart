import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/custom_nav_bar.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/main_view/main_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/menu_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/more_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/offers_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/profile_view.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = NotchBottomBarController();
  final int maxCount = 5;

  final List<Widget> _screens = [
    MenuView(),
    OffersView(),
    MainView(),
    ProfileView(),
    MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screens[_controller.index],
        extendBody: true,
        bottomNavigationBar:
            CustomNavBar(
              controller: _controller,
              onTap: (index) {
                setState(() {
                  _controller.index = index;
                });
              },
            ),
      ),
    );
  }
}









