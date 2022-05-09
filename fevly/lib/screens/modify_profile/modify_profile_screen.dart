import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/modify_profile/components/body.dart';

/// Route : /profile/modify
class ModifyProfileScreen extends StatelessWidget {
  const ModifyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // user not null
    return Scaffold(
      body: user != null ? Body() : Container(),
    );
  }
}
