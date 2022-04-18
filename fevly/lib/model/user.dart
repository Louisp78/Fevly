import 'dart:math';

import 'package:fevly/model/party.dart';

class User {
  // Private
  final double _y = 2;
  final double _x = 0.07;

  // Public
  String login;
  String name;
  String password;
  // Friends is a bijective relation
  Set<User> listOfFriends;
  Set<User> listOfMadeRequests;
  Set<User> listOfReceivedRequests;
  Set<User> listOfBlocked;

  /// To differenciate party where user is organizer or not see Party.organizer
  Set<Party> listOfParties;
  int xp;

  User(
      {required this.login,
      required this.name,
      required this.password,
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
  bool blockUser(final User user) {
    if (listOfBlocked.contains(user)) return false;

    listOfFriends.remove(user);
    listOfMadeRequests.remove(user);
    listOfBlocked.add(user);
    user.listOfFriends.remove(this);
    user.listOfMadeRequests.remove(this);
    return true;
  }

  // Unblock user
  bool unblockUser(final User user) {
    return listOfBlocked.remove(user);
  }

  // Accept request from user
  bool acceptRequestFrom(final User user) {
    if (listOfReceivedRequests.remove(user)) {
      listOfFriends.add(user);
      user.listOfMadeRequests.remove(this);
      user.listOfFriends.add(this);
      return true;
    }
    return false;
  }

  // Reject request from user
  bool rejectRequest(final User user) {
    return listOfReceivedRequests.remove(user);
    // Dont remove this from user.listOfMadeRequests
  }

  // Send request to user
  bool sendRequestTo(final User user) {
    if (listOfFriends.contains(user) || isBlockedWith(user)) {
      return false;
    } else if (user.listOfMadeRequests.remove(this)) {
      acceptRequestFrom(user);
      return true;
    }
    user.listOfReceivedRequests.add(this);
    return listOfMadeRequests.add(user);
  }

  bool undoRequestTo(final User user) {
    user.listOfReceivedRequests.remove(this);
    return listOfMadeRequests.remove(user);
  }

  bool removeFriend(final User user) {
    final returnVal = listOfFriends.remove(user);
    user.listOfFriends.remove(this);
    return returnVal;
  }

  bool isFriendWith(final User user) {
    return listOfFriends.contains(user);
  }

  bool haveEmitRequestTo(final User user) {
    return listOfMadeRequests.contains(user);
  }

  bool haveReceivedRequestFrom(final User user) {
    return listOfReceivedRequests.contains(user);
  }

  bool isBlockedWith(User user) {
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
    return "User(login: $login, name: $name, password: $password, xp: $xp)";
  }
}
