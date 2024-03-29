import 'package:fevly/models/party.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/components/custom_party_item.dart';
import 'package:flutter/material.dart';


class AcceptedParties extends StatelessWidget {
  const AcceptedParties({
    Key? key,
    required this.parties,
  }) : super(key: key);

  final List<Party> parties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: List.generate(
            parties.length,
            (index) => CustomPartyItem(
                  party: parties[index],
                )),
      ),
    );
  }
}
