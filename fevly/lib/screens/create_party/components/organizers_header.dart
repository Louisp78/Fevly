import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizersHeader extends StatelessWidget {
  const OrganizersHeader({required this.numberOfOrganizers});

  final int numberOfOrganizers;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Organisateurs', style: textTheme.headline3),
        Text(
          '$numberOfOrganizers organisateurs',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
