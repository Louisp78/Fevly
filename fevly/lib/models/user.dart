import 'package:fevly/constant.dart';
import 'package:fevly/functions/contains_in_string.dart';
import 'package:fevly/models/user_relation_state.dart';
import 'package:flutter/cupertino.dart';

@immutable
class User {
  final String name;
  final String pseudo;
  final String password;
  final String email;
  final UserRelationState relationState;

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
    // TODO: implement toString
    return '''
    name: $name,
    pseudo: $pseudo,
    password: $password
    email: $email
    UserRelationState : ${relationState.toString()}
    ''';
  }
}
