import 'package:fevly/models/party.dart';
import 'package:fevly/screens/party_info/components/body.dart';
import 'package:flutter/material.dart';



class PartyInfoScreen extends StatelessWidget {

  final Party party;

  const PartyInfoScreen({
    required this.party
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme; 
    return Scaffold(
      backgroundColor: themeColor.primaryVariant,
      body: Body(party: party,),
    );
  }
}
