import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/fom_validate.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.keyForm,
    required this.formValidate,
  }) : super(key: key);

  final GlobalKey<FormState> keyForm;
  final FormValidate formValidate;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSmallButton(
          press: () {
            final bool validate =
                keyForm.currentState!.validate() && formValidate.formValid;

            if (validate) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kSurfaceColor,
                  content: Text(
                    'Félicitation connexion réussie!',
                    style: textTheme.headline4?.copyWith(color: kDoneColor),
                  ),
                ),
              );
              Navigator.pushNamed(context, '/profile');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kSurfaceColor,
                  content: Text(
                    snackBarMissingField,
                    style: textTheme.headline4?.copyWith(color: kPrimaryColor),
                  ),
                ),
              );
            }
          },
          text: "Connexion",
          borderColor: formValidate.formValid ? kPrimaryColor : kTextColor,
          size: CustomSmallButtonSize.normal,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        SizedBox(
          width: size.width * 0.8,
          child: Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("ou"),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        CustomTextButton(
          press: () {},
          text: "Connexion avec Google",
          prefixIcon: SvgPicture.asset(
            "assets/icons/google.svg",
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
