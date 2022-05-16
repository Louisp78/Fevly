import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form for verify email
class VerifyEmailForm extends StatefulWidget {
  const VerifyEmailForm({Key? key}) : super(key: key);

  @override
  State<VerifyEmailForm> createState() => _VerifyEmailFormState();
}

class _VerifyEmailFormState extends State<VerifyEmailForm> {
  @override
  void initState() {
    super.initState();

    // Start timer after build is completed
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
          AutoSizeText('Verifier votre email',
              style: textTheme.headline1!, maxLines: 1),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
          Text(
            '${FirebaseAuth.instance.currentUser?.email}',
            style: textTheme.displayMedium!.apply(color: themeColor.primary),
          ),
          const Spacer(),
          CustomLoadingButton(
            onPressed: () async {
              authVM.isLoading = true;

              // Update current [BuildContext] because the user listener can be call here
              await appState.reloadUser(
                context: context,
                onNetworkRequestFailed: () => handleNetworkError(context),
                onTooManyRequests: () => handleTooManyRequests(context),
                onOperationNotAllowed: () => handleOperationNotAllowed(context),
              );

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
                  await appState.sendEmailVerification(
                      onNetworkRequestFailed: () => handleNetworkError(context),
                      onTooManyRequests: () => handleTooManyRequests(context),
                      onOperationNotAllowed: () =>
                          handleOperationNotAllowed(context));
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
}
