import 'package:fevly/components/custom_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:flutter/material.dart';

import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            CustomAppBar(
              title: "S'inscrire",
              leading: CustomIconButton(
                size: const CustomIconButtonSize.small(),
                press: () => Navigator.pop(context),
                outline: true,
                circle: false,
                icon: Icons.arrow_back_ios_rounded,
              ),
            ),
            const FormSection(),
            const Spacer(),
            CustomTextButton(
              press: () => Navigator.pushNamed(context, '/signin_step2'),
              text: "Suivant",
              suffixIcon: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
