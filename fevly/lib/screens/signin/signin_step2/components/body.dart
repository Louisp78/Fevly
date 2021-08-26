import 'package:fevly/components/custom_auth_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/screens/signin/signin_step2/view_models/signin_step2_view_model.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => SignInStep2ViewModel(),
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
            FormSection(
              email: email,
              password: password,
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
