import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets/src//models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String response = 'Error';
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        uid: credential.user!.uid,
        name: name,
        email: email,
        rating: 0.0,
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(user.toMap());

      response = 'success';
    } catch (error) {
      response = error.toString();
    }
    return response;
  }
}
