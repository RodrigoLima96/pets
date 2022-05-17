import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  final String petName;
  final String petId;
  final String type;
  final String photoUrl;
  final double weight;
  final int age;
  final String gender;
  final String uid;

  Pet({
    required this.petName,
    required this.type,
    required this.photoUrl,
    required this.weight,
    required this.age,
    required this.gender,
    required this.petId,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'petName': petName,
      'type': type,
      'photoUrl': photoUrl,
      'weight': weight,
      'age': age,
      'gender': gender,
      'petId': petId,
      'uid': uid,
    };
  }

  factory Pet.fromFirestore(DocumentSnapshot snap) {
    var map = snap.data() as Map<String, dynamic>;

    return Pet(
      petName: map['petName'] ?? '',
      type: map['type'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      weight: map['weight']?.toDouble() ?? 0.0,
      age: map['age']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
      petId: map['petId'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromFirestore(json.decode(source));
}
