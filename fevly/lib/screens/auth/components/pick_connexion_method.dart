import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Display list of buttons with connexion methods
class PickConnexionMethod extends StatelessWidget {
  const PickConnexionMethod();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        children: [
          SizedBox(height: kBasicVerticalPadding(size: size)),
          AutoSizeText.rich(
            TextSpan(text: 'F', children: [
              TextSpan(
                text: 'evly',
                style: textTheme.headline1!.copyWith(
                  fontSize: 75,
                  letterSpacing: 3,
                  color: themeColor.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            style: textTheme.headline1!
                .copyWith(color: themeColor.primary, fontSize: 85),
          ),
          const Spacer(),
          CustomTextButton(
            press: () {
              appState.startLoginFlow();
              buildRoute(context: context, loginState: appState.loginState);
            },
            text: 'Se connecter par email',
            prefixIcon: Icon(
              Icons.email_rounded,
              color: themeColor.background,
            ),
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
          CustomTextButton(
            press: () async {
              try {
                await appState.signInWithGoogle().then((value) => buildRoute(
                    context: context, loginState: appState.loginState));
              } on PlatformException catch (e) {
                print('PlatformException : ${e}');
                if (e.code == 'network_error') {
                  handleNetworkError(context);
                }
                /*if (e.code == 'network_error') {
                  handleNetworkError(context);
                }*/
              }
            },
            text: 'Se connecter avec Google',
            prefixIcon: SvgPicture.asset('assets/base/google.svg',
                color: themeColor.background),
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
        ],
      ),
    );
  }

  void buildRoute(
      {required BuildContext context,
      required ApplicationLoginState loginState}) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        break;
      case ApplicationLoginState.emailAddress:
        Navigator.pushNamed(context, '/auth/logged_out/email');
        break;
      case ApplicationLoginState.loggedIn:
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
        break;
      default:
        throw Exception('Unknown login state: $loginState');
    }
  }
}
