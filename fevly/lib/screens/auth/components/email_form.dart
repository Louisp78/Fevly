import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/components/snackbar/basic_snackbar.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/anim/martini_anim.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
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

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: AutoSizeText(
              "S'identifier",
              maxLines: 1,
              style: textTheme.headline1,
            ),
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size) * 2,
          ),
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
          SizedBox(
            height: kBasicVerticalPadding(size: size) * 2,
          ),
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
          SizedBox(
            height: kBasicVerticalPadding(size: size) * 2,
          ),
          CustomLoadingButton(
            onPressed: () async {
              authVM.setwidthAndHeightAndColor(
                  size.height, size.width, themeColor.onSurface);

              if (_formKey.currentState!.validate()) {
                authVM.isLoading = true;
                await appState.verifyEmailAddress(
                    onInvalidEmail: () =>
                        setState(() => emailErrorMsg = Kemail_badly_formatted),
                    onTooManyRequests: () => setState(
                        () => emailErrorMsg = Ktoo_many_requests_error_msg),
                    onNetworkRequestFailed: () => handleNetworkError(context),
                    emailAddress: _controller.text,
                    onSuccess: () async {
                      MartiniAnim.changeShowStatus();
                      authVM.setwidthAndHeightAndColor(
                          0, 0, Colors.transparent);
                      await Future.delayed(
                        MartiniAnim.delayDuration,
                        () => buildRoute(
                          context: context,
                          loginState: appState.loginState,
                        ),
                      );
                    });

                if (appState.loginState == ApplicationLoginState.loggedOut) {
                  buildBasicSnackbar(
                      context: context,
                      message: Kemail_already_in_use_by_google);
                }
                authVM.isLoading = false;
              }
            },
            text_not_loading: 'Suivant',
            text_color_is_loading: themeColor.onBackground,
            background_color_is_loading: themeColor.onSurface,
            is_loading: authVM.isLoading,
          ),
        ],
      ),
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
        Navigator.pushNamed(context, '/email/register').then((value) {
          /// After poping the [RegisterScreen] reload the martini animation
          authVM.isLoading = false;
          emailErrorMsg = null;
          Future.delayed(MartiniAnim.delayDuration, () {
            MartiniAnim.changeShowStatus();
          });
        });
        break;
      case ApplicationLoginState.password:
        Navigator.pushNamed(context, '/email/sign_in').then((value) {
          /// After poping the [SignInScreen] reload the martini animation
          authVM.isLoading = false;
          Future.delayed(MartiniAnim.delayDuration, () {
            MartiniAnim.changeShowStatus();
          });
        });
        break;

      default:
        break;
    }
  }

  @override
  void dispose() {
    emailErrorMsg = null;
    super.dispose();
  }
}
