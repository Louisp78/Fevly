import 'package:fevly/components/custom_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constant.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return RawScrollbar(
      thumbColor: kPrimaryVariantColor,
      radius: const Radius.circular(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: "Conditions d’utilisations",
              leading: CustomIconButton(
                size: const CustomIconButtonSize.small(),
                press: () => Navigator.pop(context),
                outline: true,
                circle: false,
                icon: Icons.arrow_back_ios_rounded,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.05),
              child: Text(
                termOfUse,
                style: textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}