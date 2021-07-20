import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
    required this.textTheme,
    required this.size,
  }) : super(key: key);

  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vous êtes de\nretour!",
              style: textTheme.headline1,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const CustomTextField(
              hintText: "Nom d'utilisateur ou adresse mail",
              isSelected: true,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomTextField(
              hintText: "Mot de passe",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Mot de passe oublié ?",
              style: textTheme.bodyText1?.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomSmallButton(
              text: "S'inscrire",
              press: () => Navigator.pushNamed(context, '/signin_step1'),
              size: CustomSmallButtonSize.small,
              suffixIcon: const Icon(
                Icons.arrow_forward_rounded,
                size: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
