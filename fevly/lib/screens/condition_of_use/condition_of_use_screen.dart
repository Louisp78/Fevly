import 'package:flutter/material.dart';
import 'components/body.dart';

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
