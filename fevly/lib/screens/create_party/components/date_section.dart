import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/create_party/components/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateSection extends StatelessWidget {
  const DateSection();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: kBasicHorizontalPadding(size: size),
        vertical: kBasicVerticalPadding(size: size),
      ),
      decoration: BoxDecoration(
        color: themeColor.onSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dates',
            style: textTheme.headline2,
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DatePicker(title: 'Debut', initialDate: DateTime.now()),
              DatePicker(title: 'Fin', initialDate: DateTime.now()),
            ],
          ),
        ],
      ),
    );
  }
}
