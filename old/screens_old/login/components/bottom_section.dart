import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/login/view_models/login_model_view.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/test_data/data_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.keyForm,
    required this.loginViewModel,
  }) : super(key: key);

  final GlobalKey<FormState> keyForm;
  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSmallButton(
          press: () {
            final bool validate =
                keyForm.currentState!.validate() && loginViewModel.isFormValid;

            if (validate) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: themeColor.surface,
                  content: Text(
                    'Félicitation connexion réussie!',
                    style: textTheme.headline4
                        ?.copyWith(color: kDoneColor),
                  ),
                ),
              );
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: kCurrentUser,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: themeColor.surface,
                  content: Text(
                    kSnackBarMissingField,
                    style: textTheme.headline4
                        ?.copyWith(color: themeColor.primary),
                  ),
                ),
              );
            }
          },
          text: "Connexion",
          textColor: loginViewModel.isFormValid
              ? themeColor.primary
              : textTheme.headline1!.color,
          borderColor: loginViewModel.isFormValid
              ? themeColor.primary
              : kTextColor,
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
            "assets/base/google.svg",
            color: themeColor.background,
          ),
        ),
      ],
    );
  }
}
