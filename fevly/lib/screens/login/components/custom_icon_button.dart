import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButtonSize {
  CustomIconButtonSize({
    required this.borderRadius,
    required this.sizeContainer,
    required this.iconSize,
    required this.padding,
  });

  final double borderRadius, sizeContainer, iconSize, padding;

  const CustomIconButtonSize.small({
    this.borderRadius = 12.0,
    this.sizeContainer = 29.0,
    this.iconSize = 16.0,
    this.padding = 7.0,
  });
  const CustomIconButtonSize.normal({
    this.borderRadius = 13.0,
    this.sizeContainer = 37.0,
    this.iconSize = 24.0,
    this.padding = 10.0,
  });
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.press,
    this.lightMode = true,
    this.circle = true,
    this.outline = false,
    required this.size,
    required this.icon,
  }) : super(key: key);

  final GestureTapCallback press;
  final bool lightMode;
  final bool circle;
  final bool outline;
  final CustomIconButtonSize size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
      color: outline
          ? Colors.white
          : (lightMode ? kPrimaryColor : kDarkPrimaryColor),
      border: Border.all(
        width: outline ? 2.0 : 0.0,
        color: outline
            ? (lightMode ? Colors.black : Colors.white)
            : Colors.transparent,
      ),
    );

    return InkWell(
      highlightColor: kPrimaryColor,
      onTap: press,
      borderRadius: BorderRadius.circular(size.borderRadius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.sizeContainer,
            height: size.sizeContainer,
            alignment: Alignment.center,
            decoration: circle
                ? boxDecoration.copyWith(
                    shape: BoxShape.circle,
                  )
                : boxDecoration.copyWith(
                    borderRadius: BorderRadius.circular(size.borderRadius),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.padding),
            child: Icon(
              icon,
              size: size.iconSize,
              color: outline
                  ? (lightMode ? Colors.black : Colors.white)
                  : (lightMode ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
