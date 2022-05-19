import 'package:fevly/DTOS/dto_user.dart';
import 'package:fevly/DTOS/dto_user_simple.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardUserSimple extends StatelessWidget {
  const CardUserSimple({required this.user});

  final DTOUserSimple user;

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      onTap: () => print('a user'),
      child: Container(
        width: size.width * 0.45,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: themeColor.onSurface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // FIXME: add photo of user
            if (false)
              CircleAvatar(
                backgroundImage: NetworkImage(''),
              )
            else
              CustomCircleAvatar(radius: 20),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${user.pseudo}', style: textTheme.headline3),
                Text(
                  '${user.displayName}',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
