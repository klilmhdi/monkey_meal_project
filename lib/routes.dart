import 'package:flutter/widgets.dart';
import 'package:monkey_meal_project/src/screens/checkout_screen/checkout_screen.dart';
import 'package:monkey_meal_project/src/screens/forgot_password/forgot_password.dart';
import 'package:monkey_meal_project/src/screens/forgot_password/new_password_screen.dart';
import 'package:monkey_meal_project/src/screens/forgot_password/send_otp_screen.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/screens/inbox_screen/inbox_screen.dart';
import 'package:monkey_meal_project/src/screens/intro_screen/first_intro_screen.dart';
import 'package:monkey_meal_project/src/screens/notifications_screen/notification_screen.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/order_screen.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';
import 'package:monkey_meal_project/src/screens/sign_in/log_in_screen.dart';
import 'package:monkey_meal_project/src/screens/sign_up/sign_up_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/landing_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LandingScreen.routeName: (context) => const LandingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgetPwScreen.routeName: (context) =>  ForgetPwScreen(),
  NewPwScreen.routeName: (context) =>  NewPwScreen(),
  SendOTPScreen.routeName: (context) =>  SendOTPScreen(),
  FirstIntroScreen.routeName: (context) =>  FirstIntroScreen(),
  HomeScreen.routeName: (context) =>  HomeScreen(),
  NotificationScreen.routeName: (context) =>  NotificationScreen(),
  InboxScreen.routeName: (context) =>  InboxScreen(),
  PaymentScreen.routeName: (context) =>  PaymentScreen(),
  OrderScreen.routeName: (context) =>  OrderScreen(),
CheckoutScreen.routeName:(context)=>CheckoutScreen()


};
