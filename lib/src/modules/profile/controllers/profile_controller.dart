import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/review.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/shared/utils/methods.dart';

enum ProfileState { idle, loading, success, error }

class ProfileController extends ChangeNotifier {
  late model.User user;
  List<Pet> petsList = [], sitterList = [];
  List<Review> reviews = [];
  final FirestoreService _firestoreService;
  var state = ProfileState.idle;

  ProfileController(this._firestoreService);

  Future<List<Pet>> loadUserInfo(String uid) async {
    state = ProfileState.loading;
    try {
      petsList = await _firestoreService.getPets(uid, 'pets');
      user = await getUserDetails();
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
