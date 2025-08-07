import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  User? get currentUser => _auth.currentUser;

  String? get currentUserId => _auth.currentUser?.uid;

  // Collections
  CollectionReference get usersCollection => _firestore.collection('users');

  CollectionReference get productsCollection => _firestore.collection('products');

  // Storage references
  Reference get productsStorageRef => _storage.ref().child('productsImages');

  Reference get usersStorageRef => _storage.ref().child('usersImages');

  /// Initialize FCM token
  Future<String?> getFcmToken() async {
    try {
      return await _messaging.getToken();
    } catch (e) {
      print('Error getting FCM token: $e');
      return null;
    }
  }

  /// Email & Password Authentication
  Future<User> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  Future<void> signOut() async => await _auth.signOut();

  /// Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google sign in error: $e');
      rethrow;
    }
  }

  /// User Management
  Future<void> createUser(UserModel user) async {
    try {
      await usersCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      print('Error creating user: $e');
      rethrow;
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      final doc = await usersCollection.doc(userId).get();
      return UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    } catch (e) {
      print('Error getting user: $e');
      rethrow;
    }
  }

  /// Image Upload
  Future<String> uploadUserImage(String userId, File imageFile) async {
    try {
      final ref = usersStorageRef.child('$userId.jpg');
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading user image: $e');
      rethrow;
    }
  }

  /// Helper Methods
  FirebaseAuthException _handleAuthException(FirebaseAuthException e) {
    print('Auth error (${e.code}): ${e.message}');
    return e;
  }
}
