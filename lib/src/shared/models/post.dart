import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets/src/shared/models/pet.dart';

class Post {
  final String postId;
  final String uid;
  final List<Pet> pet;
  final String description;
  final DateTime datePublished;
  final double price;
  final int days;
  final String username;
  final String userPhotoUrl;

  Post({
    required this.postId,
    required this.uid,
    required this.pet,
    required this.description,
    required this.datePublished,
    required this.price,
    required this.days,
    required this.username,
    required this.userPhotoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'uid': uid,
      'pet': pet.map((x) => x.toMap()).toList(),
      'description': description,
      'datePublished': datePublished.millisecondsSinceEpoch,
      'price': price,
      'days': days,
      'username': username,
      'userPhotoUrl': userPhotoUrl,
    };
  }

  factory Post.fromFirestore(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;

    return Post(
      postId: map['postId'] ?? '',
      uid: map['uid'] ?? '',
      pet: List<Pet>.from(map['pet']?.map((x) => Pet.fromFirestore(x))),
      description: map['description'] ?? '',
      datePublished: DateTime.fromMillisecondsSinceEpoch(
          map['datePublished'].millisecondsSinceEpoch),
      price: map['price']?.toDouble() ?? 0.0,
      days: map['days']?.toInt() ?? 0,
      username: map['username'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromFirestore(json.decode(source));
}
