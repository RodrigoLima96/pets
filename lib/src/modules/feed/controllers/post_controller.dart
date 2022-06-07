import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/comment.dart' as model;
import 'package:pets/src/services/firestore/firestore_service.dart';

enum PostState { idle, loading, success, error }

class PostController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  var state = PostState.idle;
  List<model.Comment> comments = [];

  PostController(this._firestoreService);

  getComments(String postId) async {
    state = PostState.loading;
    notifyListeners();

    try {
      comments = await _firestoreService.getPostCommets(postId);

      state = PostState.success;
      notifyListeners();
    } catch (error) {
      state = PostState.error;
      notifyListeners();
    }

    state = PostState.idle;
    return comments;
  }
}
