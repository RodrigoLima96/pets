import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/services/storage/storage_service.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

enum AddPostState { idle, loading, success, error }

class AddPostController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  final AuthService _authService;
  final StorageService _storageService;
  final AddController _addController;
  final FeedController _feedController;
  var state = AddPostState.idle;
  List<Uint8List>? images;

  AddPostController(
    this._firestoreService,
    this._storageService,
    this._addController,
    this._feedController,
    this._authService,
  );

  addImage() async {
    images = await pickImage(multImages: true);
    notifyListeners();
  }

  clearImage() {
    images = null;
    notifyListeners();
  }

  addPost(
    String description,
    List<Pet> pets,
  ) async {
    state = AddPostState.loading;
    notifyListeners();
    try {
      String postId = const Uuid().v1();
      final model.User user = await _firestoreService
          .getCurrentUserDetails(_authService.getCurrentUserUid());

      List<String> imagesUrl =
          await _storageService.uploadPostImagesToStorage(images!, user.uid);

      Post post = Post(
        postId: postId,
        uid: user.uid,
        pets: pets,
        description: description,
        datePublished: DateTime.now(),
        username: user.name,
        userPhotoUrl: user.photoUrl!,
        petsPhotosUrl: imagesUrl,
        type: pets[0].type,
      );

      await _firestoreService.addNewPost(post.toMap(), postId);

      _addController.selected = [];
      clearImage();
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
