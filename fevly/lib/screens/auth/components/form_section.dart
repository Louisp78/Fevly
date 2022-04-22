import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/auth/components/email_form.dart';
import 'package:fevly/screens/auth/components/register_form.dart';
import 'package:fevly/screens/auth/components/sign_in_form.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form multiusage depending of application state
class FormSection extends StatelessWidget {
  const FormSection();
  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);

    switch (appState.loginState) {
      case ApplicationLoginState.loggedOut:
        return SizedBox(
          width: size.width * 0.7,
          child: Column(
            children: [
              SizedBox(height: kBasicVerticalPadding(size: size)),
              AutoSizeText.rich(
                TextSpan(text: 'F', children: [
                  TextSpan(
                    text: 'evly',
                    style: textTheme.headline1!.copyWith(
                      fontSize: 65,
                      letterSpacing: 3,
                      color: themeColor.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                style: textTheme.headline1!
                    .copyWith(color: themeColor.primary, fontSize: 75),
              ),
              Spacer(),
              CustomTextButton(
                press: () => appState.startLoginFlow(),
                text: 'Se connecter par email',
                prefixIcon: Icon(
                  Icons.email_rounded,
                  color: themeColor.background,
                ),
              ),
              SizedBox(
                height: kBasicVerticalPadding(size: size),
              ),
            ],
          ),
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm();
      case ApplicationLoginState.password:
        return SignInForm(
          email: appState.emailAddress!,
        );

      case ApplicationLoginState.register:
        return RegisterForm(
          email: appState.emailAddress!,
        );
      default:
        return Center(
          child: Text('Error'),
        );
    }
  }
}
