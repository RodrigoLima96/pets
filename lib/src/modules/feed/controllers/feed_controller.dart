import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/post.dart' as model;

enum FeedState { idle, loading, success, error }

class FeedController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var state = FeedState.idle;
  List<model.Post> posts = [];

  FeedController() {
    getPosts(0);
  }

  getPosts(int type) async {
    state = FeedState.loading;
    notifyListeners();
    QuerySnapshot snap;

    try {
      switch (type) {
        case 0:
          snap = await _firestore.collection('posts').get();
          break;
        case 1:
          snap = await _firestore
              .collection('posts')
              .where('type', isEqualTo: 'dog')
              .get();
          break;
        case 2:
          snap = await _firestore
              .collection('posts')
              .where('type', isEqualTo: 'cat')
              .get();
          break;
        case 3:
          snap = await _firestore
              .collection('posts')
              .where('type', isEqualTo: 'bird')
              .get();
          break;

        default:
          snap = await _firestore.collection('posts').get();
      }
      posts = [];
      for (var post in snap.docs) {
        posts.add(model.Post.fromFirestore(post));
      }

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