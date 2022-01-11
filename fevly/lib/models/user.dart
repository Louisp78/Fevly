import 'package:fevly/constant.dart';
import 'package:fevly/functions/contains_in_string.dart';
import 'package:fevly/models/badge.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:flutter/material.dart';


//$ ENUMERATION
//$ ============================================================

enum UserRelationState { friend, requestSent, unFriend, me }

extension UserRelationStateExtension on UserRelationState {
  String get name {
    switch (this) {
      case UserRelationState.friend:
        return "Ami";
      case UserRelationState.me:
        return "Mes listes";
      case UserRelationState.requestSent:
        return "En attente";
      case UserRelationState.unFriend:
        return "Ajouter";
    }
  }

  IconData get iconData {
    switch (this) {
      case UserRelationState.friend:
        return Icons.done_rounded;
      case UserRelationState.me:
        return Icons.format_list_bulleted_rounded;
      case UserRelationState.requestSent:
        return Icons.email_rounded;
      case UserRelationState.unFriend:
        return Icons.person_add_rounded;
    }
  }

  UserRelationState get changeRelation {
    switch (this) {
      case UserRelationState.friend:
      case UserRelationState.requestSent:
        return UserRelationState.unFriend;
      case UserRelationState.me:
        return this;
      case UserRelationState.unFriend:
        return UserRelationState.requestSent;
    }
  }
}

//$ CLASS
//$ ============================================================

class User extends ChangeNotifier {
  String _name;
  String _pseudo;
  String _password;
  String _email;
  UserRelationState _relationState;
  List<Badge> listOfBadges;
  List<User> listOfFriends;
  int _partyCounter;
  List<GuestList> listOfGuestList;
  List<ProductList> listOfProductList;

  User(
      {UserRelationState relationState = UserRelationState.me,
      required String name,
      required String pseudo,
      required String password,
      required String email,
      this.listOfBadges = const [],
      this.listOfFriends = const [],
      this.listOfGuestList = const [],
      this.listOfProductList = const [],
      int partyCounter = 0})
      : _email = email,
        _name = name,
        _password = password,
        _pseudo = pseudo,
        _relationState = relationState,
        _partyCounter = partyCounter,
        assert(!containsInString(name, specialChar),
            "name couldn't contain specialChars."),
        assert(email.contains("@"), "email must contain '@'."),
        assert(!pseudo.contains("@"), "pseudo must not contain '@'.");

  //* GETTER
  UserRelationState get relationState => _relationState;
  String get name => _name;
  String get pseudo => _pseudo;
  String get password => _password;
  String get email => _email;
  int get partyCounter => _partyCounter;

  //* SETTER
  set relationState(UserRelationState newRelationState) {
    _relationState = newRelationState;
    notifyListeners();
  }

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set pseudo(String newPseudo) {
    _pseudo = newPseudo;
    notifyListeners();
  }

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  set password(String newPass) {
    _password = newPass;
    notifyListeners();
  }

  set partyCounter(int newValue) {
    _partyCounter = newValue;
    notifyListeners();
  }

  //* METHOD
  //* ============================

  @override
  String toString() {
    return '''
    name: $name,
    pseudo: $pseudo,
    password: $password
    email: $email
    UserRelationState : ${relationState.toString()}
    ''';
  }
}
