import 'package:fevly/components/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    required this.title,
    required this.initialDate,
  });

  final String title;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.bodyText1),
        SizedBox(
          height: 5,
        ),
        CustomSmallButton(
          text: dateFormat.format(initialDate),
          press: () {},
          buttonSize: CustomSmallButtonSize.small,
          prefixIcon: Icon(
            Icons.date_range_rounded,
            size: 15,
          ),
        )
      ],
    );
  }
}
