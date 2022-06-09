import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String response = 'Error';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      response = 'success';
    } catch (error) {
      response = error.toString();
    }
    return response;
  }

  Future<dynamic> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  logout() async {
    _auth.signOut();
  }
}
