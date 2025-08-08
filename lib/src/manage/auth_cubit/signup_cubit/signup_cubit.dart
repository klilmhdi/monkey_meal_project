import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:monkey_meal_project/src/helper/firebase_helper.dart';

import '../../../models/user_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseServices _firebaseServices;

  SignupCubit(this._firebaseServices) : super(SignupInitial());

  bool isPasswordVisible = false;

  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
    String? address,
  }) async {
    emit(SignupLoading());
    try {
      // 1. Create user in Firebase Auth
      final userCredential = await _firebaseServices.signUpWithEmail(email, password);

      // 2. Get FCM token
      final fcmToken = await _firebaseServices.getFcmToken();

      // 3. Create user model
      final user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        address: address,
        token: fcmToken,
        createdAt: DateTime.now(),
      );

      // 4. Save user to Firestore
      await _firebaseServices.createUser(user);

      emit(SignupSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(SignupError(e.message ?? 'Authentication failed'));
    } catch (e, s) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $s");
      emit(SignupError('An unexpected error occurred'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignupLoading());
    try {
      // 1. Sign in with Google
      final userCredential = await _firebaseServices.signInWithGoogle();

      // 2. Check if user exists in Firestore
      final userDoc = await _firebaseServices.usersCollection.doc(userCredential.user?.uid).get();

      if (!userDoc.exists) {
        // 3. Get FCM token
        final fcmToken = await _firebaseServices.getFcmToken();

        // 4. Create new user from Google data
        final user = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? 'Google User',
          email: userCredential.user!.email ?? '',
          imageUrl: userCredential.user!.photoURL,
          token: fcmToken,
          createdAt: DateTime.now(),
        );

        // 5. Save new user to Firestore
        await _firebaseServices.createUser(user);
        emit(SignupSuccess(user));
      } else {
        // User already exists
        final existingUser = UserModel.fromJson(userDoc.data() as Map<String, dynamic>, userDoc.id);
        emit(SignupSuccess(existingUser));
      }
    } catch (e, s) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $s");
      emit(SignupError('Google sign in failed'));
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }
}
