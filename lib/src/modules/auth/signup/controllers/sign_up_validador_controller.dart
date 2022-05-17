class SignUpValidatorController {
  String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'Name is required!';
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Email is required!';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? passwordValidator(String value, String text) {
    if (value.isEmpty) {
      return 'Password is required!';
    } else if (value != text) {
      return 'passwords don\'t match';
    } else if (value.length < 6 || value.length > 32) {
      return 'Password must be 6-32 characters';
    }
    return null;
  }
}
