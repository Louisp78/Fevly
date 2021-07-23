import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CounterItem extends StatelessWidget {
  const CounterItem({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      children: [
        Text(title.toUpperCase(),
            style: textTheme.headline5?.copyWith(color: Colors.white)),
        const SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryVariantColor),
            child: Text(
              count.toString(),
              style: textTheme.headline5,
            ),
          ),
        ),
      ],
    );
  }
}
