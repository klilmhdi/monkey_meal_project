import 'package:flutter/material.dart';

import '../../../core/consts/colors/colors.dart';
import '../../helper/helper.dart';
import '../intro_screen/first_intro_screen.dart';

class NewPwScreen extends StatelessWidget {
  static String routeName = "/new_password";

  const NewPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 5) {
                      return 'The password must contains more than five characters.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
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

                SizedBox(height: 20),

                TextFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password confirmation';
                    } else if (value != passwordController.text) {
                      return "Password doesn't match.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Confirm password",

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

                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(FirstIntroScreen.routeName);
                    },
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
                    child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
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
