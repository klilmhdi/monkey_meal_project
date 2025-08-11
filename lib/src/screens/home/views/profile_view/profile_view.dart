import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/src/screens/home/views/profile_view/component/profile_form.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';


class ProfileView extends StatefulWidget {
  static String routeName = '/profile';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), actions: [IconButton(icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, PaymentScreen.routeName);

          })]),
      body:
      SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Profile Picture
            CircleAvatar(
              radius: 60,
              child:Image.asset('assets/images/person.png',height: 100,)
            ),
            SizedBox(height: 10),
            // Edit Profile Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, size: 16, color: AppColor.orange),
                SizedBox(width: 5),
                Text('Edit Profile', style: TextStyle(color: AppColor.orange)),
              ],
            ),
            SizedBox(height: 20),
            // "Hi there Emilia!" text
            Text('Hi there Emilia!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            // Name Field
            ProfileForm(),

            ],
        ),
      ),
    );
  }
}
