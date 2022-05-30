import 'package:flutter/cupertino.dart';
import 'package:pets/src/services/getPets/get_pets_service.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/utils/methods.dart';

enum AddState { idle, loading, success, error }

class AddController extends ChangeNotifier {
  List<Pet> selected = [];
  List<Pet> pets = [];
  final GetPetsService _getPetService;
  var state = AddState.idle;

  AddController(this._getPetService) {
    getPets();
  }

  getPets() async {
    state = AddState.loading;
    notifyListeners();
    final String uid = getUserUid();

    try {
      pets = await _getPetService.getPets(uid, 'pets');
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
