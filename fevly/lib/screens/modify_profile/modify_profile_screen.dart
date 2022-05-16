import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/modify_profile/components/body.dart';

/// Route : /profile/modify
/// This screen permit to modify the user's profile
class ModifyProfileScreen extends StatelessWidget {
  const ModifyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // user not null
    return Scaffold(
      // FIXME: use a better way to manage reauthentication and user null safety
      body: user != null ? Body() : Container(),
    );
  }
}
