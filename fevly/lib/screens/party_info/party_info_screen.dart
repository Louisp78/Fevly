import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';


class PartyInfoScreen extends StatelessWidget {
  const PartyInfoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: kPrimaryVariantColor,
      body: const Body(),
    );
  }
}

