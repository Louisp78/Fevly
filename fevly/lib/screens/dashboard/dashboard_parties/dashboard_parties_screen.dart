import 'package:fevly/constant/constant.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/components/accepted_parties.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/components/parties_invite.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPartiesScreen extends StatelessWidget {
  const DashboardPartiesScreen({
    Key? key,
    required this.partiesInvite,
    required this.partiesAccepted,
  }) : super(key: key);

  final List<Party> partiesInvite;
  final List<Party> partiesAccepted;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kBasicVerticalPadding(size: size) * 4,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: kBasicHorizontalPadding(size: size)),
              child: Text(
                "Invitations (3)",
                style: textTheme.headline3?.copyWith(color: kTextColor),
              ),
            ),
            SizedBox(
              height: kBasicVerticalPadding(size: size),
            ),
            /*PartiesInvite(
              parties: partiesInvite,
            ),*/
            AcceptedParties(
              parties: partiesAccepted,
            ),
          ],
        ),
      ),
    );
  }
}
