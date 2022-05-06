import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets/src/shared/models/post.dart' as model;

enum FeedState { idle, loading, success, error }

class FeedController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var state = FeedState.idle;
  List<model.Post> posts = [];

  FeedController() {
    getPosts();
  }

  Future<List<model.Post>> getPosts() async {
    state = FeedState.idle;
    notifyListeners();

    try {
      var snap = await _firestore.collection('posts').get();
      for (var post in snap.docs) {
        posts.add(model.Post.fromFirestore(post));
      }

      state = FeedState.success;
      notifyListeners();
    } catch (error) {
      state = FeedState.error;
      notifyListeners();
    }
    return posts;
  }
}
