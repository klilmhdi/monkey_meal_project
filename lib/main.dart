import 'package:flutter/material.dart';
import 'package:monkey_meal_project/routes.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/screens/intro_screen/first_intro_screen.dart';
import 'package:monkey_meal_project/src/screens/profile_screen/profile_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: ProfileScreen.routeName,
      routes: routes,
    );
  }
}
