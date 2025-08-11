import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/core/consts/functions/animations.dart';
import 'package:monkey_meal_project/core/consts/validator/validation.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/login_cubit/login_cubit.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/widgets/custom_form_field/build_text_form_field_widget.dart';
import 'package:monkey_meal_project/src/widgets/custom_snackbar/build_custom_snackbar_widget.dart';

import '../../../core/consts/colors/colors.dart';
import '../forgot_password/forgot_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? remember = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            showSuccessSnackBar("Login successful", 3, context);
            NavAndAnimationsFunctions.navAndFinish(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TextFormField(
                //   controller: _emailController,
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return kEmailNullError;
                //     } else if (!emailValidatorRegExp.hasMatch(value)) {
                //       return kInvalidEmailError;
                //     }
                //     return null;
                //   },
                //   decoration: const InputDecoration(
                //     hintText: "your email",
                //     suffixStyle: TextStyle(color: AppColor.orange),
                //     fillColor: Color(0xFFe5e5e5),
                //     filled: true,
                //     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
                //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                customTextField(
                  controller: _emailController,
                  hintText: "Enter your email",
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return kEmailNullError;
                  //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                  //     return kInvalidEmailError;
                  //   }
                  //   return null;
                  // },
                  validator: (p0) => ValidationUtils.validateEmail(p0),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // TextFormField(
                //   controller: _passwordController,
                //   obscureText: true,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return kPassNullError;
                //     } else if (value.length < 8) {
                //       return kShortPassError;
                //     }
                //     return null;
                //   },
                //   decoration: const InputDecoration(
                //     hintText: "Enter your password",
                //     fillColor: Color(0xFFe5e5e5),
                //     filled: true,
                //     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
                //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                customTextField(
                  controller: _passwordController,
                  hintText: "Enter your password",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (p0) => ValidationUtils.validatePassword(p0),
                ),
                const SizedBox(height: 30),

                state is LoadingLoginState
                    ? const CircularProgressIndicator()
                    : SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // final email = _emailController.text.trim();
                            // final password = _passwordController.text.trim();

                            debugPrint("EMAIL: ${_emailController.text.trim()}");
                            debugPrint("PASSWORD: ${_passwordController.text.trim()}");
                            debugPrint("email: $_emailController");
                            debugPrint("password: $_passwordController");

                            context.read<LoginCubit>().login(
                              context,
                              emailController: _emailController,
                              passwordController: _passwordController,
                            );
                          }
                        },
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
                        child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: const Text(
                    "Forget your password?",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
