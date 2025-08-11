import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monkey_meal_project/core/helper/firebase_helper.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/login_cubit/login_cubit.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/signup_cubit/signup_cubit.dart';
import 'package:monkey_meal_project/src/manage/foods_model/foods_cubit.dart';
import 'package:monkey_meal_project/src/manage/payment/payment_cubit.dart';
import 'package:monkey_meal_project/src/screens/splash/splash_screen.dart';

import 'core/consts/bloc_observer.dart';
import 'core/shared_preferenced/shared_preferenced.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseServices().getFcmToken();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  Bloc.observer = MyBlocObserver();
  await SharedPrefController().initPreferences();
  await ScreenUtil.ensureScreenSize();
  bool isLoggedIn = SharedPrefController().isLoggedIn;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit(FirebaseServices())),
        BlocProvider(
          create:
              (context) =>
                  FoodsCubit()
                    ..fetchFoods()
                    ..fetchUserOrders(FirebaseServices().currentUserId!),
        ),
        BlocProvider(create: (context) => PaymentCubit()..fetchPaymentMethods()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (_, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Metropolis'),
              home: SplashScreen(isLoggedIn: isLoggedIn),
              title: "Monkey Meal",
              // initialRoute: SplashScreen.routeName,
              // initialRoute: SplashScreen.routeName,
              // routes: routes,
            ),
      ),
    );
  }
}
