import 'package:fevly/screens/auth/anim/martini_anim.dart';
import 'package:fevly/screens/auth/components/email_form.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:provider/provider.dart';

/// Route: /auth/logged_out/email
class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel =
        Provider.of<AuthViewModel>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        MartiniAnim.changeShowStatus();
        authViewModel.setwidthAndHeightAndColor(0, 0, Colors.transparent);
        await Future.delayed(MartiniAnim.delayDuration, () {
          Navigator.popUntil(context, (route) => route.isFirst);
        });
        return false;
      },
      child: const Scaffold(
        body: Body(formContent: EmailForm()),
      ),
    );
  }
}
