import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_snackbar.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/anim/martini_anim.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

/// Form to enter email
class EmailForm extends StatefulWidget {
  const EmailForm();

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();
  String? emailErrorMsg;

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: AutoSizeText(
                    "S'identifier",
                    maxLines: 1,
                    style: textTheme.headline1,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: size.width * 0.7,
                  child: CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    error_msg: emailErrorMsg,
                    controller: _controller,
                    label_text: 'Email',
                    hintText: 'Entrer une adresse email',
                    validator: (value) {
                      /// Regex of email validation
                      if (value!.isEmpty) {
                        return Kemail_error_msg;
                      }
                      return null;
                    },
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: size.height * 0.4,
                    child: const RiveAnimation.asset(
                      'assets/anim/martini.riv',
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                      stateMachines: ['basicSM'],
                      onInit: MartiniAnim.onRiveInit,
                    ),
                  ),
                ),
                const Spacer(),
                CustomLoadingButton(
                  onPressed: () async {
                    authVM.setwidthAndHeightAndColor(
                        size.height, size.width, themeColor.onSurface);

                    if (_formKey.currentState!.validate()) {
                      authVM.isLoading = true;
                      try {
                        await appState
                            .verifyEmailAddress(
                          emailAddress: _controller.text,
                        )
                            .then((value) async {
                          MartiniAnim.changeShowStatus();
                          authVM.setwidthAndHeightAndColor(
                              0, 0, Colors.transparent);
                          await Future.delayed(
                              MartiniAnim.delayDuration,
                              () => buildRoute(
                                  context: context,
                                  loginState: appState.loginState));
                        });

                        if (appState.loginState ==
                            ApplicationLoginState.loggedOut) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            buildCustomSnackBar(
                              themeColor: themeColor,
                              textTheme: textTheme,
                              size: size,
                              text:
                                  'Cette email est déjà utilisé par un compte Google ⛔',
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        print('FirebaseAuthException: ${e.code}');
                        setState(() {
                          emailErrorMsg = handleFireEmailException(
                              code: e.code, context: context);
                        });

                        authVM.isLoading = false;
                      }
                    }
                  },
                  text_not_loading: 'Suivant',
                  text_color_is_loading: themeColor.onBackground,
                  background_color_is_loading: themeColor.onSurface,
                  is_loading: authVM.isLoading,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void buildRoute(
      {required BuildContext context,
      required ApplicationLoginState loginState}) {
    final AuthViewModel authVM =
        Provider.of<AuthViewModel>(context, listen: false);
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        Navigator.pop(context);
        break;
      case ApplicationLoginState.register:
        Navigator.pushNamed(context, '/auth/logged_out/register').then((value) {
          authVM.isLoading = false;
          emailErrorMsg = null;
          Future.delayed(MartiniAnim.delayDuration, () {
            MartiniAnim.changeShowStatus();
          });
        });
        break;
      case ApplicationLoginState.password:
        Navigator.pushNamed(context, '/auth/logged_out/sign_in');
        break;

      default:
        throw Exception('Unknown login state: $loginState');
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailErrorMsg = null;
  }
}
