class AddPostValidatorController {
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
