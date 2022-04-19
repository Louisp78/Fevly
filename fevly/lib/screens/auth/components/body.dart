import 'package:fevly/components/custom_auth_app_bar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/screens/auth/components/form_section.dart';
import 'package:fevly/screens/auth/view_models/sign_in_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Body of Authentification screen
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
          child: Column(
            children: [
              CustomAuthAppBar(
                title: appState.loginState != ApplicationLoginState.loggedOut
                    ? "Fevly"
                    : "",
                leading: CustomIconButton(
                  size: const CustomIconButtonSize.small(),
                  press: () {
                    if (appState.loginState !=
                        ApplicationLoginState.loggedOut) {
                      appState.cancelRegistration();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  outline: true,
                  circle: false,
                  icon: Icons.arrow_back_ios_rounded,
                  iconColor: themeColor.onBackground,
                  backgroundColor: themeColor.background,
                  borderColor: themeColor.onBackground,
                ),
              ),
              Expanded(child: const FormSection()),
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
