import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;
  final double rating;

  User({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'rating': rating,
    };
  }

  factory User.fromMap(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;

    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      rating: map['rating'] ?? '',
      photoUrl: map['photoUrl'] ??
          'https://i.pinimg.com/564x/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
