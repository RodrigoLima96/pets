import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/post.dart' as model;
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:pets/src/shared/utils/constants.dart';

enum FeedState { idle, loading, success, error }

class FeedController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  var state = FeedState.idle;
  List<model.Post> posts = [];

  FeedController(this._firestoreService) {
    getPosts(0);
  }

  getPosts(int index) async {
    state = FeedState.loading;
    notifyListeners();
    String type = petType[index];

    try {
      posts = await _firestoreService.getPosts(type);

      state = FeedState.success;
      notifyListeners();
    } catch (error) {
      state = FeedState.error;
      notifyListeners();
    }

    state = FeedState.idle;
    return posts;
  }
}
//