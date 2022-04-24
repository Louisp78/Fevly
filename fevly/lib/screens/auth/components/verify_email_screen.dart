import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/custom_timer.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => Provider.of<CustomTimer>(context, listen: false).startTimer());
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
                  ? 'Renvoyer l\'email de verification ' +
                      "${customTimer.counter.inSeconds}"
                  : 'Renvoyer l\'email de verification',
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
