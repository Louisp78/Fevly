import 'package:fevly/screens/auth/components/verify_email_form.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:provider/provider.dart';

/// Route : /auth/logged_out/verify_email
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
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
