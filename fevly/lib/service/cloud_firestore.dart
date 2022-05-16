import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

Future<void> addUserToFS(
    {required String userId, required String pseudo}) async {
  try {
    await db.collection('users').doc(userId).set({
      'pseudo': pseudo,
    });
  } on FirebaseException catch (e) {
    print('Not handled exception: $e');
    rethrow;
  }
}

Future<String> getUserPseudoFromFS({required String userId}) async {
  final docRef = db.collection("users").doc(userId);

  return docRef.get().then(
    (res) async {
      print("Successfully completed");
      try {
        final result = res.get('pseudo') as String;
        return result;
      } on StateError {
        await addUserToFS(userId: userId, pseudo: 'Anonymous');
        return 'Anonymous';
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}
