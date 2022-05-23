import 'package:flutter/cupertino.dart';
import 'package:pets/src/modules/add/add/controllers/add_controller.dart';
import 'package:pets/src/services/add/add_pet_service.dart';
import 'package:pets/src/services/storage/storage_service.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'dart:typed_data';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

enum AddPetState { idle, loading, success, error }

class AddPetController extends ChangeNotifier {
  Uint8List? image;
  final AddPetService _addPetService;
  final AddController _addController;
  var state = AddPetState.idle;

  AddPetController(this._addPetService, this._addController);

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

      await _addPetService.addNewPet(pet.toMap(), uid, petId);
      _addController.getPets();
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
