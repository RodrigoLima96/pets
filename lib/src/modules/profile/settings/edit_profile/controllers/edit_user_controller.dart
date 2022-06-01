import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:pets/src/modules/profile/profile/controllers/profile_controller.dart';
import 'package:pets/src/services/storage/storage_service.dart';
import 'package:pets/src/services/user/update_user_service.dart';
import 'package:pets/src/shared/utils/methods.dart';

enum EditUserState { idle, loading, success, error }

class EditUserController extends ChangeNotifier {
  Uint8List? image;
  final UpdateUserService _updateUserService;
  final StorageService _storageService;
  final ProfileController _profileController;
  var state = EditUserState.idle;

  EditUserController(
    this._updateUserService,
    this._storageService,
    this._profileController,
  );

  addImage() async {
    image = await pickImage();
    notifyListeners();
  }

  clearImage() {
    image = null;
    notifyListeners();
  }

  updateUser(
    String uid,
    String name,
  ) async {
    state = EditUserState.loading;
    notifyListeners();
    try {
      String photoUrl = '';
      if (image != null) {
        _storageService.deletePhoto(uid, 'users');
        photoUrl = await _storageService.uploadUserImageToStorage(
            'users', image!, uid);
        _updateUserService.updateUser(uid, name, photoUrl);
      } else {
        await _updateUserService.updateUser(uid, name, null);
      }
      await _profileController.loadUserInfo(uid);
      state = EditUserState.success;
      notifyListeners();
    } catch (error) {
      state = EditUserState.error;
      notifyListeners();
    }
  }
}
