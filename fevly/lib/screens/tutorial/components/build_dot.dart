import 'package:fevly/styles/colors.dart';
import 'package:flutter/cupertino.dart';

AnimatedContainer buildDot({required int index, required int currentPage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kPrimaryVariantColor,
        borderRadius: BorderRadius.circular(3)),
  );
}
