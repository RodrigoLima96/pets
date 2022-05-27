import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pets/src/shared/models/user.dart' as model;

class SignUpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
