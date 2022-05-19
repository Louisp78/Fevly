import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_guest.dart';
import 'package:fevly/DTOS/dto_user.dart';
import 'package:fevly/DTOS/dto_party.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

Future<void> addUserToFS({required DTOUser user}) async {
  try {
    await db.collection('users').doc(user.userId!).set(user.toFirebase());
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
        print("StateError : pseudo not found in db, should not happen");
        rethrow;
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> updateUserPseudoFS(
    {required String userId, required String pseudo}) async {
  final docRef = db.collection("users").doc(userId);

  return docRef.update({'pseudo': pseudo}).then(
    (res) async {
      print("Successfully completed");
    },
    onError: (e) => print("Error completing: $e"),
  );
}

/// Add a party to the cloud firestore
Future<void> addParty({
  required DTOParty party,
  required List<DTOGuest> guests,
}) async {
  // init a transaction to avoid partial update
  db.runTransaction((transaction) async {
    // add the party to the parties collection
    print('Enter in add party transaction');
    final partyDoc = db.collection('parties').doc();
    transaction.set(partyDoc, party.toFirestore());

    // add guest to /parties/{partyId}/guests for all guests (guests and organizer)
    for (final guest in guests) {
      final guestDoc = db
          .collection('parties')
          .doc(partyDoc.id)
          .collection('guests')
          .doc(guest.userId);

      transaction.set(guestDoc, guest.toFirestore());
    }

    // add to /users/{userId}/parties collection for guests
    guests.forEach((guest) async {
      /// Create the [DTOPartySimple] for users
      final dtoForGuest = party.toSimple(isOrganizer: guest.isOrganizer);
      final userGuestDoc = db
          .collection('users')
          .doc(guest.userId)
          .collection('parties')
          .doc(partyDoc.id);

      transaction.set(userGuestDoc, dtoForGuest.toFirestore());
    });
  });
}
