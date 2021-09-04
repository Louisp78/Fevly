import 'package:fevly/test/data_badge.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class BadgeVoteScreen extends StatelessWidget {
  const BadgeVoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          listOfBadgeToVote: badgeList3,
        ),
      ),
    );
  }
}
