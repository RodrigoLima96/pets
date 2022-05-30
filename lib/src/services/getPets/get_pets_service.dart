import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/shared/models/pet.dart';

class GetPetsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Pet>> getPets(String uid, String collectionName) async {
    QuerySnapshot snap;
    List<Pet> pets = [];
    try {
      snap = await _firestore
          .collection('users')
          .doc(uid)
          .collection(collectionName)
          .get();
      for (var pet in snap.docs) {
        pets.add(Pet.fromFirestore(pet));
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return pets;
  }
}
