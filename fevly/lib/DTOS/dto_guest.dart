import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_user_simple.dart';

/// DTO class for 'parties/{partiesUid}/guests' collection
class DTOGuest {
  final String? userId;
  final String? pseudo;
  final String? displayName;
  final String? photoURL;
  final bool isOrganizer;

  DTOGuest({
    this.userId,
    required this.pseudo,
    required this.isOrganizer,
    required this.displayName,
    required this.photoURL,
  });

  /// from Firestore data to [DTOGuest]
  factory DTOGuest.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DTOGuest(
      userId: snapshot.id,
      pseudo: data?['pseudo'] as String,
      isOrganizer: data?['is_organizer'] as bool,
      displayName: data?['display_name'] as String,
      photoURL: data?['photo_url'] as String,
    );
  }

  /// from [DTOGuest] to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'pseudo': pseudo,
      'is_organizer': isOrganizer,
      'display_name': displayName,
      'photo_url': photoURL,
    };
  }

  /// from [DTOGuest] to Firestore data without null values
  /// this method should be used only for update data
  Map<String, dynamic> toFirestoreWithoutNull() {
    return {
      if (pseudo != null) 'pseudo': pseudo,
      'is_organizer': isOrganizer,
      if (displayName != null) 'display_name': displayName,
      if (photoURL != null) 'photo_url': photoURL,
    };
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
}
