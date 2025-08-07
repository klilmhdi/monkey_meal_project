import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/home/component/custom_navigation_item.dart';
import 'package:monkey_meal_project/src/screens/menu_screen/menu_screen.dart';
import 'package:monkey_meal_project/src/screens/more_screen/more_screen.dart';
import 'package:monkey_meal_project/src/screens/offer_screen/offer_screen.dart';
import 'package:monkey_meal_project/src/screens/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget{
  static String routeName="/home";
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  List<Widget> screen_options=[MenuScreen(),
    HomeScreen(),
    OfferScreen(),

  ProfileScreen(),MoreScreen()];
  int _selectedIndex =0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () => _onItemTapped(2), // Home button, always navigates to index 2
      backgroundColor: Colors.white,
      child: const Icon(Icons.home, color: Colors.black54),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      shape: const CircularNotchedRectangle(), // Creates the curved notch for the FAB
      notchMargin: 8.0,
      height: 90,// Space between the FAB and the bottom app bar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavigationItem(icon:  Icons.grid_view,
              onTap: ()=>_onItemTapped(0),
              label: 'Menu',index:  0),
          CustomNavigationItem(icon:  Icons.shopping_bag,
              onTap: ()=>_onItemTapped(1),
              label:  'Offers',index:  1),
          // The middle is empty to make space for the FAB
          const SizedBox(width: 48),
          CustomNavigationItem(icon: Icons.person,
              onTap: ()=>_onItemTapped(3),
              label: 'Profile',index:  3, isHighlighted: true), // Profile is highlighted
          CustomNavigationItem(icon:  Icons.more_horiz,
              onTap: ()=>_onItemTapped(4),
              label:  'More',index:  4),
        ],
      ),
    ),
    body:screen_options[_selectedIndex]
      ,
  );
  }
}