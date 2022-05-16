import 'dart:math';

import 'package:fevly/model/party.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfos {
  // Private
  final double _y = 2;
  final double _x = 0.07;

  // Public
  String pseudo;
  User user;
  // Friends is a bijective relation
  Set<UserInfos> listOfFriends;
  Set<UserInfos> listOfMadeRequests;
  Set<UserInfos> listOfReceivedRequests;
  Set<UserInfos> listOfBlocked;

  /// To differenciate party where user is organizer or not see Party.organizer
  Set<Party> listOfParties;
  int xp;

  UserInfos(
      {required this.pseudo,
      required this.user,
      this.xp = 0,
      this.listOfFriends = const {},
      this.listOfParties = const {},
      this.listOfMadeRequests = const {},
      this.listOfReceivedRequests = const {},
      this.listOfBlocked = const {}});

  int getLevelFromXp() {
    return (pow(xp, 1 / _y) * _x).round();
  }

  // Block user
  bool blockUser(final UserInfos user) {
    if (listOfBlocked.contains(user)) return false;

    listOfFriends.remove(user);
    listOfMadeRequests.remove(user);
    listOfBlocked.add(user);
    user.listOfFriends.remove(this);
    user.listOfMadeRequests.remove(this);
    return true;
  }

  // Unblock user
  bool unblockUser(final UserInfos user) {
    return listOfBlocked.remove(user);
  }

  // Accept request from user
  bool acceptRequestFrom(final UserInfos user) {
    if (listOfReceivedRequests.remove(user)) {
      listOfFriends.add(user);
      user.listOfMadeRequests.remove(this);
      user.listOfFriends.add(this);
      return true;
    }
    return false;
  }

  // Reject request from user
  bool rejectRequest(final UserInfos user) {
    return listOfReceivedRequests.remove(user);
    // Dont remove this from user.listOfMadeRequests
  }

  // Send request to user
  bool sendRequestTo(final UserInfos user) {
    if (listOfFriends.contains(user) || isBlockedWith(user)) {
      return false;
    } else if (user.listOfMadeRequests.remove(this)) {
      acceptRequestFrom(user);
      return true;
    }
    user.listOfReceivedRequests.add(this);
    return listOfMadeRequests.add(user);
  }

  bool undoRequestTo(final UserInfos user) {
    user.listOfReceivedRequests.remove(this);
    return listOfMadeRequests.remove(user);
  }

  bool removeFriend(final UserInfos user) {
    final returnVal = listOfFriends.remove(user);
    user.listOfFriends.remove(this);
    return returnVal;
  }

  bool isFriendWith(final UserInfos user) {
    return listOfFriends.contains(user);
  }

  bool haveEmitRequestTo(final UserInfos user) {
    return listOfMadeRequests.contains(user);
  }

  bool haveReceivedRequestFrom(final UserInfos user) {
    return listOfReceivedRequests.contains(user);
  }

  bool isBlockedWith(UserInfos user) {
    return listOfBlocked.contains(user);
  }

  bool isInvitedToParty(Party party) {
    return listOfParties.contains(party);
  }

  bool isOrganizerOfParty(Party party) {
    return party.organizer == this;
  }

  @override
  String toString() {
    return "User(login: $pseudo, name: ${user.displayName}, pseudo: $pseudo, xp: $xp)";
  }
}
