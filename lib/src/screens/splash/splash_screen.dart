import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/core/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';

import 'landing_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;

  const SplashScreen({super.key, required this.isLoggedIn});

  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer(const Duration(seconds: 4), () {
        if (mounted) {
          if (widget.isLoggedIn) {
            NavAndAnimationsFunctions.navAndFinish(context, const HomeScreen());
          } else {
            NavAndAnimationsFunctions.navAndFinish(context, const LandingScreen());
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.getScreenWidth,
        height: context.getScreenHeight,
        child: Stack(
          children: [
            Align(alignment: Alignment.center, child: Image.asset('assets/images/bg.png')),
            // Align(alignment: Alignment.center, child: Image.asset('assets/images/MealMonkeyLogo.png')),
            const Positioned(left: 0, right: 0, bottom: 20, child: Center(child: CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }
}
