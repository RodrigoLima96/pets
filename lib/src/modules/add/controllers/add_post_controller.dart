import 'package:flutter/cupertino.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

enum AddPostState { idle, loading, success, error }

class AddPostController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  final AddController _addController;
  final FeedController _feedController;
  var state = AddPostState.idle;

  AddPostController(
    this._firestoreService,
    this._addController,
    this._feedController,
  );

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
        pets: pets,
        description: description,
        datePublished: DateTime.now(),
        price: price,
        days: days,
        username: user.name,
        userPhotoUrl: user.photoUrl!,
        type: pets[0].type,
        rating: user.rating,
      );

      await _firestoreService.addNewPost(user.uid, post.toMap(), postId);
      _addController.selected = [];
      state = AddPostState.success;
      _feedController.getPosts(0);
      notifyListeners();
    } catch (error) {
      debugPrint(error.toString());
      state = AddPostState.error;
      notifyListeners();
    }
  }
}
