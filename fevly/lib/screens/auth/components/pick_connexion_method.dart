import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Display list of buttons with connexion methods
/// For Google and Email connection
class PickConnexionMethod extends StatelessWidget {
  const PickConnexionMethod();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          //const Spacer(),
          SizedBox(height: size.height * 0.42),
          CustomTextButton(
            press: () {
              if (authVM.isLoading) return; // avoid multiple clicks
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
          CustomLoadingButton(
            onPressed: () async {
              if (authVM.isLoading) return; // avoid mutiple clicks
              await appState.signInWithGoogle(
                onNetworkRequestFailed: () => handleNetworkError(context),
                onOperationNotAllowed: () => handleOperationNotAllowed(context),
                onTooManyRequests: () => handleTooManyRequests(context),
                onSuccess: () => buildRoute(
                    context: context, loginState: appState.loginState),
              );
            },
            text_not_loading: 'Se connecter avec Google',
            prefixIcon: SvgPicture.asset('assets/base/google.svg',
                color: themeColor.background),
            is_loading: authVM.isLoading,
            text_color_is_loading: themeColor.onBackground,
            background_color_is_loading: themeColor.onSurface,
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
        Navigator.pushNamed(context, '/email');
        break;
      default:
        break;
    }
  }
}
