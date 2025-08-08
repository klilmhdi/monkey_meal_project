import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/manage/auth_cubit/login_cubit/login_cubit.dart';
import 'package:monkey_meal_project/src/screens/home/home_screen.dart';
import 'package:monkey_meal_project/src/widgets/custom_snackbar/build_custom_snackbar_widget.dart';

import '../../../../core/consts/colors/colors.dart';
import '../../../../core/consts/strings/strings.dart';
import '../../forgot_password/forgot_password.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
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
            Helper.navAndFinish(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kEmailNullError;
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      return kInvalidEmailError;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "your email",
                    suffixStyle: TextStyle(color: AppColor.orange),
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

                const SizedBox(height: 20),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kPassNullError;
                    } else if (value.length < 8) {
                      return kShortPassError;
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
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

                            print("EMAIL: ${_emailController.text.trim()}");
                            print("PASSWORD: ${_passwordController.text.trim()}");
                            print("email: ${_emailController}");
                            print("password: ${_passwordController}");

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

// class SignForm extends StatefulWidget {
//   const SignForm({super.key});
//
//   @override
//   _SignFormState createState() => _SignFormState();
// }
//
// class _SignFormState extends State<SignForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? email;
//   String? password;
//   bool? remember = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginCubit(),
//       child: BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is SuccessLoginState) {
//             showSuccessSnackBar("Login successful", 3, context);
//             Helper.navAndFinish(context, HomeScreen());
//           }
//         },
//         builder: (context, state) {
//           return Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   onSaved: (newValue) => email = newValue,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return kEmailNullError; // Return the actual error message
//                     } else if (!emailValidatorRegExp.hasMatch(value)) {
//                       return kInvalidEmailError; // Return the actual error message
//                     }
//                     return null; // Return null if valid
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "your email",
//                     suffixStyle: (TextStyle(color: AppColor.orange)),
//                     fillColor: Color(0xFFe5e5e5),
//                     filled: true,
//                     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   onChanged: (value) {},
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 TextFormField(
//                   obscureText: true,
//                   onSaved: (newValue) => password = newValue,
//                   onChanged: (value) {},
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return kPassNullError;
//                     } else if (value.length < 8) {
//                       return kShortPassError;
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "Enter your password",
//                     fillColor: Color(0xFFe5e5e5),
//                     filled: true,
//                     hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//
//                 state is LoadingLoginState
//                     ? CircularProgressIndicator()
//                     : SizedBox(
//                       height: 50,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Validate the form when the button is pressed
//                           if (_formKey.currentState!.validate()) {
//                             _formKey.currentState!.save();
//                             // All fields are valid, proceed with login logic
//                             print("Email: $email, Password: $password");
//                             context.read<LoginCubit>().login(
//                               context,
//                               emailController: email,
//                               passwordController: password,
//                             );
//                           } else {
//                             print("Form is invalid. Please check the fields.");
//                           }
//                         },
//                         style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColor.orange)),
//                         child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
//                       ),
//                     ),
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
//                   },
//                   child: const Text(
//                     "Forget your password?",
//                     style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
