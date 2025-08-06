import 'package:flutter/material.dart';

import '../../../../core/consts/colors/colors.dart';
import '../../../../core/consts/strings/strings.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phonenumbereController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Name",
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
            onChanged: (value) {},
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: _emailController,
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
            onChanged: (value) {},
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: _phonenumbereController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Phone number",

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
            onChanged: (value) {},
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: _addressController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Address",

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
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
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
            onChanged: (value) {},
          ),

          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password confirmation';
              } else if (value != _passwordController.text) {
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
            onChanged: (value) {},
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Validate the form when the button is pressed
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // All fields are valid, proceed with login logic
                  print("success");
                } else {
                  print("Form is invalid. Please check the fields.");
                }
              },
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
              child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
