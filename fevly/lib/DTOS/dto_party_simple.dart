import 'package:cloud_firestore/cloud_firestore.dart';

/// DTO class for '/users/{userId}/parties' collection
class DTOPartySimple {
  final String? partyId;
  final String name;
  final int guestsCount;
  final String? photoUrl;
  final bool isOrganizer;

  DTOPartySimple({
    this.partyId,
    required this.name,
    required this.guestsCount,
    required this.isOrganizer,
    this.photoUrl,
  });

  /// from Firestore data to [DTOPartySimple]
  factory DTOPartySimple.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DTOPartySimple(
      partyId: snapshot.id,
      name: data?['name'] as String,
      guestsCount: data?['guests_count'] as int,
      photoUrl: data?['photo_url'] as String?,
      isOrganizer: data?['is_organizer'] as bool,
    );
  }

  /// from [DTOPartySimple] to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'guests_count': guestsCount,
      'is_organizer': isOrganizer,
      if (photoUrl != null) 'photo_url': photoUrl,
    };
  }
}
