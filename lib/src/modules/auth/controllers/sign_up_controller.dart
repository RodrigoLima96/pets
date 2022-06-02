import 'package:flutter/material.dart';
import 'package:pets/src/services/auth/auth_service.dart';

enum SignUpState { idle, loading, success, error }

class SignUpController extends ChangeNotifier {
  final AuthService _authService;
  var state = SignUpState.idle;

  SignUpController(this._authService);

  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    state = SignUpState.loading;
    notifyListeners();

    final String response = await _authService.signUpUser(
        email: email, password: password, name: name);

    if (response == 'success') {
      state = SignUpState.success;
      notifyListeners();
    } else {
      state = SignUpState.error;
      notifyListeners();
    }
  }
}
