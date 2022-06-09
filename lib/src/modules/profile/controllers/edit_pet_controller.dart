import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import 'package:pets/src/modules/profile/controllers/profile_controller.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/services/storage/storage_service.dart';
import 'package:pets/src/shared/utils/methods.dart';

enum EditPetState { idle, loading, success, error }

class EditPetController extends ChangeNotifier {
  Uint8List? image;
  final FirestoreService _firestoreService;
  final StorageService _storageService;
  final ProfileController _profileController;
  var state = EditPetState.idle;

  EditPetController(
    this._firestoreService,
    this._storageService,
    this._profileController,
  );

  addImage() async {
    image = await pickImage(multImages: false);
    notifyListeners();
  }

  clearImage() {
    image = null;
  }

  updatePet(
    String uid,
    String petId,
    String petName,
    double petWeight,
    int petAge,
  ) async {
    state = EditPetState.loading;
    notifyListeners();
    try {
      String photoUrl = '';
      if (image != null) {
        _storageService.deletePetPhoto('pets', uid, petId);
        photoUrl = await _storageService.uploadPetImageToStorage(
            'pets', petId, image!);

        _firestoreService.updatePet(
            uid, petId, petName, petWeight, petAge, photoUrl);
      } else {
        await _firestoreService.updatePet(
            uid, petId, petName, petWeight, petAge, null);
      }
      await _profileController.loadUserInfo(uid);
      state = EditPetState.success;
      notifyListeners();
    } catch (error) {
      state = EditPetState.error;
      notifyListeners();
    }
  }
}
