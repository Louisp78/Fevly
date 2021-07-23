import 'package:flutter/material.dart';

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    slideLeftTransition() => (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          final end = Offset.zero;
          final curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        };

Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
    slideUpTransition() => (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          final end = Offset.zero;
          final curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        };
