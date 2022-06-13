import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

showSnackBar(BuildContext context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

confirmDialog(BuildContext context, Function press) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: const Text('Are you sure?'),
          actions: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('NO', style: textStyle)),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      press();
                      Navigator.of(context).pop();
                    },
                    child: const Text('YES', style: textStyle))
              ],
            ),
          ],
        );
      });
}

pickImage({required bool multImages}) async {
  final ImagePicker imagePicker = ImagePicker();

  if (multImages) {
    List<XFile>? files = await imagePicker.pickMultiImage();
    List<Uint8List>? images = [];

    if (files != null) {
      for (var i = 0; i < files.length; i++) {
        var teste = await files[i].readAsBytes();
        images.add(teste);
      }
    }

    return images;
  }

  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

  if (file != null) {
    return await file.readAsBytes();
  }
}

Widget loadingWidget() {
  return const Center(child: CircularProgressIndicator());
}

String dateFormat(DateTime date) {
  return timeago.format(date);
}
