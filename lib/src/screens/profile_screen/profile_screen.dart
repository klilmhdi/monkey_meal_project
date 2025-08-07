import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/src/screens/profile_screen/component/custom_text_form_field.dart';
import 'package:monkey_meal_project/src/screens/profile_screen/component/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Profile Picture
            CircleAvatar(
              radius: 60,
              child: CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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
            ProfileForm()
            ],
        ),
      ),
    );
  }
}
