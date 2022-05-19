class AddPetValidatorController {
  String? nameValidator(String value) {
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
}
