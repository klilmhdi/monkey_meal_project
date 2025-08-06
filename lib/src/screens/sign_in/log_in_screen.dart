import 'package:flutter/material.dart';

import '../../../core/consts/colors/colors.dart';
import '../../helper/helper.dart';
import '../sign_up/sign_up_screen.dart';
import 'component/SignForm.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Helper.getScreenHeight(context) * 0.05),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'assets/fonts/Metropolis-ExtraBold.ttf',
                    fontSize: 30,
                    color: Color(0xFF4A4B4D),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Add your details to login',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'assets/fonts/Metropolis-Medium.ttf',
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),

                // Formulaire de connexion
                const SignForm(),

                const Spacer(
                  flex: 2,
                ),
                const Text("or Login With", style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold, fontFamily: 'assets/fonts/Metropolis-Medium.ttf')),
                const Spacer(),

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(
                          0xFF367FC0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Logique pour la connexion avec Facebook
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/fb.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Login with Facebook",
                          style: TextStyle(color: Colors.white, fontFamily: 'assets/fonts/Metropolis-Medium.ttf'),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(
                          0xFFDD4B39,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Logique pour la connexion avec Google
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.white, fontFamily: 'assets/fonts/Metropolis-Medium.ttf'),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
