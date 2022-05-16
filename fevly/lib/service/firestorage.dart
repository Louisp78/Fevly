import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  FireStorage() {
    //_init();
  }

  static FirebaseStorage instance = FirebaseStorage.instance;

  static Future<String> getProfilePhotoUrl(String userId) async {
    final ref = instance.ref().child('profile_pictures/$userId');

    return ref.getDownloadURL();
  }

  static Future<String> uploadProfilePhoto(String userId, File file) async {
    final ref = instance.ref().child('profile_pictures/$userId');
    try {
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print('Not handle error : $e');
      rethrow;
    }
  }
}
