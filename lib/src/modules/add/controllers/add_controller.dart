import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/models/pet.dart';

enum AddState { idle, loading, success, error }

class AddController extends ChangeNotifier {
  List<Pet> selected = [];
  List<Pet> pets = [];
  final FirestoreService _firestoreService;
  final AuthService _authService;
  var state = AddState.idle;

  AddController(this._firestoreService, this._authService) {
    getPets();
  }

  getPets() async {
    state = AddState.loading;
    notifyListeners();
    final String uid = _authService.getCurrentUserUid();

    try {
      pets = await _firestoreService.getPets(uid);
      state = AddState.success;
      notifyListeners();
    } catch (error) {
      state = AddState.error;
      notifyListeners();
      debugPrint(error.toString());
    }

    state = AddState.idle;
    notifyListeners();
  }

  selectedPet(Pet pet) {
    if (selected.contains(pet)) {
      selected.remove(pet);
    } else {
      selected.add(pet);
    }

    debugPrint(selected.length.toString());
    notifyListeners();
  }
}
