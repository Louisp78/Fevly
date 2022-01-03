import 'package:fevly/screens/condition_of_use/components/body.dart';
import 'package:flutter/material.dart';

class TermOfUseScreen extends StatelessWidget {
  const TermOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
