import 'package:cloud_firestore/cloud_firestore.dart';

class AddPostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String status = '';

  Future<String> addNewPost(
    String uid,
    Map<String, dynamic> post,
    String postId,
  ) async {
    try {
      _firestore.collection('posts').doc(postId).set(post);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }
}
