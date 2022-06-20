import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;

enum ProfileState { idle, loading, success, error }

class ProfileController extends ChangeNotifier {
  late model.User user;
  List<Pet> petsList = [];
  List<Post> userPosts = [];
  final FirestoreService _firestoreService;
  final AuthService _authService;
  var state = ProfileState.idle;
  String userUid = '';

  ProfileController(this._firestoreService, this._authService);

  Future<List<Pet>> loadUserInfo(String uid) async {
    state = ProfileState.loading;
    try {
      userUid = _authService.getCurrentUserUid();
      petsList = await _firestoreService.getPets(uid);
      user = await _firestoreService.getCurrentUserDetails(uid);
      userPosts = await _firestoreService.getPosts('all', uid);
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
