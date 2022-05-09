import 'package:fevly/components/custom_lite_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/auth/anim/martini_anim.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Body of Authentification screen
class Body extends StatelessWidget {
  const Body({
    required this.formContent,
  });

  final Widget formContent;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final ApplicationState appState = Provider.of<ApplicationState>(context);

    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Consumer<AuthViewModel>(builder: (context, authVM, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                height: authVM.height,
                width: authVM.width,
                duration: const Duration(milliseconds: 700),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: authVM.backgroundColor,
                ),
              ),
              Column(
                children: [
                  CustomLiteAppBar(
                    title: "Fevly",
                    leading: CustomIconButton(
                      size: const CustomIconButtonSize.small(),
                      press: () {
                        // Exit animations
                        authVM.setwidthAndHeightAndColor(
                            0, 0, Colors.transparent);
                        // Let the animation finish before popping
                        MartiniAnim.changeShowStatus();
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        });
                      },
                      outline: true,
                      circle: false,
                      icon: Icons.arrow_back_ios_rounded,
                      iconColor: themeColor.onBackground,
                      backgroundColor: themeColor.background,
                      borderColor: themeColor.onBackground,
                    ),
                  ),
                  Expanded(child: formContent),
                  SizedBox(
                    height: kBasicVerticalPadding(size: size),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
