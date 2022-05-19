import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardAddOrganizer extends StatelessWidget {
  const CustomCardAddOrganizer();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      onTap: () => print('add organizer'),
      child: Container(
        width: 170,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: themeColor.onSurface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.add_circle_outline_rounded),
            Spacer(),
            Text(
              'Ajouter un organisateur',
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
