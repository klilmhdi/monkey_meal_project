import 'package:flutter/material.dart';

import '../../helper/helper.dart';
import 'landing_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    // Function to navigate to landing page after 5 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LandingScreen()));
    });
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Align(alignment: Alignment.center, child: Image.asset('assets/images/MealMonkeyLogo.png')),
            const Positioned(left: 0, right: 0, bottom: 20, child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
