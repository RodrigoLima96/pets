import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/shared/utils/constants.dart';

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

getUserUid() {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  return uid;
}

Future<model.User> getUserDetails() async {
  User currentUser = FirebaseAuth.instance.currentUser!;

  DocumentSnapshot snap = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.uid)
      .get();

  return model.User.fromMap(snap);
}
