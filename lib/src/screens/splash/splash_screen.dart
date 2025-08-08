import 'dart:async';

import 'package:flutter/material.dart';

import '../../helper/helper.dart';
import 'landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
          Helper.navAndFinish(context, const LandingScreen());
        }
      });
    });
  }

  @override
  void dispose() {
    // إلغاء المؤقت في حال تم الخروج من الشاشة قبل انتهاء الوقت
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
