import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/colors.dart';
import 'new_password_screen.dart';

class SendOTPScreen extends StatelessWidget{
  static String routeName="/otp";

  const SendOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'We have sent you an OTP to your Mobile',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontFamily: 'assets/fonts/Metropolis-ExtraBold.ttf',
                    fontSize: 25,
                    color: Color(0xFF4A4B4D),
                  ),
                  textAlign: TextAlign.center,

                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please check your mobile number 071*****12 continue to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontFamily: 'assets/fonts/Metropolis-Medium.ttf'),

                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OTPInput(),
                    OTPInput(),
                    OTPInput(),
                    OTPInput(),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(NewPwScreen.routeName);
                    },
                    style: ButtonStyle( backgroundColor:WidgetStateProperty.all(AppColor.orange)),
                    child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't Recieve? "),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Text(
              "*",
              style: TextStyle(fontSize: 45,color: Colors.grey.shade600),

            ),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}