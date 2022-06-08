import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/comment.dart' as model;
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:uuid/uuid.dart';

enum PostState { idle, loading, success, error }

class PostController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  var commentsState = PostState.idle;
  var postCommentState = PostState.idle;
  List<model.Comment> comments = [];
  String uid = '';

  PostController(this._firestoreService);

  getComments(String postId) async {
    commentsState = PostState.loading;
    notifyListeners();

    try {
      comments = await _firestoreService.getPostCommets(postId);

      commentsState = PostState.success;
      final model.User user = await _firestoreService.getCurrentUserDetails();
      uid = user.uid;
      notifyListeners();
    } catch (error) {
      commentsState = PostState.error;
      notifyListeners();
    }

    commentsState = PostState.idle;
    return comments;
  }

  addComment(
    String postId,
    String commentText,
  ) async {
    postCommentState = PostState.loading;
    notifyListeners();

    try {
      final model.User user = await _firestoreService.getCurrentUserDetails();
      String commentId = const Uuid().v1();

      model.Comment comment = model.Comment(
        uid: user.uid,
        postId: postId,
        datePublished: DateTime.now(),
        photoUrl: user.photoUrl!,
        username: user.name,
        comment: commentText,
        commentId: commentId,
      );

      await _firestoreService.addComment(postId, comment.toMap(), commentId);
      comments.add(comment);
      postCommentState = PostState.success;
      notifyListeners();
    } catch (error) {
      postCommentState = PostState.error;
      notifyListeners();
    }
  }

  deleteComment(
    model.Comment comment,
  ) async {
    postCommentState = PostState.loading;
    notifyListeners();

    try {
      await _firestoreService.deleteComment(comment.postId, comment.commentId);

      comments.remove(comment);
      postCommentState = PostState.success;
      notifyListeners();
    } catch (error) {
      postCommentState = PostState.error;
      notifyListeners();
    }
  }
}
