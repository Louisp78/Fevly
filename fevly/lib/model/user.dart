
import 'dart:math';

abstract class User {

  final double y = 2;
  final double x = 0.07;

  String login;
  String name;
  String password;
  int xp;

  User({
    required this.login,
    required this.name,
    required this.password,
    this.xp = 0});

  int getLevelFromXp()
  {
    return (pow(xp, 1/y) * x).round();
  }

}
