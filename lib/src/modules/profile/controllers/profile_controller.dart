import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;

enum ProfileState { idle, loading, success, error }

class ProfileController extends ChangeNotifier {
  late model.User user;
  List<Pet> petsList = [], sitterList = [];
  final FirestoreService _firestoreService;
  final AuthService _authService;
  var state = ProfileState.idle;
  String userUid = '';

  ProfileController(this._firestoreService, this._authService);

  Future<List<Pet>> loadUserInfo(String uid) async {
    state = ProfileState.loading;
    try {
      userUid = _authService.getCurrentUserUid();
      petsList = await _firestoreService.getPets(uid, 'pets');
      user = await _firestoreService.getCurrentUserDetails(uid);
      sitterList = await _firestoreService.getPets(uid, 'sitter');
      state = ProfileState.success;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = ProfileState.error;
      notifyListeners();
    }

    state = ProfileState.idle;

    return petsList;
  }
}
