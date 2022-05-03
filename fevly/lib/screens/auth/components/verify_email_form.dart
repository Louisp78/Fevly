import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_snackbar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyEmailForm extends StatefulWidget {
  const VerifyEmailForm({Key? key}) : super(key: key);

  @override
  State<VerifyEmailForm> createState() => _VerifyEmailFormState();
}

class _VerifyEmailFormState extends State<VerifyEmailForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<CustomTimer>(context, listen: false).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    return SizedBox(
      width: size.width * 0.7,
      child: Column(
        children: [
          AutoSizeText('Verify your email address',
              style: textTheme.headline1!, maxLines: 1),
          const Spacer(),
          CustomLoadingButton(
            onPressed: () async {
              authVM.isLoading = true;
              print('current user : ${FirebaseAuth.instance.currentUser}');
              // Update current context because the user listener can be call here
              try {
                await FirebaseAuth.instance.currentUser!.reload().then(
                    (value) => builRoute(
                        context: context, loginState: appState.loginState));
              } on FirebaseAuthException catch (e) {
                if (e.code == 'network-request-failed') {
                  handleNetworkError(context);
                }
              }
              authVM.isLoading = false;
            },
            text_not_loading: "J'ai vérifié mon email",
            is_loading: authVM.isLoading,
            text_color_is_loading: themeColor.onBackground,
            background_color_is_loading: themeColor.onSurface,
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
          Consumer<CustomTimer>(builder: (context, customTimer, _) {
            return CustomTextButton(
              press: () async {
                if (customTimer.counter.inSeconds == 0) {
                  try {
                    await FirebaseAuth.instance.currentUser!
                        .sendEmailVerification();
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                    print(e.message);
                  }
                  customTimer.resetTimer();
                  customTimer.startTimer();
                }
              },
              text: customTimer.counter.inSeconds > 0
                  ? "Renvoyer l'email de verification " +
                      "${customTimer.counter.inSeconds}"
                  : "Renvoyer l'email de verification",
              backgroundColor:
                  customTimer.counter.inSeconds > 0 ? themeColor.surface : null,
              textColor: customTimer.counter.inSeconds > 0
                  ? themeColor.onSurface
                  : null,
            );
          }),
        ],
      ),
    );
  }

  void builRoute(
      {required BuildContext context,
      required ApplicationLoginState loginState}) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    switch (loginState) {
      case ApplicationLoginState.verifyEmail:
        ScaffoldMessenger.of(context).showSnackBar(
          buildCustomSnackBar(
            themeColor: themeColor,
            textTheme: textTheme,
            size: size,
            text: 'Email non validé 🙃',
          ),
        );
        break;
      case ApplicationLoginState.loggedIn:
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => route.isFirst);
        break;
      default:
        throw Exception('Unknown login state: $loginState');
    }
  }
}
