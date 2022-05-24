import 'package:flutter/cupertino.dart';
import 'package:pets/src/modules/add/add/controllers/add_controller.dart';
import 'package:pets/src/services/add/add_post_service.dart';
import 'package:pets/src/shared/models/pet.dart';
import 'package:pets/src/shared/models/post.dart';
import 'package:pets/src/shared/models/user.dart' as model;
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

enum AddPostState { idle, loading, success, error }

class AddPostController extends ChangeNotifier {
  final AddPostService _addPostService;
  final AddController _addController;
  var state = AddPostState.idle;

  AddPostController(this._addPostService, this._addController);

  addPost(
    List<Pet> pets,
    double price,
    int days,
    String description,
  ) async {
    state = AddPostState.loading;
    notifyListeners();
    try {
      String postId = const Uuid().v1();
      final model.User user = await getUserDetails();

      Post post = Post(
        postId: postId,
        uid: user.uid,
        pet: pets,
        description: description,
        datePublished: DateTime.now(),
        price: price,
        days: days,
        username: user.name,
        userPhotoUrl: user.photoUrl!,
      );

      await _addPostService.addNewPost(user.uid, post.toMap(), postId);
      _addController.selected = [];
      state = AddPostState.success;
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = AddPostState.error;
      notifyListeners();
    }
  }
}
