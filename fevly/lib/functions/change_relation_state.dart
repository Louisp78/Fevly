import 'package:fevly/components/custom_snackbar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void Function() changeRelationState(
        {required User user,
        required BuildContext context,
        List<User>? list,
        int? index}) =>
    () {
      assert(list == null && index == null || !(list == null && index == null),
          "list and index must be set together");
      final Size size = MediaQuery.of(context).size;
      final TextTheme textTheme =
          GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
      //! Option annuler mal réglé (utiliser FUTURE)
      final UserRelationState oldRelationState = user.relationState;
      ScaffoldMessenger.of(context).showSnackBar(
        buildCustomSnackBar(
          context: context,
          textTheme: textTheme,
          size: size,
          text: kSnackBarUserRelation(user: user),
          undoPress: () {
            user.relationState = oldRelationState;
            if (list != null && index != null) {
              list[index] = user;
            }
            ScaffoldMessenger.of(context)
                .hideCurrentSnackBar(reason: SnackBarClosedReason.action);
          },
        ),
      );

      user.relationState = user.relationState.changeRelation;
      if (list != null && index != null) {
        list[index] = user;
      }
    };
