import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/bottom_nav_bar/bottom_nav_cubit.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/screens/profile_screen/profile_screen.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/custom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/menu_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/more_view.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/offers_view.dart';

class HomeView extends StatelessWidget {
  static String routeName="/home_view";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavCubit>();
        final currentIndex = cubit.currentIndex;
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              MenuView(),
              OffersView(),
              HomeScreen(),
              ProfileScreen(),
              MoreView(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: currentIndex,
            onTap: (newIndex)=>cubit.changeIndex(newIndex),
          ),
        );
      },
    );
  }
}
