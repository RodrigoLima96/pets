import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/auth/auth_service.dart';

enum LoginState { idle, loading, success, error }

class LoginController extends ChangeNotifier {
  final AuthService _authService;
  var state = LoginState.idle;
  String loginErrorFirebase = 'Some error occurred';

  LoginController(this._authService);

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = LoginState.loading;
    notifyListeners();

    final String response =
        await _authService.loginUser(email: email, password: password);

    if (response == 'success') {
      state = LoginState.success;
      notifyListeners();
    } else {
      state = LoginState.error;
      loginErrorFirebase = response;
      notifyListeners();
    }
  }
}
