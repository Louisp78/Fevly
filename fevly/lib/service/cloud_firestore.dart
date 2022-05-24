import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_guest.dart';
import 'package:fevly/DTOS/dto_user.dart';
import 'package:fevly/DTOS/dto_party.dart';
import 'package:fevly/functions/generate_random_pseudo.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

Future<bool> isUserPseudoExist(String pseudo) async {
  final QuerySnapshot querySnapshot =
      await db.collection('users').where('pseudo', isEqualTo: pseudo).get();
  return querySnapshot.docs.isNotEmpty;
}

Future<void> addUserToFS({required DTOUser user}) async {
  try {
    /// Check if user.pseudo already exist in DB
    await isUserPseudoExist(user.pseudo!).then((isExist) {
      if (isExist) {
        throw FirebaseException(
            plugin: 'isUserPseudoExist',
            message: 'Pseudo already exist',
            code: 'pseudo_already_exist');
      }
    });

    await db.collection('users').doc(user.userId!).set(user.toFirebase());
  } on Exception catch (e) {
    print('Not handled exception: $e ' + ' with pseudo' + user.pseudo!);
    rethrow;
  }
}

Future<void> deleteUserFromFS({required String userId}) async {
  try {
    await db.collection('users').doc(userId).delete();
  } on Exception catch (e) {
    print('Not handled exception: $e');
    rethrow;
  }
}

Future<String> findValidPseudo({required String prefix}) async {
  int len = 10;
  String genPseudo = generateRandomPseudo(prefix: prefix, length: len ~/ 10);
  while (await isUserPseudoExist(genPseudo)) {
    len++;
    if (len >= 100) {
      throw FirebaseException(
          plugin: 'UnableToGeneratePseudo',
          code: 'unable_to_generate_pseudo',
          message: 'Unable to generate pseudo');
    }
    genPseudo = generateRandomPseudo(prefix: prefix, length: len ~/ 10);
  }
  return genPseudo;
}

/// Retrive a [DTOUser] dto object from users collection of the current user
Future<DTOUser?> getCurrentUserFromFS() async {
  final docRef = db
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .withConverter(
        fromFirestore: DTOUser.fromFirestore,
        toFirestore: (DTOUser user, _) => user.toFirebase(),
      );

  return docRef.get().then(
    (res) async {
      print("Successfully completed");
      try {
        return res.data();
      } on StateError {
        print("StateError : should not happen");
        rethrow;
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> updateCurrentUserFS({required DTOUser user}) async {
  /// Check if user.pseudo already exist in DB
  if (user.pseudo != null) {
    /// Check to keep pseudo unique
    await isUserPseudoExist(user.pseudo!).then((isExist) {
      if (isExist) {
        throw FirebaseException(
            plugin: 'isUserPseudoExist',
            message: 'Pseudo already exist',
            code: 'pseudo_already_exist');
      }
    });
  }

  final docRef =
      db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);

  return docRef.update(user.toFirebaseWithoutNull()).then(
    (res) async {
      print("Successfully completed");
    },
    onError: (e) => print("Error completing: $e"),
  );
}

/// Add a party to the cloud firestore
Future<void> addPartyFS({
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
