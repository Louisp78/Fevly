import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_guest.dart';
import 'package:fevly/DTOS/dto_user_simple.dart';
import 'package:fevly/functions/generate_random_pseudo.dart';

/// DTO for /users collection
class DTOUser {
  final String? userId;
  final String? pseudo;
  final String? email;
  final String? photoURL;
  final String? displayName;
  final int? partyCounter;
  final int? friendCounter;

  DTOUser({
    this.userId,
    this.pseudo,
    this.partyCounter,
    this.friendCounter,
    this.email,
    this.photoURL,
    this.displayName,
  });

  /// from Cloud Firebase to [DTOUser]
  factory DTOUser.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    /// Only the photoURL can be null in db
    return DTOUser(
      userId: snapshot.id,
      pseudo: data?['pseudo'] as String,
      partyCounter: data?['party_counter'] as int,
      friendCounter: data?['friend_counter'] as int,
      email: data?['email'] as String,
      photoURL: data?['photo_url'] as String?,
      displayName: data?['display_name'] as String,
    );
  }

  /// from [DTOUser] to Cloud Firebase
  Map<String, dynamic> toFirebase() {
    return {
      'pseudo': pseudo,
      'party_counter': partyCounter,
      'friend_counter': friendCounter,
      'email': email,
      'photo_url': photoURL,
      'display_name': displayName,
      'created_at': Timestamp.fromDate(DateTime.now()),
    };
  }

  /// from [DTOUser] to Cloud Firebase without null values
  /// this method should be used only for update data
  Map<String, dynamic> toFirebaseWithoutNull() {
    return {
      if (pseudo != null) 'pseudo': pseudo,
      if (displayName != null) 'display_name': displayName,
      if (photoURL != null) 'photo_url': photoURL,
      if (friendCounter != null) 'party_counter': partyCounter,
      if (partyCounter != null) 'friend_counter': friendCounter,
      if (email != null) 'email': email,
    };
  }

  /// Rebuild setter
  DTOUser withPseudo(String newPseudo) {
    return DTOUser(
      userId: userId,
      pseudo: newPseudo,
      partyCounter: partyCounter,
      friendCounter: friendCounter,
      email: email,
      photoURL: photoURL,
      displayName: displayName,
    );
  }

  /// convert to [DTOUserSimple]
  DTOUserSimple toDTOUserSimple() {
    return DTOUserSimple(
      userId: userId,
      pseudo: pseudo,
      displayName: displayName,
      photoURL: photoURL,
    );
  }

  /// convert to [DTOGuest]
  DTOGuest toDTOGuest({required bool isOrganizer}) {
    return DTOGuest(
      userId: userId,
      pseudo: pseudo,
      isOrganizer: isOrganizer,
      displayName: displayName,
      photoURL: photoURL,
    );
  }
}
