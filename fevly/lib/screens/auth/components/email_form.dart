import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/errors_msg.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form to enter email
class EmailForm extends StatefulWidget {
  const EmailForm();

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();
  String? email_error_msg;

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
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
          height: size.height * 0.1,
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
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
                Spacer(),
                CustomTextButton(
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await appState
                            .verifyEmailAddress(
                              emailAddress: _controller.text,
                            )
                            .then((value) => setState(
                                  () => email_error_msg = null,
                                ));
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          email_error_msg = e.message;
                        });
                      }
                    }
                  },
                  text: 'Suivant',
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
