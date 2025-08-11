// import 'package:flutter/material.dart';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

// class CustomNavBar extends StatelessWidget {
//   final NotchBottomBarController controller;
//   final Function(int) onTap;

//   const CustomNavBar({
//     Key? key,
//     required this.controller,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedNotchBottomBar(
//       notchBottomBarController: controller,
//       color: Colors.white,
//       notchColor: Colors.white,
//       showLabel: true,
//       removeMargins: false,
//       bottomBarWidth: MediaQuery.of(context).size.width * 0.95,
//       durationInMilliSeconds: 300,
//       kIconSize: 26,
//       kBottomRadius: 12,
//       bottomBarItems: [
//         BottomBarItem(
//           inActiveItem: Icon(Icons.menu, color: Colors.grey),
//           activeItem: Icon(Icons.menu, color: Colors.orange),
//           itemLabel: 'Menu',
//         ),
//         BottomBarItem(
//           inActiveItem: Icon(Icons.local_offer, color: Colors.grey),
//           activeItem: Icon(Icons.local_offer, color: Colors.orange),
//           itemLabel: 'Offers',
//         ),
//         BottomBarItem(
//           inActiveItem: Icon(Icons.home, color: Colors.grey),
//           activeItem: Icon(Icons.home, color: Colors.orange),
//           itemLabel: 'Home',
//         ),
//         BottomBarItem(
//           inActiveItem: Icon(Icons.person, color: Colors.grey),
//           activeItem: Icon(Icons.person, color: Colors.orange),
//           itemLabel: 'Profile',
//         ),
//         BottomBarItem(
//           inActiveItem: Icon(Icons.more_horiz, color: Colors.grey),
//           activeItem: Icon(Icons.more_horiz, color: Colors.orange),
//           itemLabel: 'More',
//         ),
//       ],
//       onTap: onTap,
//     );
//   }
// }
