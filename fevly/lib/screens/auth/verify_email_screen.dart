import 'package:fevly/components/dialog/disconnect.dart';
import 'package:fevly/screens/auth/components/verify_email_form.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:provider/provider.dart';

/// Route : / and /verify_email
/// User is already logged in and need to verify his email at this stage
/// Email verification is mandatory for the user to be able to access the [DashboardScreen]
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        buildDisconnectDialog(context: context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Body(
          formContent: ChangeNotifierProvider<CustomTimer>(
            create: (context) =>
                CustomTimer(number_of_seconds: 60, reload_user: true),
            child: const VerifyEmailForm(),
          ),
        ),
      ),
    );
  }
}
