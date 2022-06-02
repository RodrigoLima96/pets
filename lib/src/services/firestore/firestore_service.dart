import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/user.dart' as model;

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addNewPet(
      Map<String, dynamic> pets, String uid, String petId) async {
    String status = '';

    try {
      _firestore
          .collection('users')
          .doc(uid)
          .collection('pets')
          .doc(petId)
          .set(pets);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<String> addNewPost(
    String uid,
    Map<String, dynamic> post,
    String postId,
  ) async {
    String status = '';

    try {
      _firestore.collection('posts').doc(postId).set(post);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

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

  Future<String> updateUser(
    String uid,
    String name,
    String? newPhotoUrl,
  ) async {
    String status = '';
    try {
      if (newPhotoUrl != null) {
        _firestore.collection('users').doc(uid).update({
          'name': name,
          'photoUrl': newPhotoUrl,
        });
      } else {
        _firestore.collection('users').doc(uid).update({
          'name': name,
        });
      }

      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<model.User> getCurrentUserDetails(String uid) async {
    User currentUser = FirebaseAuth.instance.currentUser!;

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    return model.User.fromMap(snap);
  }
}
