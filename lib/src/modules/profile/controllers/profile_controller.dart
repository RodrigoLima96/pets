import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/getPets/get_pets_service.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/models/review.dart';
import 'package:pets/src/shared/models/user.dart' as model;
import 'package:pets/src/shared/utils/methods.dart';

enum ProfileState { idle, loading, success, error }

class ProfileController extends ChangeNotifier {
  late model.User user;
  List<Pet> petsList = [], caretakerList = [];
  List<Review> reviews = [];
  final GetPetsService _getPetsService;
  var state = ProfileState.idle;

  ProfileController(this._getPetsService);

  Future<List<Pet>> loadUserInfo(String uid) async {
    state = ProfileState.loading;
    try {
      petsList = await _getPetsService.getPets(uid, 'pets');
      user = await getUserDetails();
      caretakerList = await _getPetsService.getPets(uid, 'caretaker');
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
