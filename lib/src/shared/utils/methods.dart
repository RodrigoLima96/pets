import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

showTopSnackBar(BuildContext context, message, bool error) {
  if (error) {
    return CustomSnackBar.error(
      message: message,
    );
  } else {
    return CustomSnackBar.success(
      message: message,
    );
  }
}
