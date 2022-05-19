import 'package:cloud_firestore/cloud_firestore.dart';

/// DTO for /users collection
class DTOUser {
  final String? userId;
  final String pseudo;
  final String email;
  final String photoURL;
  final String displayName;
  final int partyCounter;
  final int friendCounter;

  DTOUser({
    this.userId,
    required this.pseudo,
    required this.partyCounter,
    required this.friendCounter,
    required this.email,
    required this.photoURL,
    required this.displayName,
  });

  /// from Cloud Firebase to [DTOUser]
  factory DTOUser.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DTOUser(
      userId: snapshot.id,
      pseudo: data?['pseudo'] as String,
      partyCounter: data?['party_counter'] as int,
      friendCounter: data?['friend_counter'] as int,
      email: data?['email'] as String,
      photoURL: data?['photo_url'] as String,
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
}
