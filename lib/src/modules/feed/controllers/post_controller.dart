import 'package:flutter/cupertino.dart';
import 'package:pets/src/models/comment.dart' as model;
import 'package:pets/src/models/post.dart';
import 'package:pets/src/models/user.dart' as model;
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/services/auth/auth_service.dart';
import 'package:pets/src/services/firestore/firestore_service.dart';
import 'package:uuid/uuid.dart';

enum PostState { idle, loading, success, error }

class PostController extends ChangeNotifier {
  final FirestoreService _firestoreService;
  final AuthService _authService;
  final FeedController _feedController;
  var getCommentsState = PostState.idle;
  var postCommentState = PostState.idle;
  var editPostState = PostState.idle;
  List<model.Comment> comments = [];
  String uid = '';

  PostController(
      this._firestoreService, this._feedController, this._authService);

  getComments(String postId) async {
    getCommentsState = PostState.loading;
    notifyListeners();

    try {
      comments = await _firestoreService.getPostCommets(postId);

      getCommentsState = PostState.success;
      uid = _authService.getCurrentUserUid();
      notifyListeners();
    } catch (error) {
      getCommentsState = PostState.error;
      notifyListeners();
    }

    getCommentsState = PostState.idle;
    return comments;
  }

  addComment(
    String postId,
    String commentText,
  ) async {
    postCommentState = PostState.loading;
    notifyListeners();

    try {
      final model.User user = await _firestoreService
          .getCurrentUserDetails(_authService.getCurrentUserUid());
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

  Future<String> editPost(String description, Post post) async {
    editPostState = PostState.loading;
    notifyListeners();
    String status = 'error';

    try {
      status = await _firestoreService.editPost(post.postId, description);

      Post newPost = Post(
        postId: post.postId,
        uid: uid,
        pets: post.pets,
        description: description,
        datePublished: post.datePublished,
        username: post.username,
        userPhotoUrl: post.userPhotoUrl,
        petsPhotosUrl: post.petsPhotosUrl,
        type: post.type,
      );
      _feedController.updatePost(newPost, uid);
      editPostState = PostState.success;

      notifyListeners();
    } catch (error) {
      editPostState = PostState.error;
      notifyListeners();
    }

    return status;
  }

  deletePost(
    Post post,
  ) async {
    editPostState = PostState.loading;
    notifyListeners();

    try {
      await _firestoreService.deletePost(post.postId);
      _feedController.removePost(post);
      editPostState = PostState.success;
      notifyListeners();
    } catch (error) {
      editPostState = PostState.error;
      notifyListeners();
    }
  }
}
