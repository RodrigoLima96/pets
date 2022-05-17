import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

pickImage() async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

  if (file != null) {
    return await file.readAsBytes();
  }
}

getUserUid() {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  return uid;
}
