import 'package:flutter/widgets.dart';
import 'package:monkey_meal_project/src/screens/sign_in/log_in_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/landing_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LandingScreen.routeName: (context) => const LandingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  //ForgetPwScreen.routeName: (context) =>  ForgetPwScreen(),



};
