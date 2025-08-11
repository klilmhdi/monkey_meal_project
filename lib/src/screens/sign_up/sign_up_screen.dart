import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/core/helper/firebase_helper.dart';
import 'package:monkey_meal_project/core/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/sign_in/log_in_screen.dart';

import '../../manage/auth_cubit/signup_cubit/signup_cubit.dart';
import 'sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign_up';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(FirebaseServices()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is SignupSuccess) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signup successful!')));
                } else if (state is SignupError) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: Column(
                children: [
                  SizedBox(height: context.getScreenHeight * 0.05),
                  Text(
                    'Sign Up',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.normal, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text('Add your details to sign up', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 40),
                  const SignUpForm(),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () => NavAndAnimationsFunctions.navToWithRTLAnimation(context, LoginScreen()),
                          child: Text("Sign In", style: TextStyle(color: AppColor.orange)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
