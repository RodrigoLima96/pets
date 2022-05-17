import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class AddController extends ChangeNotifier {
  Uint8List? image;

  addImage() async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = await file.readAsBytes();
      notifyListeners();
    }
  }

  clearImage() {
    image = null;
    notifyListeners();
  }
}
