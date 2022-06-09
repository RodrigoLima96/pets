import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // add image to firebase storage
  Future<String> uploadPetImageToStorage(
    String childName,
    String petId,
    Uint8List file,
  ) async {
    final String uid = getUserUid();
    Reference ref = _storage.ref().child(childName).child(uid).child(petId);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  deleteUserPhoto(String photoId, String childName) {
    _storage.ref(childName).child(photoId).delete();
  }

  deletePetPhoto(
    String childName,
    String userId,
    String petId,
  ) {
    _storage.ref(childName).child(userId).child(petId).delete();
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

  Future<List<String>> uploadPostImagesToStorage(
    List<Uint8List> images,
    String uid,
  ) async {
    List<String> imagesUrl = [];
    for (var image in images) {
      String imageId = const Uuid().v1();

      Reference ref = _storage.ref().child('posts').child(uid).child(imageId);

      UploadTask uploadTask = ref.putData(image);
      TaskSnapshot snap = await uploadTask;
      imagesUrl.add(await snap.ref.getDownloadURL());
    }

    return imagesUrl;
  }
}
