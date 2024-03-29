import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarChat extends StatelessWidget {
  const BottomBarChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextField(
          padding: EdgeInsets.only(bottom: kBasicVerticalPadding(size: size)),
          hintText: "Envoyer un message ...",
          isSelected: true,
          onChanged: (value) => null,
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMissed(
                  source: "adresse mail ou le nom d'utilisateur");
            }
            return null;
          },
        ),
        SizedBox(width: size.width * 0.03),
        Column(
          children: [
            const SizedBox(height: 8),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: Icon(
                Icons.send_rounded,
                color: themeColor.primary,
                size: size.width * 0.08,
              ),
            ),
          ],
        )
      ],
    );
  }
}
