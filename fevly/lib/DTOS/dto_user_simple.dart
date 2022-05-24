import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_guest.dart';

/// general DTO for simple duplicate data in collections about users collection
class DTOUserSimple {
  /// This id corresponds to the auto-generated id of the party in the cloud firestore
  final String? userId;
  final String? pseudo;
  final String? displayName;
  final String? photoURL;

  DTOUserSimple({
    required this.pseudo,
    required this.displayName,
    required this.photoURL,
    this.userId,
  });

  /// from Firestore data to [DTOUserSimple]
  factory DTOUserSimple.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DTOUserSimple(
      userId: snapshot.id,
      pseudo: data?['pseudo'] as String,
      displayName: data?['display_name'] as String,
      photoURL: data?['photo_url'] as String,
    );
  }

  /// from [DTOUserSimple] to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'pseudo': pseudo,
      'photo_url': photoURL,
    };
  }

  /// from [DTOUserSimple] to Firestore data without null values
  /// this method should be used only for update data
  Map<String, dynamic> toFirestoreWithoutNull() {
    return {
      'pseudo': pseudo,
      if (displayName != null) 'display_name': displayName,
      if (photoURL != null) 'photo_url': photoURL,
    };
  }

  /// convert to [DTOGuest]
  DTOGuest toDTOGuest({required bool isOrganizer}) {
    return DTOGuest(
      userId: userId,
      pseudo: pseudo,
      displayName: displayName,
      photoURL: photoURL,
      isOrganizer: isOrganizer,
    );
  }
}
