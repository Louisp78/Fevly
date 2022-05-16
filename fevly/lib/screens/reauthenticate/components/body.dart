import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/reauthenticate/components/reauthenticate_form.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:flutter/material.dart';

/// Body of [ReauthenticateScreen]
class Body extends StatelessWidget {
  const Body({required this.type, this.strValue});

  final ReauthenticationType type;
  final String? strValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const CustomLiteAppBar(
              title: 'Fevly',
            ),
            Expanded(
              child: ReauthenticateForm(
                type: type,
                strValue: strValue,
              ),
            ),
            SizedBox(
              height: kBasicVerticalPadding(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
