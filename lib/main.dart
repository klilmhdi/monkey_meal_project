import 'package:flutter/material.dart';
import 'package:monkey_meal_project/routes.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* home: Scaffold(
        body: Center(
          child:SplashScreen(),

        ),
      ),*/
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
