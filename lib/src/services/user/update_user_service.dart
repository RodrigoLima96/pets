import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
}
