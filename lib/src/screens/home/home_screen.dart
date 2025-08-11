import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/core/helper/firebase_helper.dart';
import 'package:monkey_meal_project/src/screens/food/food_screen.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';
import 'package:monkey_meal_project/src/widgets/custom_button/build_custom_button.dart';
import 'package:monkey_meal_project/src/widgets/custom_form_field/build_text_form_field_widget.dart';

import '../../manage/edit_user_data_cubit/edit_user_data_cubit.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditUserDataCubit()..loadUserData(),
      child: BlocConsumer<EditUserDataCubit, EditUserDataState>(
        listener: (context, state) {
          if (state is SuccessGetUserDataFromFirebaseState) {
            nameController.text = state.name;
            emailController.text = state.email;
            phoneController.text = state.phone;
            addressController.text = state.address;
          }
          if (state is EditUserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User updated successfully ✅")));
          } else if (state is EditUserError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
          }
        },
        builder: (context, state) {
          final cubit = context.read<EditUserDataCubit>();

          return Scaffold(
            appBar: AppBar(title: const Text("Edit User")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () => cubit.pickImage(),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey[200],
                        child:
                            cubit.profileImage != null
                                ? ClipOval(
                                  child: Image.file(cubit.profileImage!, width: 200, height: 200, fit: BoxFit.cover),
                                )
                                : (state is SuccessGetUserDataFromFirebaseState &&
                                        state.image != null &&
                                        state.image!.isNotEmpty
                                    ? (state.image!.startsWith('http')
                                        ? ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: state.image!,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),
                                        )
                                        : ClipOval(
                                          child: Image.file(
                                            File(state.image!),
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ))
                                    : const Icon(Icons.camera_alt, size: 40)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      spacing: 15,
                      children: [
                        customTextField(controller: nameController, hintText: "Enter your full name"),
                        customTextField(controller: emailController, hintText: "Enter your email"),
                        customTextField(controller: phoneController, hintText: "Enter your phone number"),
                        customTextField(controller: addressController, hintText: "Enter your current address"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    state is EditUserLoading
                        ? const Center(child: CircularProgressIndicator())
                        : customButton(
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.updateUserData(
                                userId: FirebaseServices().currentUserId.toString(),
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text.isEmpty ? null : phoneController.text,
                                address: addressController.text.isEmpty ? null : addressController.text,
                              );
                            }
                          },
                          title: "Update",
                        ),
                    const SizedBox(height: 20),
                    customButton(press: () => NavAndAnimationsFunctions.navTo(context, FoodListScreen()), title: "Foods"),
                    const SizedBox(height: 20),
                    customButton(press: () => NavAndAnimationsFunctions.navTo(context, PaymentListScreen()), title: "Payments")
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
