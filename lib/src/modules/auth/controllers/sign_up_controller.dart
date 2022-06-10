import 'package:flutter/material.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';

enum SignUpState { idle, loading, success, error }

class SignUpController extends ChangeNotifier {
  final AuthService _authService;
  final FirestoreService _firestoreService;
  var state = SignUpState.idle;
  String status = 'error';

  SignUpController(this._authService, this._firestoreService);

  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    state = SignUpState.loading;
    notifyListeners();

    try {
      var credential = await _authService.signUpUser(
          email: email, password: password, name: name);
      status = _authService.status;
      model.User user = model.User(
        uid: credential.user!.uid,
        name: name,
        email: email,
      );

      await _firestoreService.signUpUser(user.uid, user.toMap());
      state = SignUpState.success;
      notifyListeners();
    } catch (error) {
      state = SignUpState.error;
      notifyListeners();
    }
  }
}
