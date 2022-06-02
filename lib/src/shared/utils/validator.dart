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

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Password ';
    }
    return null;
  }

  String? signUpPasswordValidator(String value, String text) {
    if (value.isEmpty) {
      return 'Password is required!';
    } else if (value != text) {
      return 'passwords don\'t match';
    } else if (value.length < 6 || value.length > 32) {
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
      return 'Only digits accepted';
    }
    return null;
  }

  String? ageValidator(String value) {
    if (value.isEmpty) {
      return 'Enter Your Pet Age';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Only digits accepted';
    }
    return null;
  }

  String? priceValidator(String value) {
    if (value.isEmpty) {
      return 'Enter the price!';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Only digits accepted';
    }
    return null;
  }

  String? daysValidator(String value) {
    if (value.isEmpty) {
      return 'Enter the days!';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Only digits accepted';
    }
    return null;
  }

  String? descriptionValidator(String value) {
    if (value.isEmpty) {
      return 'Enter a description';
    }
    return null;
  }
}
