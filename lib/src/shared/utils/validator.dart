class Validator {
  String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'Name is required!';
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Email';
    } else if (!value.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  String? loginPasswordValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Password';
    }
    return null;
  }

  String? signUpPasswordValidator(String password1, String password2) {
    if (password1.isEmpty) {
      return 'Password is required!';
    } else if (password1 != password2) {
      return 'passwords don\'t match';
    } else if (password1.length < 6 || password1.length > 32) {
      return 'Password must be 6-32 characters';
    }
    return null;
  }

  String? petNameValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Name';
    }
    return null;
  }

  String? typeValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Type';
    }
    return null;
  }

  String? genderValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Gender';
    }
    return null;
  }

  String? weightValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Weight';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Only Digits Accepted';
    }
    return null;
  }

  String? ageValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Age';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Only Digits Accepted';
    }
    return null;
  }

  String? descriptionValidator(String value) {
    if (value.isEmpty) {
      return 'Enter a Description';
    }
    return null;
  }

  String? commentValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Comment';
    }
    return null;
  }
}
