import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/models/comment.dart';
import 'package:pets/src/models/pet.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/models/user.dart' as model;

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Post>> getPosts(String type) async {
    QuerySnapshot snap;
    List<Post> posts = [];
    try {
      if (type == 'all') {
        snap = await _firestore.collection('posts').get();
      } else {
        snap = await _firestore
            .collection('posts')
            .where('type', isEqualTo: type)
            .get();
      }

      for (var post in snap.docs) {
        posts.add(Post.fromFirestore(post));
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return posts;
  }

  Future<List<Comment>> getPostCommets(String postId) async {
    QuerySnapshot snap;
    List<Comment> comments = [];
    try {
      snap = await _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .get();

      for (var post in snap.docs) {
        comments.add(Comment.fromFirestore(post));
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return comments;
  }

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

  Future<String> editPost(
    String postId,
    String description,
  ) async {
    String status = '';

    try {
      _firestore.collection('posts').doc(postId).update({
        'description': description,
      });
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<String> addComment(
    String postId,
    Map<String, dynamic> comment,
    String commentId,
  ) async {
    String status = '';

    try {
      _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set(comment);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<String> deleteComment(
    String postId,
    String commentId,
  ) async {
    String status = '';

    try {
      _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<String> deletePost(
    String postId,
  ) async {
    String status = '';

    try {
      _firestore.collection('posts').doc(postId).delete();
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

  Future<String> updatePet(
    String uid,
    String petId,
    String petName,
    double petWeight,
    int petAge,
    String? newPhotoUrl,
  ) async {
    String status = '';
    try {
      if (newPhotoUrl != null) {
        _firestore
            .collection('users')
            .doc(uid)
            .collection('pets')
            .doc(petId)
            .update({
          'petName': petName,
          'photoUrl': newPhotoUrl,
          'weight': petWeight,
          'age': petAge,
        });
      } else {
        _firestore
            .collection('users')
            .doc(uid)
            .collection('pets')
            .doc(petId)
            .update({
          'petName': petName,
          'weight': petWeight,
          'age': petAge,
        });
      }

      status = 'success';
    } catch (error) {
      status = error.toString();
    }
    return status;
  }

  Future<model.User> getCurrentUserDetails() async {
    User currentUser = FirebaseAuth.instance.currentUser!;

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    return model.User.fromMap(snap);
  }

  Future<String> signUpUser(String uid, Map<String, dynamic> user) async {
    String status = '';

    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set(user);
      status = 'success';
    } catch (error) {
      status = error.toString();
    }

    return status;
  }
}
