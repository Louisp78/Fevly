import 'package:fevly/components/custom_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/models/fom_validate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'form_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => FormValidate(),
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
            const FormSection(),
          ],
        ),
      ),
    );
  }
}
