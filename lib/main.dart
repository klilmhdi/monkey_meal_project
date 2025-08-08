import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monkey_meal_project/src/helper/firebase_helper.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/login_cubit/login_cubit.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/signup_cubit/signup_cubit.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit(FirebaseServices())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (_, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Metropolis'),
              home: HomeScreen(),
              // initialRoute: SplashScreen.routeName,
              // initialRoute: SplashScreen.routeName,
              // routes: routes,
            ),
      ),
    );
  }
}
