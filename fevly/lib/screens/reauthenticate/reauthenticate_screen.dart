import 'package:fevly/screens/reauthenticate/components/body.dart';

import 'package:flutter/material.dart';

/// type of reauthentication
enum ReauthenticationType {
  /// reauthenticate for delete account
  deleteAccount,

  /// reauthenticate for change password
  changePassword,

  /// reauthenticate for change email
  changeEmail,

  /// reauthenticate for change phone number
  changePhoneNumber,
}

class ReauthenticateScreen extends StatelessWidget {
  const ReauthenticateScreen({required this.type, this.strValue});

  final ReauthenticationType type;

  /// email or password value
  final String? strValue;

  // Route : /reauthenticate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        type: type,
        strValue: strValue,
      ),
    );
  }
}
