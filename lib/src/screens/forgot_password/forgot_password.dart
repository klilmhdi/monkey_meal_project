import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/forgot_password/send_otp_screen.dart';

import '../../../core/consts/colors/colors.dart';
import '../../../core/consts/strings/strings.dart';

class ForgetPwScreen extends StatelessWidget {
  static String routeName = "/forget_pwd";

  const ForgetPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      body: SizedBox(
        width: context.getScreenWidth,
        height: context.getScreenWidth,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'assets/fonts/Metropolis-ExtraBold.ttf',
                    fontSize: 30,
                  ),
                ),
                Spacer(),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Spacer(flex: 2),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kEmailNullError; // Return the actual error message
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      return kInvalidEmailError; // Return the actual error message
                    }
                    return null; // Return null if valid
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    suffixStyle: (TextStyle(color: AppColor.orange)),
                    fillColor: Color(0xFFe5e5e5),
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);
                    },
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
                    child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 18)),
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
