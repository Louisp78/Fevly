import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Form to enter email
class EmailForm extends StatefulWidget {
  const EmailForm({
    required this.callback,
  });

  final void Function(String email) callback;

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  controller: _controller,
                  hintStyle: kBasicHintStyle(textTheme: textTheme),
                  hintText: 'Entrer une adresse email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email to continue";
                    }
                    return null;
                  },
                ),
                Spacer(),
                CustomTextButton(
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      widget.callback(_controller.text);
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
