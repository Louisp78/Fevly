import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomSmallButtonSize { small, normal }

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    required this.size,
    this.lightMode = true,
    this.withBorder = true,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final CustomSmallButtonSize size;
  final bool lightMode;
  final bool withBorder;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final bool isSmall = size == CustomSmallButtonSize.small;
    return InkWell(
      onTap: press,
      child: Container(
        height: isSmall ? 24 : 30,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: withBorder
              ? Border.all(
                  width: 4,
                  color: lightMode ? kPrimaryColor : kDarkPrimaryColor)
              : null,
          color: withBorder
              ? null
              : (lightMode ? kSurfaceLightColor : kDarkSurfaceLightColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 5),
            Text(
              text,
              style: isSmall
                  ? textTheme.headline5?.copyWith(
                      color: lightMode ? Colors.black : Colors.white,
                    )
                  : textTheme.headline3?.copyWith(
                      color: lightMode ? Colors.black : Colors.white,
                    ),
            ),
            if (suffixIcon != null) const SizedBox(width: 5),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
