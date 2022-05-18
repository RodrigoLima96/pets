class LoginValidatorController {
  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Email';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Password ';
    }
    return null;
  }
}
