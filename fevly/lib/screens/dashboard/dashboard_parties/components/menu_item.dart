import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.iconData,
    this.isSelected = false,
  }) : super(key: key);

  final IconData iconData;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Icon(
            iconData,
            color: isSelected ? themeColor.primary : null,
            size: 31,
          ),
          if (isSelected)
            Container(
              height: 3,
              width: 31,
              decoration: BoxDecoration(color: themeColor.primary),
            ),
        ],
      ),
    );
  }
}
