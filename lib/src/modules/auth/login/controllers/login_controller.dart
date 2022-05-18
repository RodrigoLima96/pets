import 'package:flutter/cupertino.dart';
import 'package:pets/src/shared/services/auth/login_service.dart';

enum LoginState { idle, loading, success, error }

class LoginController extends ChangeNotifier {
  final LoginService _loginService;
  var state = LoginState.idle;
  String loginErrorFirebase = 'Some error occurred';

  LoginController(this._loginService);

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = LoginState.loading;
    notifyListeners();

    final String response =
        await _loginService.loginUser(email: email, password: password);

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
