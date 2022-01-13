import 'package:fevly/models/party.dart';
import 'package:fevly/screens/party/components/body.dart';
import 'package:flutter/material.dart';


class PartyScreen extends StatelessWidget {
  final Party party;

  const PartyScreen({
    required this.party
  }); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(party: party,),
    );
  }
}
