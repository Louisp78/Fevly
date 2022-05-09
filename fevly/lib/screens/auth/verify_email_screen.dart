import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fevly/screens/auth/components/verify_email_form.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Route : /auth/logged_out/verify_email
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final ApplicationState appState = Provider.of<ApplicationState>(context);

    return WillPopScope(
      onWillPop: () async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.QUESTION,
          headerAnimationLoop: false,
          title: 'Se déconnecter',
          desc: 'Voulez-vous vraiment vous déconnecter ?',
          descTextStyle: textTheme.bodyMedium,
          btnOkColor: themeColor.surface,
          btnCancelText: 'Non',
          btnOkText: 'Oui',
          btnCancelColor: themeColor.primary,
          buttonsTextStyle: textTheme.bodyLarge,
          titleTextStyle: textTheme.bodyLarge,
          showCloseIcon: true,
          btnCancelOnPress: () {},
          btnOkOnPress: () => appState
              .signOut()
              .then((value) => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (Route<dynamic> route) => false,
                  )),
        ).show();
        return false;
      },
      child: Scaffold(
        body: Body(
            formContent: ChangeNotifierProvider<CustomTimer>(
                create: (context) =>
                    CustomTimer(number_of_seconds: 60, reload_user: true),
                child: const VerifyEmailForm())),
      ),
    );
  }
}
