import 'package:flutter/material.dart';
import 'package:fevly/screens/modify_password/components/body.dart';

class ModifyPasswordScreen extends StatefulWidget {
  ModifyPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ModifyPasswordScreen> createState() => _ModifyPasswordScreenState();
}

class _ModifyPasswordScreenState extends State<ModifyPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(size: size),
    );
  }
}
