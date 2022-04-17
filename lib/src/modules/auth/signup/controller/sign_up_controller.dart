import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/shared/models/user.dart' as model;

enum AuthState { idle, loading, success, error, passwordError }

class SignUpController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var state = AuthState.idle;
  String errorFirebase = 'Some error occurred';

  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  }) async {
    state = AuthState.loading;
    notifyListeners();

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        uid: credential.user!.uid,
        name: name,
        email: email,
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toMap());

      state = AuthState.success;
      notifyListeners();
    } catch (error) {
      state = AuthState.error;
      notifyListeners();
      errorFirebase = error.toString();
    }
    state = AuthState.idle;
    notifyListeners();
  }

  String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'Name is required!';
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Email is required!';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? passwordValidator(String value, String text) {
    if (value.isEmpty) {
      return 'Password is required!';
    } else if (value != text) {
      return 'passwords don\'t match';
    } else if (value.length < 6 || value.length > 32) {
      return 'Password must be 6-32 characters';
    }
    return null;
  }
}
