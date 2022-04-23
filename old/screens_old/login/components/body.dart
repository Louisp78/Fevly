import 'package:fevly/components/custom_auth_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/screens/login/components/form_section.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
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
              iconColor: themeColor.onBackground,
              backgroundColor: themeColor.background,
              borderColor: themeColor.onBackground,
            ),
            title: "Connexion",
          ),
          const FormSection(),
        ],
      ),
    );
  }
}
