import 'package:pets/src/services/auth/auth_service.dart';

class LogoutController {
  final AuthService _authService;

  LogoutController(this._authService);

  logout() async {
    _authService.logout();
  }
}
