import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/consts/strings/strings.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';

import 'custom_text_form_field.dart';
class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phonenumbereController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
@override
  void dispose() {
  _nameController.dispose();
  _passwordController.dispose();
  _confirmPasswordController.dispose();
  _emailController.dispose();
  _phonenumbereController.dispose();
  _addressController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(label: 'Name', value: 'Emilia Clarke',
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },onChanged: (value)=>{},controller: _nameController,),
        SizedBox(height: 15),
        // Email Field
        CustomTextFormField(label: 'Email', value: 'emiliaclarke@email.com',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return kEmailNullError; // Return the actual error message
            } else if (!emailValidatorRegExp.hasMatch(value)) {
              return kInvalidEmailError; // Return the actual error message
            }
            return null; // Return null if valid
          },onChanged: (value)=>{},controller: _emailController,),
        SizedBox(height: 15),
        // Mobile No Field
        CustomTextFormField(label: 'Mobile No', value: '01000001210',
          keyboardType: TextInputType.phone,
           validator:    (value) {
            if (value!.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },onChanged: (value)=>{},controller: _phonenumbereController,
        ),
        // Typo in image, I'll use the one from the image
        SizedBox(height: 15),
        // Address Field
        CustomTextFormField(label: 'Address', value: 'No 23, 6th Lane, Colombo 03',
          keyboardType: TextInputType.streetAddress,
          validator:    (value) {
            if (value!.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },onChanged: (value)=>{},controller: _addressController,),
        SizedBox(height: 15),
        // Password Field
        CustomTextFormField(label: 'Password', value: '************', obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 5) {
                return 'The password must contains more than five characters.';
              }
              return null;
            },controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value){}
        ),
        SizedBox(height: 15),
        // Confirm Password Field
        CustomTextFormField(label: 'Confirm Password', value: '************', obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 5) {
                return 'The password must contains more than five characters.';
              }
              return null;
            },controller: _confirmPasswordController,
        keyboardType: TextInputType.visiblePassword,
        onChanged: (value){},),
SizedBox(height: 8,),
        CustomButton(title: 'Save',onPressed: (){
       if(   _formKey.currentState!.validate()){
         _formKey.currentState!.validate();
       }
        },),

          ],
        )
);
  }
}
