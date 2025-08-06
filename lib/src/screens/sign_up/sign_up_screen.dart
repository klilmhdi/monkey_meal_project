import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/sign_up/component/sign_up_form.dart';

import '../../../core/consts/colors/colors.dart';
import '../../helper/helper.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),

        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Helper.getScreenHeight(context) * 0.05),
                Text(
                  "Sign Up",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.normal, fontSize: 30),
                ),
                const SizedBox(height: 10),
                const Text('Add your details to sign up', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const Spacer(),
                SignUpForm(),
                const Spacer(flex: 2),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text("Sign In", style: TextStyle(color: AppColor.orange, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
