import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/errors_msg.dart';
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
  String? email_error_msg;

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: AutoSizeText(
            'S\'identifier',
            maxLines: 1,
            style: textTheme.headline1,
          ),
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size) * 2.5,
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.7,
                  child: CustomTextField(
                    error_msg: email_error_msg,
                    controller: _controller,
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
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
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: size.height * 0.4,
                    child: RiveAnimation.asset(
                      'assets/anim/martini.riv',
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                      stateMachines: ['basicSM'],
                      onInit: MartiniAnim.onRiveInit,
                    ),
                  ),
                ),
                Spacer(),
                CustomLoadingButton(
                  onPressed: () async {
                    authVM.setwidthAndHeightAndColor(
                        size.height, size.width, themeColor.primary);

                    if (_formKey.currentState!.validate()) {
                      authVM.isLoading = true;
                      try {
                        await appState
                            .verifyEmailAddress(
                              functionBeforeRebuild: () {
                                MartiniAnim.exitAnim();
                                authVM.setwidthAndHeightAndColor(
                                    0, 0, Colors.transparent);
                              },
                              delayBeforeRebuild: 1,
                              emailAddress: _controller.text,
                            )
                            .then((value) => setState(
                                  () => email_error_msg = null,
                                ))
                            .then((value) => authVM.isLoading = false);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          email_error_msg = e.message;
                        });
                      }
                    }
                  },
                  text_is_loading: 'Chargement',
                  text_not_loading: 'Suivant',
                  text_color_is_loading: themeColor.onBackground,
                  text_color_not_loading: null,
                  background_color_is_loading: themeColor.onSurface,
                  background_color_not_loading: null,
                  is_loading: authVM.isLoading,
                ),
                //SizedBox(height: kBasicVerticalPadding(size: size)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
