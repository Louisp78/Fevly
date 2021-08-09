import 'package:fevly/constant.dart';
import 'package:fevly/functions/contains_in_string.dart';
import 'package:flutter/cupertino.dart';
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
}

//$ CLASS
//$ ============================================================

class User {
  String name;
  String pseudo;
  String password;
  String email;
  UserRelationState relationState;

  User(
      {this.relationState = UserRelationState.me,
      required this.name,
      required this.pseudo,
      required this.password,
      required this.email})
      : assert(!containsInString(name, specialChar),
            "name couldn't contain specialChars."),
        assert(email.contains("@"), "email must contain '@'."),
        assert(!pseudo.contains("@"), "pseudo must not contain '@'.");

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
