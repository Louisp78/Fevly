import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';

class CustomIconButtonSize {
  CustomIconButtonSize({
    required this.borderRadius,
    required this.sizeContainer,
    required this.iconSize,
  });

  final double borderRadius;
  final double sizeContainer;
  final double iconSize;

  const CustomIconButtonSize.small({
    this.borderRadius = 12.0,
    this.sizeContainer = 29.0,
    this.iconSize = 16.0,
  });
  const CustomIconButtonSize.normal({
    this.borderRadius = 13.0,
    this.sizeContainer = 37.0,
    this.iconSize = 24.0,
  });
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.press,
    this.lightMode = true,
    this.circle = true,
    this.outline = false,
    this.size = const CustomIconButtonSize.normal(),
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.withShadow = false,
    this.borderColor,
  }) : super(key: key);

  final GestureTapCallback press;
  final bool lightMode;
  final bool circle;
  final bool outline;
  final CustomIconButtonSize size;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool withShadow;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
      color: backgroundColor ??
          (outline
              ? Colors.white
              : (lightMode ? kPrimaryColor : kDarkPrimaryColor)),
      border: Border.all(
        width: outline ? 2.0 : 0.0,
        color: borderColor ??
            (outline
                ? (lightMode ? Colors.black : Colors.white)
                : Colors.transparent),
      ),
      boxShadow: withShadow ? [kDarkShadowBase] : null,
    );

    return InkWell(
      highlightColor: kPrimaryColor,
      onTap: press,
      borderRadius: BorderRadius.circular(size.borderRadius),
      child: Container(
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
        child: Icon(
          icon,
          size: size.iconSize,
          color: iconColor ??
              (outline
                  ? (lightMode ? Colors.black : Colors.white)
                  : (lightMode ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
