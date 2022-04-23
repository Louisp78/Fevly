import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  static int number_of_seconds = 60;
  Duration _counter = Duration(seconds: number_of_seconds);

  Timer? curr_timer;

  void resetTimer() {
    setState(() {
      _counter = Duration(seconds: number_of_seconds);
    });
  }

  Timer startTimer() {
    return Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter.inSeconds > 0) {
          _counter = _counter - Duration(seconds: 1);
        } else {
          timer.cancel();
          FirebaseAuth.instance.currentUser!.reload();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    curr_timer = startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
    return SizedBox(
      width: size.width * 0.7,
      child: Column(
        children: [
          AutoSizeText('Verify your email address',
              style: textTheme.headline1!, maxLines: 1),
          Spacer(),
          CustomLoadingButton(
            onPressed: () async {
              authVM.isLoading = true;
              await FirebaseAuth.instance.currentUser!
                  .reload()
                  .then((value) => authVM.isLoading = false);
            },
            text_not_loading: 'J\'ai vérifié mon email',
            is_loading: authVM.isLoading,
            text_color_is_loading: themeColor.onBackground,
            background_color_is_loading: themeColor.onSurface,
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size),
          ),
          CustomTextButton(
            press: () async {
              if (_counter.inSeconds == 0) {
                try {
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification();
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  print(e.message);
                }
                resetTimer();
                curr_timer = startTimer();
              }
            },
            text: _counter.inSeconds > 0
                ? 'Renvoyer l\'email de verification ' + "${_counter.inSeconds}"
                : 'Renvoyer l\'email de verification',
            backgroundColor: _counter.inSeconds > 0 ? themeColor.surface : null,
            textColor: _counter.inSeconds > 0 ? themeColor.onSurface : null,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (curr_timer != null) curr_timer!.cancel();
  }
}
