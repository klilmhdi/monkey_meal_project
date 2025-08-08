import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';

import '../../../../core/consts/validator/validation.dart';
import '../../../manage/auth_cubit/signup_cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();

        return Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: _nameController,
                hintText: 'Name',
                validator: (value) => ValidationUtils.validateName(value),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => ValidationUtils.validateEmail(value),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) => ValidationUtils.validatePhone(value),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _addressController,
                hintText: 'Address',
                validator: (value) => ValidationUtils.validateAddress(value),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: !cubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(cubit.isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: AppColor.orange),
                  onPressed: cubit.togglePasswordVisibility,
                ),
                validator: (value) => ValidationUtils.validatePassword(value),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: !cubit.isPasswordVisible,
                validator: (value) => ValidationUtils.validateConfirmPassword(value, _passwordController.text),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () => _submitForm(cubit),
                  child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFe5e5e5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      validator: validator,
    );
  }

  void _submitForm(SignupCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit
          .signUpWithEmail(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            phone: _phoneController.text.trim(),
            address: _addressController.text.trim(),
          )
          .then((_) => Helper.navAndFinish(context, HomeScreen()));
    }
  }
}
