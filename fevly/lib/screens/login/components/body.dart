import 'package:fevly/components/custom_auth_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = initThemeColor();
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAuthAppBar(
            leading: CustomIconButton(
              size: const CustomIconButtonSize.small(),
              press: () => Navigator.pop(context),
              outline: true,
              circle: false,
              icon: Icons.arrow_back_ios_rounded,
              iconColor: themeColor.kBaseOppositeColor,
              backgroundColor: themeColor.kBaseColor,
              borderColor: themeColor.kBaseOppositeColor,
            ),
            title: "Connexion",
          ),
          const FormSection(),
        ],
      ),
    );
  }
}
