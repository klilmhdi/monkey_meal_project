import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:monkey_meal_project/src/screens/home/component/custom_navigation_item.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/main_view.dart';
import 'package:monkey_meal_project/src/screens/home/views/menu_view.dart';
import 'package:monkey_meal_project/src/screens/home/views/more_view/more_view.dart';
import 'package:monkey_meal_project/src/screens/home/views/offer_view/offer_view.dart';
import 'package:monkey_meal_project/src/screens/home/views/profile_view/profile_view.dart';




class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  List<Widget> screen_options=[MenuView(),    OfferView(),

    MainView(),

    ProfileView(),MoreView()];
  int _selectedIndex =0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      bottom: false,
      child:   Scaffold(
    /*    floatingActionButton: FloatingActionButton(
          onPressed: () => _onItemTapped(2),
          // Home button, always navigates to index 2
          backgroundColor: Colors.white,
          child: const Icon(Icons.home, color: Colors.black54),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
        bottomNavigationBar:
        CustomBottomNavBar(onTap:(index){
          _onItemTapped(index);
        },currentIndex: 0,),

        /* BottomAppBar(
          shape: const CircularNotchedRectangle(),
          // Creates the curved notch for the FAB
          notchMargin: 8.0,
          height: 90,
          // Space between the FAB and the bottom app bar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomNavigationItem(icon: Icons.grid_view,
                  onTap: () => _onItemTapped(0),
                  label: 'Menu', index: 0),
              CustomNavigationItem(icon: Icons.shopping_bag,
                  onTap: () => _onItemTapped(1),
                  label: 'Offers', index: 1),
              // The middle is empty to make space for the FAB
              const SizedBox(width: 48),
              CustomNavigationItem(icon: Icons.person,
                  onTap: () => _onItemTapped(3),
                  label: 'Profile',
                  index: 3,
                  isHighlighted: true), // Profile is highlighted
              CustomNavigationItem(icon: Icons.more_horiz,
                  onTap: () => _onItemTapped(4),
                  label: 'More', index: 4),
            ],
          ),
        ),*/
        body: screen_options[_selectedIndex]
        ,),
    );
  }}







