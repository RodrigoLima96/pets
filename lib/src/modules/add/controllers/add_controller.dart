import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/services/storage/storage_service.dart';
import 'dart:typed_data';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

enum AddPetState { idle, loading, success, error }

class AddController extends ChangeNotifier {
  Uint8List? image;
  var state = AddPetState.idle;

  addImage() async {
    image = await pickImage();
    notifyListeners();
  }

  clearImage() {
    image = null;
    notifyListeners();
  }

  addPet(
    Uint8List file,
    String name,
    String type,
    String gender,
    double weight,
    int age,
  ) async {
    state = AddPetState.loading;
    notifyListeners();
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      String petId = const Uuid().v1();

      final String uid = getUserUid();
      String photoUrl = await StorageService()
          .uploadImageToStorage('pets', petId, file, false);

      Pet pet = Pet(
        petName: name,
        type: type,
        photoUrl: photoUrl,
        weight: weight,
        age: age,
        gender: gender,
        petId: petId,
        uid: uid,
      );

      _firestore.collection('pets').doc(petId).set(pet.toMap());
      clearImage();
      state = AddPetState.success;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = AddPetState.error;
      notifyListeners();
    }
  }
}
