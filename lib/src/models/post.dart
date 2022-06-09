import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets/src/models/pet.dart';

class Post {
  final String postId;
  final String uid;
  final List<Pet> pets;
  final String description;
  final DateTime datePublished;
  final String username;
  final String userPhotoUrl;
  final List<String> petsPhotosUrl;
  final String type;

  Post({
    required this.postId,
    required this.uid,
    required this.pets,
    required this.description,
    required this.datePublished,
    required this.username,
    required this.userPhotoUrl,
    required this.petsPhotosUrl,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'uid': uid,
      'pets': pets.map((x) => x.toMap()).toList(),
      'description': description,
      'datePublished': datePublished,
      'username': username,
      'userPhotoUrl': userPhotoUrl,
      'petsPhotosUrl': petsPhotosUrl,
      'type': type,
    };
  }

  factory Post.fromFirestore(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;

    return Post(
      postId: map['postId'] ?? '',
      uid: map['uid'] ?? '',
      pets: List<Pet>.from(map['pets']?.map((x) => Pet.fromMap(x))),
      description: map['description'] ?? '',
      datePublished: map['datePublished'].toDate() ?? '',
      username: map['username'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      petsPhotosUrl: List<String>.from(map['petsPhotosUrl']),
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromFirestore(json.decode(source));
}
