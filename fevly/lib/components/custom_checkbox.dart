import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    this.isCheck = false,
    required this.press,
  }) : super(key: key);

  final bool isCheck;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return InkWell(
      onTap: press,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: themeColor.surface,
                borderRadius: BorderRadius.circular(4)),
          ),
          if (isCheck)
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: themeColor.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
