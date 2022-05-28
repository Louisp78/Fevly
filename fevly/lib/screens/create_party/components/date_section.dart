import 'package:fevly/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fevly/screens/create_party/components/date_button.dart';

class DateSection extends StatefulWidget {
  const DateSection();

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

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
              DateButton(
                title: 'Debut',
                initialDate: _startDate,
                onTap: () => DatePicker.showDateTimePicker(
                  context,
                  currentTime: _startDate,
                  onConfirm: (time) => setState(
                    () => _startDate = time,
                  ),
                ),
              ),
              DateButton(
                title: 'Fin',
                initialDate: _endDate,
                onTap: () => DatePicker.showDateTimePicker(
                  context,
                  currentTime: _endDate,
                  onConfirm: (time) => setState(() => _endDate = time),
                ),
              ),
              //DatePicker(title: 'Fin', initialDate: DateTime.now()),
            ],
          ),
        ],
      ),
    );
  }
}
