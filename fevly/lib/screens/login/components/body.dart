import 'package:fevly/components/custom_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_section.dart';
import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            CustomAppBar(
              leading: CustomIconButton(
                size: const CustomIconButtonSize.small(),
                press: () => Navigator.pop(context),
                outline: true,
                circle: false,
                icon: Icons.arrow_back_ios_rounded,
              ),
              title: "Connexion",
            ),
            FormSection(textTheme: textTheme, size: size),
            const Spacer(),
            BottomSection(size: size),
          ],
        ),
      ),
    );
  }
}
