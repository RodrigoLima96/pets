import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
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
}
