import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // add image to firebase storage
  Future<String> uploadImageToStorage(
    String childName,
    String petId,
    Uint8List file,
    bool isPost,
  ) async {
    final String uid = getUserUid();
    Reference ref = _storage.ref().child(childName).child(uid).child(petId);

    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  deletePhoto(String photoId, String childName) {
    _storage.ref(childName).child(photoId).delete();
  }

  Future<String> uploadUserImageToStorage(
    String childName,
    Uint8List file,
    String id,
  ) async {
    Reference ref = _storage.ref().child(childName).child(id);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
