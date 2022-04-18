import 'package:flutter/material.dart';
import 'package:pets/src/shared/services/auth/sign_up_service.dart';

enum SignUpState { idle, loading, success, error }

class SignUpController extends ChangeNotifier {
  final SignUpService _signUpService;
  var state = SignUpState.idle;
  String signUpErrorFirebase = 'Some error occurred';

  SignUpController(this._signUpService);

  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    state = SignUpState.loading;
    notifyListeners();

    final String response = await _signUpService.signUpUser(
        email: email, password: password, name: name);

    if (response == 'success') {
      state = SignUpState.success;
      notifyListeners();
    } else {
      state = SignUpState.error;
      signUpErrorFirebase = response;
      notifyListeners();
    }
  }
}
