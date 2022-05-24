import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pets/src/shared/models/pet.dart';

class Post {
  final String postId;
  final String uid;
  final List<Pet> pets;
  final String description;
  final DateTime datePublished;
  final double price;
  final int days;
  final String username;
  final String userPhotoUrl;
  final String type;

  Post({
    required this.postId,
    required this.uid,
    required this.pets,
    required this.description,
    required this.datePublished,
    required this.price,
    required this.days,
    required this.username,
    required this.userPhotoUrl,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'uid': uid,
      'pets': pets.map((x) => x.toMap()).toList(),
      'description': description,
      'datePublished': datePublished,
      'price': price,
      'days': days,
      'username': username,
      'userPhotoUrl': userPhotoUrl,
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
      price: map['price']?.toDouble() ?? 0.0,
      days: map['days']?.toInt() ?? 0,
      username: map['username'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromFirestore(json.decode(source));
}
