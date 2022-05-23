import 'package:cloud_firestore/cloud_firestore.dart';

class AddPetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String status = '';

  Future<String> addNewPet(
      Map<String, dynamic> pets, String uid, String petId) async {
    try {
      _firestore
          .collection('pets')
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
}
