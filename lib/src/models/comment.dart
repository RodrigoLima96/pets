import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String uid;
  final String postId;
  final DateTime datePublished;
  final String photoUrl;
  final String username;
  final String comment;

  Comment({
    required this.uid,
    required this.postId,
    required this.datePublished,
    required this.photoUrl,
    required this.username,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'postId': postId,
      'datePublished': datePublished.millisecondsSinceEpoch,
      'photoUrl': photoUrl,
      'username': username,
      'comment': comment,
    };
  }

  factory Comment.fromFirestore(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;

    return Comment(
      uid: map['uid'] ?? '',
      postId: map['postId'] ?? '',
      datePublished: map['datePublished'].toDate() ?? '',
      photoUrl: map['photoUrl'] ?? '',
      username: map['username'] ?? '',
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromFirestore(json.decode(source));
}
