import 'package:fevly/screens/for_later/badge_vote/components/body.dart';
import 'package:fevly/test_data/data_badge.dart';
import 'package:flutter/material.dart';

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
