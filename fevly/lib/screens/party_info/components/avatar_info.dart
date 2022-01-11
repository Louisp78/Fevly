import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

class AvatarInfo extends StatelessWidget {
  const AvatarInfo({
    Key? key,
    required this.size,
    required this.textTheme, required this.text,
  }) : super(key: key);
  
  final Size size;
  final TextTheme textTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Column(
        children: [
          CustomCircleAvatar(press: (){},),
          const SizedBox(height: 5),
          Text(
            text,
            style: textTheme.headline6,
            ),
        ],
      ),
    );
  }
}
