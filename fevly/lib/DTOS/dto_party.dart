import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_party_simple.dart';

/// DTO class for '/parties/{partyId}' collection
class DTOParty {
  /// This id corresponds to the auto-generated id of the party in the cloud firestore
  /// that is why it is a String?
  final String? partyId;
  final String name;
  final DateTime dateStart;
  final DateTime dateEnd;
  final GeoPoint location;
  final int guestsCount;
  final int organizersCount;
  final String? photoUrl;

  DTOParty({
    this.partyId,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    required this.location,
    required this.guestsCount,
    required this.organizersCount,
    this.photoUrl,
  });

  /// from Firestore data to [DTOParty]
  factory DTOParty.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DTOParty(
      partyId: snapshot.id,
      name: data?['name'] as String,
      dateStart: (data?['date']?['start'] as Timestamp).toDate(),
      dateEnd: (data?['date']?['end'] as Timestamp).toDate(),
      location: data?['location'] as GeoPoint,
      guestsCount: data?['guests_count'] as int,
      organizersCount: data?['organizers_count'] as int,
      photoUrl: data?['photo_url'] as String?,
    );
  }

  /// from [DTOParty] to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'date': {
        'start': Timestamp.fromDate(dateStart),
        'end': Timestamp.fromDate(dateEnd),
      },
      'location': location,
      'guests_count': guestsCount,
      'organizers_count': organizersCount,
      if (photoUrl != null) 'photo_url': photoUrl,
    };
  }

  /// Convert [DTOParty] to [DTOPartySimple]
  DTOPartySimple toSimple({required bool isOrganizer}) {
    return DTOPartySimple(
      partyId: partyId,
      name: name,
      guestsCount: guestsCount,
      photoUrl: photoUrl,
      isOrganizer: isOrganizer,
    );
  }
}
