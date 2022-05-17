import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/addPet/widgets/add_pet_body.dart';
import 'package:pets/src/modules/add/addPet/widgets/add_photo_button.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'dart:typed_data';

class AddPetPage extends StatefulWidget {
  const AddPetPage({Key? key}) : super(key: key);

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  Uint8List? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBlack,
      ),
      body: _file != null ? const AddPhotoButton() : const AddPetBody(),
    );
  }
}
