import 'package:fevly/components/custom_auth_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/screens/signin/signin_step1/view_models/signin_step1_view_model.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor();
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ChangeNotifierProvider(
          create: (context) => SignInStep1ViewModel(),
          child: Column(
            children: [
              CustomAuthAppBar(
                title: "S'inscrire",
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
              ),
              const FormSection(),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
