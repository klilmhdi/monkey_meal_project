import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

    static String routeName = "/home";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeScreen')),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/custom_nav_bar/custom_bottom_nav_bar.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/main_view/main_view.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/menu_view.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/more_view.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/offers_view.dart';
// import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/profile_view.dart';
//
// class HomeScreen extends StatefulWidget {
//   static String routeName = "/home";
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   final int maxCount = 5;
//   int currentIndex = 2; // Default to MainView
//
//   final List<Widget> _screens = [
//     MenuView(),
//     OffersView(),
//     MainView(),
//     ProfileView(),
//     MoreView(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         bottom: false, // Important: don't apply safe area to bottom
//         child: Column(
//           children: [
//             // Main content area
//             Expanded(
//               child: Container(
//                 // Add padding to prevent content from touching edges
//                 padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
//                 child: _screens[currentIndex],
//               ),
//             ),
//
//             // Navigation bar - positioned at the bottom
//             CustomBottomNavBar(
//               currentIndex: currentIndex,
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//








